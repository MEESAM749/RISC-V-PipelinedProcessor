`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:50 03/04/2025 
// Design Name: 
// Module Name:    IE 
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
module IE(
input wire RegWrite,MemWrite,Jump,Branch,ALUSrc,
input wire [1:0] ResultSrc,ForwardA,ForwardB,
input wire [2:0] ALUControl,
input wire [31:0] RD1,RD2,PCE,EXTIMME,ForwardIn2,ForwardIn3,PCPLUS4D,
input wire [4:0] RS1E,RS2E,RDE,
output wire [31:0] ALUResult,WriteData,PCTarget,PCPLUS4DOut,
output wire RegWriteOut,MemWriteOut,PCSrcOut,
output wire [1:0] ResultSrcOut,
output wire [4:0] RS2EOut,RS1EOut,RDEOut
);

//Intermodule Wires//
//FirstMux//
wire [31:0] FwA;
//SecondMux//
wire [31:0] FwB;
wire [31:0] FwBb;
//ALU//
wire [31:0] ALUResult1;
wire Zero;
//small combinational block//
wire pcsrce;

IE_MUX3x1 forwardA (
.in1(RD1),
.in2(ForwardIn2),
.in3(ForwardIn3),
.select(ForwardA),
.out(FwA)
);

IE_MUX3x1 forwardB (
.in1(RD2),
.in2(ForwardIn2),
.in3(ForwardIn3),
.select(ForwardB),
.out(FwB)
);

IE_MUX2x1 ForwardBb (
.in1(FwB),
.in2(EXTIMME),
.select(ALUSrc),
.out(FwBb)
);

IE_ADDER adder ( 
.pc(PCE),
.extimm(EXTIMME),
.out(PCTarget)
);

IE_ALU alu (
    .SrcA(FwA),     // 32-bit input A
    .SrcB(FwBb),     // 32-bit input B
    .ALUControl(ALUControl), // ALU control signal (3-bits)
    .ALUResult(ALUResult1),  // 32-bit ALU result
    .Zero(Zero)
);

IE_PCSRC pcsrc ( 
.jump(Jump),
.branch(Branch),
.zeroflag(Zero),
.PcSrc(pcsrce)
);

assign RS2EOut=RS2E;
assign RS1EOut=RS1E;
assign RDEOut=RDE;
assign PCPLUS4D=PCE;
assign RegWriteOut=RegWrite;
assign MemWriteOut=MemWrite;
assign PCSrcOut=pcsrce;
assign ResultSrcOut=ResultSrc;
assign WriteData=FwB;
endmodule
