`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:48 03/03/2025 
// Design Name: 
// Module Name:    ID 
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
module ID(
    input wire [31:0] Instr,      // Full instruction input
    input wire [31:0] PcIn,       // Program Counter Input
    input wire [31:0] AdderIn,    // Address for branch/jump
    input wire WriteEn,clk,           // Write enable signal

    output wire RegWrite, MemWrite, Jump, Branch, ALUSrc,
    output wire [1:0] ResultSrc,
    output wire [2:0] ALUControl,
    output wire [31:0] Rd1, Rd2, PcOut,
    output wire [4:0] Rs1, Rs2, Rd,
    output wire [31:0] ExtImm,    // Fixed: Should be 32-bit, not 5-bit
    output wire [31:0] AdderOut   // Address Output
);

//---------------------------------//
//----------Intermodule Wires-------//

// Instruction Parser Wires
wire [6:0] opcode;
wire [4:0] rd;
wire [2:0] funct3;
wire [4:0] rs1;
wire [4:0] rs2;
wire [6:0] funct7;
wire [31:0] imm;   // Immediate extracted from instruction

// Control Unit Wires
wire [1:0] ImmSrc;

// Register File Wires
wire [31:0] rd1, rd2;

// Immediate Extender Wire
wire [31:0] ImmExt;

//--------------------------------//
//---- Module Instantiations ----//

// **Instruction Parser Module**
ID_INSTR_PARSER parser (
    .instr(Instr),
    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7),
    .imm(imm) 
);

// **Control Unit Module**
ID_CU cu (
    .op(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .RegWrite(RegWrite),
    .ResultSrc(ResultSrc),
    .MemWrite(MemWrite),
    .Jump(Jump),
    .Branch(Branch),
    .ALUControl(ALUControl),
    .ALUSrc(ALUSrc),
    .ImmSrc(ImmSrc)
);

// **Register File Module**
ID_REGFILE regfile (
    .a1(rs1),  // Register source 1
    .a2(rs2),  // Register source 2
    .a3(rd),   // Destination register
    .rd1(rd1), // Output register 1
    .rd2(rd2), // Output register 2
    .wd3(AdderIn), // Data to be written
    .WriteEn(WriteEn),
    .clk(clk)
);

// **Immediate Extender Module**
ID_EXTEND extender (
    .instr(Instr),  // Full instruction input
    .ImmSrc(ImmSrc),  // Control signal for immediate type
    .ImmExt(ImmExt)  // Extended immediate output
);

//--------------------------------//
// Assignments for Outputs
assign Rs1 = rs1;
assign Rs2 = rs2;
assign Rd = rd;
assign Rd1 = rd1;
assign Rd2 = rd2;
assign ExtImm = ImmExt;
assign PcOut = PcIn; // Pass PC forward
assign AdderOut = AdderIn; // Pass address forward

endmodule
