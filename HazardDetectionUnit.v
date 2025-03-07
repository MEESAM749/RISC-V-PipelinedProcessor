`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:27:42 03/08/2025 
// Design Name: 
// Module Name:    HazardDetectionUnit 
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
module HazardDetectionUnit (
    input wire MemRead_EX,         // MemRead signal from EX stage
    input wire [4:0] Rs1_ID,       // Source register 1 in ID stage
    input wire [4:0] Rs2_ID,       // Source register 2 in ID stage
    input wire [4:0] Rd_EX,        // Destination register in EX stage
    
    output reg PCWrite,            // Control signal to freeze PC update
    output reg IF_ID_Write,        // Control signal to freeze IF/ID register
    output reg ControlMuxSelect    // Control signal to select between NOP and actual control signals
);

    always @(*) begin
        // Default values (no stalling, normal execution)
        PCWrite = 1'b1;
        IF_ID_Write = 1'b1;
        ControlMuxSelect = 1'b1; // 1 means normal execution, 0 means insert NOP

        // Load-use hazard detection: If EX stage is reading from memory and its destination register
        // matches any of the source registers in ID stage, we must stall
        if (MemRead_EX && ((Rd_EX == Rs1_ID) || (Rd_EX == Rs2_ID)) && (Rd_EX != 0)) begin
            PCWrite = 1'b0;      // Freeze PC
            IF_ID_Write = 1'b0;  // Freeze IF/ID register
            ControlMuxSelect = 1'b0; // Insert a NOP by selecting default control signals
        end
    end

endmodule

