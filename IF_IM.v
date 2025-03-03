`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:36:57 03/02/2025 
// Design Name: 
// Module Name:    IF_IM 
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
module IF_IM(
input wire [31:0] inst_addr,
output wire [31:0] inst_out
);

reg [31:0] instmem [31:0];

assign inst_out = instmem[inst_addr];


endmodule
