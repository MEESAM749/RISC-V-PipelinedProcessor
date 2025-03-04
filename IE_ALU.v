`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:01 03/04/2025 
// Design Name: 
// Module Name:    IE_ALU 
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
module IE_ALU(
    input wire [31:0] SrcA,     // 32-bit input A
    input wire [31:0] SrcB,     // 32-bit input B
    input wire [2:0] ALUControl, // ALU control signal (3-bits)
    output reg [31:0] ALUResult,  // 32-bit ALU result
    output reg Zero
);

    always @(*) begin
        case (ALUControl)
            3'b000: ALUResult = SrcA + SrcB;          // ADD
            3'b001: ALUResult = SrcA - SrcB;          // SUB
            3'b010: ALUResult = SrcA & SrcB;          // AND
            3'b011: ALUResult = SrcA | SrcB;          // OR
            3'b100: ALUResult = SrcA ^ SrcB;          // XOR
            3'b101: ALUResult = (SrcA < SrcB) ? 32'b1 : 32'b0; // SLT
            3'b110: ALUResult = SrcA << SrcB[4:0];    // SLL
            3'b111: ALUResult = SrcA >> SrcB[4:0];    // SRL
				default: ALUResult = 32'b0;               // Default case to avoid latches
        endcase
		  if(ALUResult==0)
		  Zero = 1;
		  else
		  Zero = 0;
    end
endmodule
