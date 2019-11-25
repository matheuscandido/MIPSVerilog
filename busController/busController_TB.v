`timescale 1ns/10ps
module busController_TB;

reg chipSelect;
reg [31:0]internal_memory,external_memory;
wire [31:0] data_out_internal;


busController DUT(

.chipSelect(chipSelect),
.internal_memory(internal_memory),
.external_memory(external_memory),
.data_out_internal(data_out_internal)


);




initial 

	begin
	chipSelect<=1'b1;
	#300
	internal_memory <= 32'h1000;
	$display("data_out_internal = %h",data_out_internal);
	#300
	internal_memory <= 32'hffff;
	$display("data_out_internal = %h",data_out_internal);
	#300
	internal_memory <= 32'h3000;
	chipSelect<=1'b0;
	$display("data_out_internal = %h",data_out_internal);
	#300
	internal_memory <= 32'h5000;
	$display("data_out_internal = %h",data_out_internal);
	#2000
	$stop;
	end


endmodule