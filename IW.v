`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:26 03/05/2025 
// Design Name: 
// Module Name:    IW 
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
module IW(
input wire RegWrtieW,
input wire [1:0] ResultSrcW,
input wire [31:0] ReadDataW,ALUResultM,
input wire [4:0] RdW,
input wire [31:0] PCPlus4W,
output wire RegWriteWout,HazardUnit,
output wire [31:0] ResultW,
output wire [4:0] RdWhazard
);

IW_MUX mux ( 
.in1(ALUResultM),
.in2(ReadDataW),
.in3(PCPlus4W),
.select(ResultSrcW),
.out(ResultW)
);

assign RegWriteWout=RegWrtieW;
assign HazardUnit=RegWrtieW;
assign RdWhazard=RdW;

endmodule
