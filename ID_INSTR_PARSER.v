`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:23:06 03/02/2025 
// Design Name: 
// Module Name:    ID_INSTR_PARSER 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ID_INSTR_PARSER(
    input wire [31:0] instr,
    output reg [6:0] opcode,
    output reg [4:0] rd,
    output reg [2:0] funct3,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [6:0] funct7,
    output reg [31:0] imm,
	 output wire [4:0] a1,a2
);

assign a1 = instr[19:15];
assign a2 = instr[24:20];

    always @(*) begin
        opcode = instr[6:0];

        // Default values (avoid latches)
        rd = 5'b0;
        funct3 = 3'b0;
        rs1 = 5'b0;
        rs2 = 5'b0;
        funct7 = 7'b0;
        imm = 32'b0;

        if (opcode == 7'b0110011) begin // R-type
            rd     = instr[11:7];
            funct3 = instr[14:12];
            rs1    = instr[19:15];
            rs2    = instr[24:20];
            funct7 = instr[31:25];
        end 
        else if (opcode == 7'b0010011 || opcode == 7'b0000011 || opcode == 7'b1100111) begin // I-type
            rd     = instr[11:7];
            funct3 = instr[14:12];
            rs1    = instr[19:15];
            imm    = {{20{instr[31]}}, instr[31:20]}; // Sign-extend
        end 
        else if (opcode == 7'b0100011) begin // S-type
            funct3 = instr[14:12];
            rs1    = instr[19:15];
            rs2    = instr[24:20];
            imm    = {{20{instr[31]}}, instr[31:25], instr[11:7]}; // Sign-extend
        end 
        else if (opcode == 7'b1100011) begin // B-type (Branch)
            funct3 = instr[14:12];
            rs1    = instr[19:15];
            rs2    = instr[24:20];
            imm    = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0}; // Sign-extend, shift left 1
        end 
        else if (opcode == 7'b0110111 || opcode == 7'b0010111) begin // U-type (LUI, AUIPC)
            rd  = instr[11:7];
            imm = {instr[31:12], 12'b0}; // Upper 20 bits, shift left 12
        end 
        else if (opcode == 7'b1101111) begin // J-type (JAL)
            rd  = instr[11:7];
            imm = {{11{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0}; // Sign-extend, shift left 1
        end 
    end
endmodule
