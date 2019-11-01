module instructionmemory(
	input clk, 
	input[9:0] pc, 
	output reg[31:0] out
);

reg a = 'd2001;
reg b = 'd4001;
reg c = 'd5001;
reg d = 'd3001;

// Tamanho da memória de instrução
reg [31:0] instructionMemory [0:999];

initial begin

	/*
	s0 a s7, 0 a 7 
	t0 a t7, 8 a 15
	
	lw $s1,2001 // A
	lw $s2,4001 // B
	lw $s3,5001 // C
	lw $s4,3001 // D
	lw $s5,8192 // Endereço da última posição da memória de dados
	mul $t0, $s1, $s2
	add $t1, $s3, $s4
	sub $t2, $t0, $t1
	sw $t2, 0($s5)
	*/

	instructionMemory[0] = 32'b000010_00000_00000_0000_0000_0000_0000; //lw $s1,2001
	instructionMemory[1] = 32'b000010_00000_00000_0000_0000_0000_0000; //lw $s2,4001
	instructionMemory[2] = 32'b000010_00000_00000_0000_0000_0000_0000; //lw $s3,5001
	instructionMemory[3] = 32'b000010_00000_00000_0000_0000_0000_0000; //lw $s4,3001
	instructionMemory[4] = 32'b000010_00000_00000_0000_0000_0000_0000; //lw $s5,8192

	instructionMemory[5] = 32'b000001_00000_00000_00000_00000_000000; //mul $t0, $s1, $s2
	instructionMemory[6] = 32'b000001_00000_00000_00000_00000_000000; //add $t1, $s3, $s4
	instructionMemory[7] = 32'b000001_00000_00000_00000_00000_000000; //sub $t2, $t0, $t1

	instructionMemory[8] = 32'b000001_00000_00000_00000_00000_000000; //sw $t2, 0($s5)
	

end

always @ (posedge clk) 
	out = instructionMemory[pc];
endmodule
