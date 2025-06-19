`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2025 11:25:56 PM
// Design Name: 
// Module Name: ALU_operation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_operation(alu_result,carry_flag,in_a,in_b,opcode);
    input [7:0]in_a,in_b; //input operands 
    input [4:0]opcode;      // opcode for what operation want to do
    output [7:0]alu_result;  //output operand
    output carry_flag; //carry flag used to detect overflow while addtion
    reg [7:0]alu_out;
    wire [8:0]temp;
assign alu_result=alu_out;
assign temp={1'b0,in_a}+{1'b0,in_b};
assign carry_flag=temp[8];
always@(*)
begin
    case(opcode)
    5'b00000: alu_out=in_a+in_b;  //addition
    5'b00001: alu_out=in_a-in_b;  //subtraction
    5'b00010: alu_out=in_a*in_b;  //multiplication
    5'b00011: alu_out=in_a/in_b;  //division
    5'b00100: alu_out=in_a%in_b;  //modulus
    5'b00101: alu_out=in_a&in_b;  //logical AND
    5'b00110: alu_out=in_a|in_b;  //logical OR
    5'b00111: alu_out=~(in_a&in_b);  //logical NAND
    5'b01000: alu_out=~(in_a|in_b);  //logical NOR
    5'b01001: alu_out=in_a^in_b;  //logical XOR
    5'b01010: alu_out=~(in_a^in_b);  //logical XNOR
    5'b01011: alu_out=in_a>>4;      //rightshift by 4
    5'b01100: alu_out=in_a<<4;      //leftshift by 4
    5'b01101: alu_out={in_a[0],in_a[7:1]};  //rotate right
    5'b01110: alu_out={in_a[6:0],in_a[7]}; //rotate left
    5'b01111: alu_out=(in_a==in_b)?8'b1:8'b0; //equality comparison
    5'b10000: alu_out=(in_a>in_b)?8'b1:8'b0; //greater comparison
    5'b10001: alu_out=(in_a<in_b)?8'b1:8'b0; //lesser comparison
    5'b10010: alu_out=in_a+1;      //increament
    5'b10011: alu_out=in_a-1;      //decreament
    5'b10100: alu_out=(8'b11111111-in_a)+1'b1;  //negate(2's complement)
    default: alu_out=8'b00000000;
    endcase
end
endmodule
