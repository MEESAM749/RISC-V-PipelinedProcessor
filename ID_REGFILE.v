`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:03 03/03/2025 
// Design Name: 
// Module Name:    ID_REGFILE 
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
module ID_REGFILE (
    input wire [4:0] a1, a2, a3, // Register addresses
    output wire [31:0] rd1, rd2, // Register outputs
    input wire [31:0] wd3,       // Write data
    input wire WriteEn, clk      // Write enable and clock
);

    reg [31:0] regfile [31:0]; // 32 registers, each 32-bit wide

    // **Asynchronous Read**: Read register values directly
    assign rd1 = regfile[a1];
    assign rd2 = regfile[a2];

    // **Synchronous Write**: Only write on positive clock edge
    always @(posedge clk) begin
        if (WriteEn && a3 != 5'b00000)  // Prevent writing to x0
            regfile[a3] <= wd3;
    end

endmodule
