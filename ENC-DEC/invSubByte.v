module invSubByte(
    output [15:0] altered,
	input[15:0] code
    );
	
	inv_LUT L1(
	.code(altered[7:0]),
	.inp(code[7:0])
	);
	
	inv_LUT L2(
	.code(altered[15:8]),
	.inp(code[15:8])
	);
	
endmodule