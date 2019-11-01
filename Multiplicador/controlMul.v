module controlMul
(
	input	clk, St, rst, m, k,
	output reg done,Sh, load, ad
	
);

	// Declare state register
	reg		[1:0] state;

	// Declare states
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;

	// Determine the next state synchronously, based on the
	// current state and the input
	always @ (posedge clk or posedge rst) begin
		if (rst)
			state <= S0;
		else
			case (state)
				S0:
					if (!St)
					begin
						state <= S0;
					end
					else
					begin
						state <= S1;
					end
				S1:
					if (m)
					begin
						state <= S2;
					end
					else
					begin
						state <= S2;
					end
				S2:
					if (!k)
					begin
						state <= S1;
					end
					else
					begin
						state <= S3;
					end
				S3:
					begin
						state <= S3;
					end
			endcase
	end

	// Determine the output based only on the current state
	// and the input (do not wait for a clock edge).
	always @ (state or m or k or St)
	begin
			case (state)
				S0:
					
					begin
						load <= 1'b0;
						ad <= 1'b0;
						done <= 1'b0;
						Sh <= 1'b0;
					end
					
				S1:
					
					if (St)
					begin
						load <= 1'b1;
						ad <= 1'b0;
						done <= 1'b0;
						Sh <= 1'b0;
					end
					else
					begin
					   load <= 1'b0;
						ad <= 1'b0;
						done <= 1'b0;
						Sh <= 1'b0;
					end
				
				S2:
					if (m)
					begin
						load <= 1'b0;
						ad <= 1'b1;
						done <= 1'b0;
						Sh <= 1'b1;
					end
					else
					begin
						load <= 1'b0;
						ad <= 1'b0;
						done <= 1'b0;
						Sh <= 1'b1;
					end
					end
					end
				S3:
					
					begin
						done <= 1'b1;
						load <= 1'b0;
						ad <= 1'b0;
						Sh <= 1'b0;
					end
					
				
			endcase
	end

endmodule
