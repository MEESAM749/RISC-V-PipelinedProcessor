`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:31:12 03/02/2025 
// Design Name: 
// Module Name:    IF_PC 
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
module IF_PC(
input wire clk,reset,
input wire [31:0] pc_in,
output reg [31:0] pc_out
);
initial
begin
pc_out = 0;
end
always@(posedge clk)
begin
pc_out <= pc_in;
end
endmodule
