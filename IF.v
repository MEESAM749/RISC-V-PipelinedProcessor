`timescale 1ns / 1ps
module IF(
input wire clk,reset,
input wire [31:0] mux1in, // Comes from 4th Stage
input wire mux1select,
output wire [31:0] interstage_pcout,interstage_imout,interstage_adderout
);

//Intermodule Wires//

//-----------------------------------------//

//MUX1_WIRES//
wire [31:0] mux1out;

//--------//
//PC_WIRES//
wire [31:0] pcout;
//--------//
//ADDER_WIRES//
wire [31:0] adderout;
//--------//
//IM_WIRES//
wire [31:0] imout;
//--------//

//-----------------------------------------//

//Module Calling//
//-----------------------------------------//

IF_MUX1 mux1 (
.in0(adderout),
.in1(mux1in),
.select(mux1select),
.out(mux1out)
);

IF_PC pc (
.clk(clk),
.reset(reset),
.pc_in(mux1out),
.pc_out(pcout)
);

IF_ADDER1 adder(
.in1(pcout),
.out(adderout)
);

IF_IM im (
.inst_addr(pcout),
.inst_out(imout)
);

//-----------------------------------------//

assign interstage_pcout = pcout;
assign interstage_imout = imout;
assign interstage_adderout = adderout;
endmodule
