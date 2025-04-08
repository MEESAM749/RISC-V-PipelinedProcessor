`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:11:22 03/08/2025 
// Design Name: 
// Module Name:    IF_ID_REG 
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
module IF_ID_Register (
    input wire clk,                // Clock input
    input wire reset,              // Reset signal
    input wire stall,              // Stall signal (for hazard handling)
    input wire [31:0] PC_in,       // Program counter input
    input wire [31:0] instruction_in,adder_in, // Instruction input
    output reg [31:0] PC_out,adder_out,      // Program counter output
    output reg [31:0] instruction_out // Instruction output
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            PC_out <= 32'b0;
            instruction_out <= 32'b0;
				adder_out <= 32'b0;
        end
        else if (!stall) begin
            PC_out <= PC_in;
            instruction_out <= instruction_in;
				adder_out <= adder_in;
        end
    end

endmodule
