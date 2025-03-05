`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:11 03/05/2025 
// Design Name: 
// Module Name:    IM 
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
module IM(
input wire [31:0] ALUResult,WriteDataM,PCPlus4M,
input wire [4:0] RdM,
input wire [1:0] ResultSrcM,
input wire RegWriteM,MemWriteM,clk,
output wire RegWriteW,
output wire [1:0] ResultSrcW,
output wire [31:0] RDW1,
output wire [4:0] RdW,
output wire [31:0] PCPlus4W,
output wire [31:0] ALUResultW,
output wire RegWriteMtoForwardingUnit
);

IM_DATAMEM datamemory (
.A(ALUResult),
.WD(WriteDataM),
.clk(clk),
.MemWriteM(MemWriteM),
.RD(RDW1)
);

assign ALUResultW=ALUResult;
assign PCPlus4W=PCPlus4M;
assign RdW = RdM; 
assign RegWriteW = RegWriteM;
assign ResultSrcW=ResultSrcM;
assign RegWriteMtoForwardingUnit=ALUResult;
endmodule
