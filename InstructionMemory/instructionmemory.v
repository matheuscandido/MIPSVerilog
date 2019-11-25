module instructionmemory(
	input clk, 
	input[9:0] pc, 
	output reg[31:0] out
);

// Tamanho da memória do programa, 1k words	
reg [31:0] instructionMemory [0:999];

initial begin

	/*
	- s0 a s7, 0 a 7 
	- t0 a t7, 8 a 15
	- s0 será usado para o offset 0
	
	lw $s1, 1000($s0) // carrega A no s1
	lw $s2, 1001($s0) // carrega B no s2
	lw $s3, 1002($s0) // carrega C no s3
	lw $s4, 1003($s0) // carrega D no s4
	lw	$s5, 2000($s0) // carrega endereço da última posição de memória em s5
	
	mul $t0, $s1, $s2
	add $t1, $s3, $s4
	sub $t2, $t0, $t1
	
	sw $t2, 0($s5)
	*/
	
	//								  grupo+1  rs    rt       offset
	instructionMemory[0] = 32'b000010_00000_00001_0001000000000000; //lw $s1, 1000($s0) // carrega A no s1
	instructionMemory[1] = 32'b000010_00000_00010_0001000000000001; //lw $s2, 1001($s0) // carrega B no s2
	
	instructionMemory[2] = 32'b000010_00000_00011_0001000000000010; //lw $s3, 1002($s0) // carrega C no s3 
	instructionMemory[3] = 32'b000010_00000_00100_0001000000000011; //lw $s4, 1003($s0) // carrega D no s4
	
	
	
	instructionMemory[4] = 32'b000001_00000_00000_0000000000011111;//NOP
	
	//								  grupo    rs    rt    rd     10    val
	instructionMemory[5] = 32'b000001_00001_00010_01000_00000_110010;//mul $t0, $s1, $s2 
	
	
	instructionMemory[6] = 32'b000001_00000_00000_0000000000011111;//NOP
	
	
	instructionMemory[7] = 32'b000001_00011_00100_01001_00000_100000;//add $t1, $s3, $s4

	
	instructionMemory[8] = 32'b000001_00000_00000_0000000000011111;//NOP
	instructionMemory[9] = 32'b000001_00000_00000_0000000000011111;//NOP
	instructionMemory[10] = 32'b000001_00000_00000_0000000000011111;//NOP
	
	instructionMemory[11] = 32'b000001_01000_01001_01010_00000_000000;//sub $t2, $t0, $t1 
	
	
		
	//								  grupo+2  rs    rt       offset
	instructionMemory[13] = 32'b000011_00110_01010_00000000000000000; 
	

end

always @ (posedge clk) 
	out = instructionMemory[pc];
endmodule
