`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:16:33 03/08/2025 
// Design Name: 
// Module Name:    ID_EX_Register 
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
module ID_EX_Register (
    input wire clk,                // Clock input
    input wire reset,              // Reset signal
    // Control signals from Decode stage
    input wire RegWrite_in,        // Register write control
    input wire MemtoReg_in,        // Memory to register control
    input wire MemWrite_in,        // Memory write control
    input wire MemRead_in,         // Memory read control
    input wire [3:0] ALUOp_in,     // ALU operation control
    input wire ALUSrc_in,          // ALU source control
    input wire Branch_in,          // Branch control
    input wire Jump_in,            // Jump control
    // Data from Decode stage
    input wire [31:0] PC_in,       // Program counter
    input wire [31:0] ReadData1_in, // Register data 1
    input wire [31:0] ReadData2_in, // Register data 2
    input wire [31:0] Imm_in,      // Immediate value
    input wire [4:0] Rs1_in,       // Source register 1
    input wire [4:0] Rs2_in,       // Source register 2
    input wire [4:0] Rd_in,        // Destination register
    input wire [2:0] funct3_in,    // Function 3 field
    input wire [6:0] funct7_in,    // Function 7 field
    
    // Control signals to Execute stage
    output reg RegWrite_out,
    output reg MemtoReg_out,
    output reg MemWrite_out,
    output reg MemRead_out,
    output reg [3:0] ALUOp_out,
    output reg ALUSrc_out,
    output reg Branch_out,
    output reg Jump_out,
    // Data to Execute stage
    output reg [31:0] PC_out,
    output reg [31:0] ReadData1_out,
    output reg [31:0] ReadData2_out,
    output reg [31:0] Imm_out,
    output reg [4:0] Rs1_out,
    output reg [4:0] Rs2_out,
    output reg [4:0] Rd_out,
    output reg [2:0] funct3_out,
    output reg [6:0] funct7_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset control signals
            RegWrite_out <= 1'b0;
            MemtoReg_out <= 1'b0;
            MemWrite_out <= 1'b0;
            MemRead_out <= 1'b0;
            ALUOp_out <= 4'b0;
            ALUSrc_out <= 1'b0;
            Branch_out <= 1'b0;
            Jump_out <= 1'b0;
            
            // Reset data
            PC_out <= 32'b0;
            ReadData1_out <= 32'b0;
            ReadData2_out <= 32'b0;
            Imm_out <= 32'b0;
            Rs1_out <= 5'b0;
            Rs2_out <= 5'b0;
            Rd_out <= 5'b0;
            funct3_out <= 3'b0;
            funct7_out <= 7'b0;
        end
        else begin
            // Transfer control signals
            RegWrite_out <= RegWrite_in;
            MemtoReg_out <= MemtoReg_in;
            MemWrite_out <= MemWrite_in;
            MemRead_out <= MemRead_in;
            ALUOp_out <= ALUOp_in;
            ALUSrc_out <= ALUSrc_in;
            Branch_out <= Branch_in;
            Jump_out <= Jump_in;
            
            // Transfer data
            PC_out <= PC_in;
            ReadData1_out <= ReadData1_in;
            ReadData2_out <= ReadData2_in;
            Imm_out <= Imm_in;
            Rs1_out <= Rs1_in;
            Rs2_out <= Rs2_in;
            Rd_out <= Rd_in;
            funct3_out <= funct3_in;
            funct7_out <= funct7_in;
        end
    end

endmodule
