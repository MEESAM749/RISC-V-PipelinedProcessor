`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:04:06 03/03/2025 
// Design Name: 
// Module Name:    ID_EXTEND 
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
module ID_EXTEND (
    input wire [31:7] instr,  // Upper bits of the instruction
    input wire [1:0] ImmSrc,  // Control signal to select the immediate type
    output wire [31:0] ImmExt // Sign-extended immediate output
);

    reg [31:0] imm_out;

    always @(*) begin
        case (ImmSrc)
            2'b00: imm_out = {{20{instr[31]}}, instr[31:20]}; // I-type (Sign-extend 12-bit immediate)
            2'b01: imm_out = {{20{instr[31]}}, instr[31:25], instr[11:7]}; // S-type (Sign-extend 12-bit store offset)
            2'b10: imm_out = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0}; // B-type (Sign-extend 13-bit branch offset)
            2'b11: imm_out = {{11{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0}; // J-type (Sign-extend 21-bit jump offset)
            default: imm_out = 32'b0;
        endcase
    end

    assign ImmExt = imm_out;

endmodule
