`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:14:28 03/05/2025 
// Design Name: 
// Module Name:    IM_DATAMEM 
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
module IM_DATAMEM(
input wire [31:0] A,
input wire [31:0] WD,
input wire clk,MemWriteM,
output reg [31:0] RD
);

reg [31:0] datamemory [31:0];

always@(posedge clk)
begin
if(MemWriteM)
datamemory[A] = WD;
end 

endmodule
