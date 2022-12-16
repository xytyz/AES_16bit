module shiftRow(
	output [15:0]  altered,
	input [15:0] code
    );
	
	assign altered[7:0]= code[15:8];
	assign altered[15:8]= code[7:0];
	
endmodule