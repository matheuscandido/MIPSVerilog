`timescale 1ns/10ps

module Register_TB;

	reg clk;
	reg reset;
	reg [31:0] data_in;
	wire [31:0] data_out;
	

	Register	DUT(
	
	.clk(clk),
	.reset(reset),
	.data_in(data_in),
	.data_out(data_out)
	
	);


initial
		begin
		
		reset <= 1;
		#20;
		reset <= 0;
		#20;
		
		end	
	
	
	always 


		begin
			clk <= 1;
			#25;
			clk <= 0;
			#25;
		end
		
		
		initial
	
			begin
			#200
			data_in <= 32'd55;
			$display("data_in = %x, data_out = %x", data_in, data_out);
			#100
			data_in <= 32'd44;
			$display("data_in = %x, data_out = %x", data_in, data_out);
			#100
			$stop;
			end
		
endmodule
		
		
		