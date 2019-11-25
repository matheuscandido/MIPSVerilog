`timescale 1ns/10ps
module alu_TB();

reg[31:0] A;
reg[31:0] B;
reg [1:0]op;
wire[31:0] out;

alu ALU(
	A,
	B,
	op,
	out
);

integer i;

initial begin

	A <= 10;
	B <= 20;
	op <= 2'b00;
	
	#300
	op <= 2'b01;
	#300
	op <= 2'b10;
	#300
	op <= 2'b11;
	#600 $stop;
end

endmodule