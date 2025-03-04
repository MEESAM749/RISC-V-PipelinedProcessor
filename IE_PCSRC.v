`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:50 03/04/2025 
// Design Name: 
// Module Name:    IE_PCSRC 
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
module IE_PCSRC(
input wire jump,branch,zeroflag,
output wire PcSrc
);

assign PcSrc=(branch&zeroflag)|jump;



endmodule
