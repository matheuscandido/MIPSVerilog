`timescale 1ns/10ps
module instructionmemory_TB();

reg clk;
reg[10:0] pc;
wire[31:0] out;

instructionmemory InstructionMemory(
	clk,
	pc,
	out
);

initial begin
	clk = 0;
	pc = 0;
	
	$display("PC \tInstructionOut");
	#2000 $stop;
end

always #50 clk = ~clk;

always @ (posedge clk) begin
	pc = pc + 1;
	
	$display("%d \t%b", pc, instructionOut);
end
	
endmodule
