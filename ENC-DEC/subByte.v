
module subByte(	
	output [15:0] altered,
	input[15:0] code
    );
	
	genvar i;
	generate
		for(i=0;i+7<=255;i+8) begin
		LUT_verilog s1(.outp(altered[i+7:i]),.inp(code[i+7:i]));
		end
	endgenerate
	
endmodule
