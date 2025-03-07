`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:17:18 03/08/2025 
// Design Name: 
// Module Name:    EX_MEM_Register 
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
module EX_MEM_Register (
    input wire clk,                // Clock input
    input wire reset,              // Reset signal
    // Control signals from Execute stage
    input wire RegWrite_in,        // Register write control
    input wire MemtoReg_in,        // Memory to register control
    input wire MemWrite_in,        // Memory write control
    input wire MemRead_in,         // Memory read control
    // Data from Execute stage
    input wire [31:0] ALUResult_in, // ALU result
    input wire [31:0] WriteData_in, // Data to write to memory
    input wire [4:0] Rd_in,        // Destination register
    input wire ZeroE_in,           // Zero flag from ALU
    input wire [2:0] funct3_in,    // Function 3 field (for load/store type)
    
    // Control signals to Memory stage
    output reg RegWrite_out,
    output reg MemtoReg_out,
    output reg MemWrite_out,
    output reg MemRead_out,
    // Data to Memory stage
    output reg [31:0] ALUResult_out,
    output reg [31:0] WriteData_out,
    output reg [4:0] Rd_out,
    output reg ZeroE_out,
    output reg [2:0] funct3_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset control signals
            RegWrite_out <= 1'b0;
            MemtoReg_out <= 1'b0;
            MemWrite_out <= 1'b0;
            MemRead_out <= 1'b0;
            
            // Reset data
            ALUResult_out <= 32'b0;
            WriteData_out <= 32'b0;
            Rd_out <= 5'b0;
            ZeroE_out <= 1'b0;
            funct3_out <= 3'b0;
        end
        else begin
            // Transfer control signals
            RegWrite_out <= RegWrite_in;
            MemtoReg_out <= MemtoReg_in;
            MemWrite_out <= MemWrite_in;
            MemRead_out <= MemRead_in;
            
            // Transfer data
            ALUResult_out <= ALUResult_in;
            WriteData_out <= WriteData_in;
            Rd_out <= Rd_in;
            ZeroE_out <= ZeroE_in;
            funct3_out <= funct3_in;
        end
    end

endmodule
