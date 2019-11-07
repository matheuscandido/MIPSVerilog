	 
module counter
#(parameter WIDTH = 4)
(  input clk, rst, load, 
	input [WIDTH-1:0] dload,
	output reg k
);
	 
	 reg [WIDTH-1:0] cont;
	 
	 
	 
	 always@(posedge clk or posedge rst)
		 begin
		 if(rst)
			k<=0;
			else
			if(load)
			cont <= 4'b1000;
			else
			if(cont != 0)
			cont <= cont - 4'b0001;
			else
			if(cont==0)
			k<=1;
		 end
	  
	 
	 
endmodule	
		
		