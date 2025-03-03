`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:37 03/03/2025 
// Design Name: 
// Module Name:    ID_CU 
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
module ID_CU(
    input wire [6:0] op,
    input wire [2:0] funct3,  // Fixed size (14:12 is just 3 bits)
    input wire [6:0] funct7,
    output reg RegWrite,
    output reg [1:0] ResultSrc,
    output reg MemWrite,
    output reg Jump,
    output reg Branch,
    output reg [2:0] ALUControl,
    output reg ALUSrc,
    output reg [1:0] ImmSrc
);

    reg [1:0] ALUOp;

    always @(*) begin
        // Default values
        RegWrite = 1'b0;
        MemWrite = 1'b0;
        Jump = 1'b0;
        Branch = 1'b0;
        ResultSrc = 2'b00;
        ALUControl = 3'b000;
        ALUSrc = 1'b0;
        ImmSrc = 2'b00;
        ALUOp = 2'b00;

        case (op)
            7'b0110011: begin  // R-type (e.g., add, sub, and, or, slt)
                RegWrite = 1'b1;
                ALUOp = 2'b10;  // ALU operation determined by funct3 & funct7
            end

            7'b0000011: begin  // I-type Load (e.g., lw)
                RegWrite = 1'b1;
                ResultSrc = 2'b01; // Load from memory
                ALUSrc = 1'b1;
                ImmSrc = 2'b00;  // I-type immediate
            end

            7'b0100011: begin  // S-type Store (e.g., sw)
                MemWrite = 1'b1;
                ALUSrc = 1'b1;
                ImmSrc = 2'b01; // S-type immediate
            end

            7'b1100011: begin  // B-type Branch (e.g., beq)
                Branch = 1'b1;
                ALUOp = 2'b01;  // Use ALU for comparison
                ImmSrc = 2'b10; // B-type immediate
            end

            7'b1101111: begin  // J-type Jump (e.g., jal)
                Jump = 1'b1;
                RegWrite = 1'b1;
                ResultSrc = 2'b10; // PC + 4 stored in rd
                ImmSrc = 2'b11; // J-type immediate
            end
        endcase

        // **ALU Control Logic**
        case (ALUOp)
            2'b00: ALUControl = 3'b000; // Default: ADD (for lw, sw, jal)
            2'b01: ALUControl = 3'b001; // Branch: SUB
            2'b10: begin
                case (funct3)
                    3'b000: ALUControl = (funct7[5]) ? 3'b001 : 3'b000; // SUB (if funct7[5] = 1), else ADD
                    3'b111: ALUControl = 3'b010; // AND
                    3'b110: ALUControl = 3'b011; // OR
                    3'b010: ALUControl = 3'b100; // SLT
                    default: ALUControl = 3'b000; // Default ADD
                endcase
            end
        endcase
    end
endmodule
