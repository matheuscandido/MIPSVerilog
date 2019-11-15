`timescale 1ns/100ps

module multiplicador_TB;

reg clk, rst, St;
reg [15:0] mndo,mdor;//multiplicando,multiplicador
wire  done1;
wire [31:0] produto;

multiplicador DUT(
.clk(clk),
.rst(rst),
.St(St),
.mndo(mndo),
.mdor(mdor),
.done1(done1),
.produto(produto)


);


always
	
		begin
			clk <= 1;
			#25;
			clk <= 0;
			#25;
		end
		
		
		initial
		begin
		
		rst <= 1;
		#20;
		rst <= 0;
		#20;
		
		end
		
		
			initial
	
		begin
			St <= 0;
			mndo <=4'b1111;
			mdor <=4'b1111;
			#50;
			St <= 1;
			#50;
			
		
			#2000 $stop;
		end	
		
	endmodule	
		
		