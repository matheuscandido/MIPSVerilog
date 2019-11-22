`timescale 1ns/10ps
module addressdecoder_TB();

	reg [31:0] in ;
	wire cs;
	wire [31:0] out;
	
	addressdecoder DUT(
		.in(in),
		.out(out),
		.cs(cs)
	);
	
	initial begin
	
		in = 'h380;
		#100 in = 32'h1000;
		#100 in = 32'h1002;
		#100 in = 32'h2000;
		#100 in = 32'h2fff;
		#800 $stop;
			
	end
	
	
endmodule