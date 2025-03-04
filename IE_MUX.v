`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:59:16 03/04/2025 
// Design Name: 
// Module Name:    IE_MUX 
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
module IE_MUX3x1(
input wire [31:0] in1,in2,in3,
input wire [1:0] select,
output reg [31:0] out
);

always@(*)
begin
if(select == 0)
out <= in1;
else if (select == 1)
out <= in2;
else if (select == 2)
out <= in3;
else
out <= 0;
end


endmodule
