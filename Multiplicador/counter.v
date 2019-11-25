	 
module counter
#(parameter WIDTH = 6)
(  input clk, rst, load, 
	output reg k
);
	 
	 reg [WIDTH-1:0] cont;
	 
	 
	 
	 always@(posedge clk or posedge rst)
		 begin
		 if(rst)
			k<=0;
			else
			if(load)
			begin
			cont <= 6'b100_000;
			k<=0;
			end
			else
			if(cont != 0)
			cont <= cont - 6'b000_001;
			else
			if(cont==0)
			begin
			cont <= 6'b100_000;
			k<=1;
			end
		 end
	  
	 
	 
endmodule	
		
		