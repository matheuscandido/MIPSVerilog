module busController(

input chipSelect,
input [31:0]internal_memory,external_memory,
output reg [31:0] data_out_internal,data_out_external

);


always@(*)
begin
	if(chipSelect==1'b1)
	begin
	
		data_out_internal = internal_memory;
		data_out_external = 32'bz;
	end

	else
	if(chipSelect == 1'b0)
	begin

		data_out_external = external_memory;
		data_out_internal = 32'bz;
	end
	
end

endmodule
