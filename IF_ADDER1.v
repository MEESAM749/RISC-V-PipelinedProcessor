`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:35:36 03/02/2025 
// Design Name: 
// Module Name:    IF_ADDER1 
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
module IF_ADDER1(
input wire [31:0] in1,
output wire [31:0] out
);
assign out = in1+4;
endmodule
