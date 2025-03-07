`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:18:20 03/08/2025 
// Design Name: 
// Module Name:    MEM_WB_Register 
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
module MEM_WB_Register (
    input wire clk,                // Clock input
    input wire reset,              // Reset signal
    // Control signals from Memory stage
    input wire RegWrite_in,        // Register write control
    input wire MemtoReg_in,        // Memory to register control
    // Data from Memory stage
    input wire [31:0] ReadData_in, // Data read from memory
    input wire [31:0] ALUResult_in, // ALU result
    input wire [4:0] Rd_in,        // Destination register
    
    // Control signals to Writeback stage
    output reg RegWrite_out,
    output reg MemtoReg_out,
    // Data to Writeback stage
    output reg [31:0] ReadData_out,
    output reg [31:0] ALUResult_out,
    output reg [4:0] Rd_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset control signals
            RegWrite_out <= 1'b0;
            MemtoReg_out <= 1'b0;
            
            // Reset data
            ReadData_out <= 32'b0;
            ALUResult_out <= 32'b0;
            Rd_out <= 5'b0;
        end
        else begin
            // Transfer control signals
            RegWrite_out <= RegWrite_in;
            MemtoReg_out <= MemtoReg_in;
            
            // Transfer data
            ReadData_out <= ReadData_in;
            ALUResult_out <= ALUResult_in;
            Rd_out <= Rd_in;
        end
    end

endmodule
