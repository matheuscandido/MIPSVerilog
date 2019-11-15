	 
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
			cont <= 6'b100_000;
			else
			if(cont != 0)
			cont <= cont - 6'b000_001;
			else
			if(cont==0)
			k<=1;
		 end
	  
	 
	 
endmodule	
		
		