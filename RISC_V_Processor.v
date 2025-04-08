module RISC_V_Processor (
input wire clk,reset,
output wire out1
);

//Intermodule Wires
wire [31:0] ifmuxin;
wire ifmuxselect;
wire [31:0] ifpcout,ifimout,ifadderout;

wire ifidstall;
wire [31:0] ifidadderout;
wire [31:0] ifidpcout,ifidinstructionout;

wire idmodulewriteen;
wire idmoduleregwrite,idmodulememwrite,idmoudlejump,idmodulebranch,idmodulealusrc;
wire [1:0] idmoduleresultsrc;
wire [2:0] idmoduelalucontrol;
wire [31:0] idmodulerd1,idmodulerd2,idmodulepcout;
wire [4:0] idmodulers1,idmodulers2,idmodulerd;
wire [31:0] idmoduleextimmout,idmoduleadderout;

 

//-----------------

IF ifmodule (
.clk(clk),
.reset(reset),
.mux1in(ifmuxin),
.mux1select(ifmuxselect),
.interstage_pcout(ifpcout),
.interstage_imout(ifimout),
.interstage_adderout(ifadderout)
);

IF_ID_Register ifidmodule (
.clk(clk),                // Clock input
.reset(reset),              // Reset signal
.stall(ifidstall),              // Stall signal (for hazard handling)
.PC_in(ifpcout),       // Program counter input
.instruction_in(ifimout),
.adder_in(ifadderout),
.adder_out(ifidadderout),
.PC_out(ifidpcout),      // Program counter output
.instruction_out(ifidinstructionout) // Instruction output
);

ID idmodule (
.Instr(ifidinstructionout),      // Full instruction input
.PcIn(ifidpcout),       // Program Counter Input
.AdderIn(ifidadderout),    // Address for branch/jump
.WriteEn(idmodulewriteen),
.clk(clk),           // Write enable signal
.RegWrite(idmoduleregwrite),
.MemWrite(idmodulememwrite),
.Jump(idmoudlejump),
.Branch(idmodulebranch),
.ALUSrc(idmodulealusrc), 
.ResultSrc(idmoduleresultsrc),
.ALUControl(idmoduelalucontrol), 
.Rd1(idmodulerd1), 
.Rd2(idmodulerd2), 
.PcOut(idmodulepcout),
.Rs1(idmodulers1), 
.Rs2(idmodulers2), 
.Rd(idmodulerd),
.ExtImm(idmoduleextimmout),    // Fixed: Should be 32-bit, not 5-bit
.AdderOut(idmoduleadderout)
);



assign out1 = idmoduleadderout;









endmodule
