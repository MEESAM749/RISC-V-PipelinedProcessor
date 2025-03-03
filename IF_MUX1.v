`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:23 03/02/2025 
// Design Name: 
// Module Name:    IF_MUX1 
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
module IF_MUX1(
input wire [31:0] in0,
input wire [31:0] in1,
input wire select,
output wire [31:0] out
);

assign out = (select) ? in1:in0;


endmodule
