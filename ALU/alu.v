module alu(
	input[31:0] A,
	input[31:0] B,
	input [1:0]op,
	output[31:0] out
);

assign out = 
	op == 2'b00 ? A + B
	: op == 2'b01 ? A - B
	: op == 2'b10 ? A & B
	: op == 2'b11 ? A | B
	: 0;
endmodule
