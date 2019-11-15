module extend(


input [15:0] dataIn,
output  [31:0] dataOut

);

wire [31:0] dataOutWire; 

assign dataOutWire = dataIn[15] ? {16'd65535,dataIn} : {16'd0,dataIn};
assign dataOut = dataOutWire;		 
		 
endmodule 