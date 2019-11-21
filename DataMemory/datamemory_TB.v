`timescale 1ns/10ps

module datamemory_TB();

reg clk;
reg rw;
reg [9:0] address;
reg [31:0] dataInput;
wire[31:0] mOutput;
	
datamemory DUT (
	.clk(clk),
	.rw(rw),
	.addr(address),
	.din(dataInput),
	.S_datamemory(mOutput)
);
 
 
integer i, j;
 
initial begin	 
	 clk = 0;
	 
	 // Testando escrita
	 #100 rw = 1; 
	 for (i=0; i<=10; i=i+1) begin
		 #100 
		 dataInput = i;
		 address = i;
	 end
	 
	 // Testando leitura
	 #100 rw = 0;
	 for (j=0; j<=10; j=j+1) begin
		#100 address = j;
	 end
	 
	 #2000 $stop;
end
	
always #50 clk = ~clk;	
	 	
endmodule
