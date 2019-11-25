`timescale 1ns/100ps
module cpu_TB;

	reg clk,rst;
	reg clkMul;
	reg [31:0] external_memory;
	
	
	
	cpu DUT (
	
	.clk(clk),
	.rst(rst),
	.clkMul(clkMul),
	.external_memory(external_memory)
	
	
	);
	
	
	always
	
		begin
			clkMul <= 1;
			#1;
			clkMul <= 0;
			#1;
		end
		
		always
	
		begin
			clk <= 1;
			#68;
			clk <= 0;
			#68;
		end
		
		initial
			begin
			
			rst <= 1;
			#136;
			rst <= 0;
			#136;
		
		   end
			initial
			begin
			#2000;
			$stop;
			end
	endmodule 
		
		