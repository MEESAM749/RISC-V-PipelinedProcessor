`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:02:30 03/04/2025 
// Design Name: 
// Module Name:    IE_MUX2x1 
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
module IE_MUX2x1(
input wire [31:0] in1,in2,
output reg [31:0] out,
input wire select
);

always@(*)
begin
if(select==0)
out<=in1;
else if (select == 1)
out<=in2;
else 
out<=0;
end

endmodule
