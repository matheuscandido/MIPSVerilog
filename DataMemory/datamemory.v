//module datamemory(clk, rw, address, dataInput, mRegister);
//							
//parameter WORD_SIZE 	= 32 ;	// 32bit word
//parameter ADDRESS_SIZE = 10 ;	// 1k words
//
//input rw, clk; // read = 0, write = 1
//
//input [WORD_SIZE-1:0] dataInput ;
//input [ADDRESS_SIZE-1:0] address;
//
//output reg[WORD_SIZE-1:0] mRegister;
//
//reg [WORD_SIZE-1:0] memory[0:1024];
//
//// Inicializando dados A, B, C e D na memória
//initial begin
//	memory[32'd0] = 32'd2001; //A
//	memory[32'd1] = 32'd4001; //B
//	memory[32'd2] = 32'd5001; //C
//	memory[32'd3] = 32'd3001; //D		
//end
//
//always @ (posedge clk) begin
//	 if (rw) // se 1, write
//		memory[address] = dataInput;
//	else // se 0, read
//		mRegister = memory[address];
//end
//
//endmodule

module datamemory(
	input[9:0] addr,
	input[31:0] din,
	input rw, clk,
	output reg[31:0] S_datamemory
);
	parameter numLinhas = 1024;
	
	parameter numBits = 32;
	
	reg[numBits-1:0] M [0: (1 << $clog2(numLinhas)) -1];
	
	always @(posedge clk) begin
		if (rw) M[addr] = din;
		else S_datamemory = M[addr];
	end
	
endmodule
