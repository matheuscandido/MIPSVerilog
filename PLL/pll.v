module geradorClock(
	input clkIn, rst,
	output clkOut1, clkOut2, lockedPLL1, lockedPLL2
	);
	
	PLL1 PLL1_inst0 (
	.areset		 ( rst ),
	.inclk0      ( clkIn ),
	.c0			 ( clkOut1 ),
	.c1			 ( clkOut2 ),
   .locked		 ( lockedPLL1 )
);

	
endmodule
