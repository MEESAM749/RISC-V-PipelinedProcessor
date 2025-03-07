`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:24:11 03/08/2025 
// Design Name: 
// Module Name:    RISC_V_Processor 
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
module RISC_V_Processor (
input wire clk,reset
);

IF If(

);

IF_ID_Register ifidreg(

);

ID id (
);

ID_EX_Register idex (

);
    
IE ie (

);

EX_MEM_Register exmemreg (

);

IM im (

);
MEM_WB_Register memwbreg (

);

IW iw (

);
 
HazardDetectionUnit hdu (

); 
endmodule