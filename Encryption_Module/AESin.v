`timescale 1ns / 1ps

module AESin(
		output[15:0] outp, 
		input[15:0] inpu, 
		input	clk
    );
	 
	encryption u1(.clk(clk),.codein(inpu),.key(16'habcd),.codeout(outp));

endmodule
