module busController(

input chipSelect,
input [31:0]internal_memory,external_memory,
output reg [31:0] data_out_internal

);


always@(*)
begin
	if(chipSelect==1'b1)
	begin
	
		data_out_internal = internal_memory;
		
	end

	else
	begin

		data_out_internal = 32'bz;
		
	end
	
end

endmodule
