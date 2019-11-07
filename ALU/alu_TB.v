`timescale 1ns/10ps
module alu_TB();

reg[31:0] A;
reg[31:0] B;
reg op;
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
	op <= 0;
	
	#300
	op <= 1;
		
	#600 $stop;
end

endmodule