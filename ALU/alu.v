module alu(
	input[31:0] A,
	input[31:0] B,
	input op,
	output[31:0] out
);

assign out = 
	op == 0 ? A + B
	: op == 1 ? A - B
	: 0;
endmodule
