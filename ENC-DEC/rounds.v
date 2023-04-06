module rounds(
	output[255:0] altered,
	input [255:0] code,
	input [3:0] count,
	input [255:0] keyin,
	output [255:0] keyout
);
	
	wire [255:0]computed;
	
	KeyGen k1(.count(count),.key(keyin),.keyout(keyout));
	computation c1(.code(code),.altered(computed));	

	assign altered= keyout^computed;
	
endmodule
