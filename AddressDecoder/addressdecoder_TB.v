`timescale 1ns/10ps
module addressdecoder_TB();

	reg [31:0] in ;
	wire cs;
	
	addressdecoder DUT(
		.in(in),
		.cs(cs)
	);
	
	initial begin
	
		in = 32'h1400;
		#100 in = 32'h13ff;
		#200 in = 32'h1000;
		#300 in = 32'h1001;
		#400 in = 32'h2000;
		#2000 $stop;
			
	end
	
	
endmodule