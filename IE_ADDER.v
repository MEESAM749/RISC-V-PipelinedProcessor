`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:13 03/04/2025 
// Design Name: 
// Module Name:    IE_ADDER 
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
module IE_ADDER(
input wire [31:0] pc,extimm,
output wire [31:0] out
);
assign out = pc+extimm;
endmodule
