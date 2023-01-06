`timescale 1ns / 1ps

module AES(
		output[15:0] outp, 
		input[15:0] inpu, 
		input mode,
		input clk
    );
    wire [15:0] buff1,buff2;
    
	encryption u1(.codein(inpu),.key(16'habcd),.codeout(buff1));
	
	decryption u2(.codein(buff1),.key(16'habcd),.codeout(buff2),.prev(inpu));
	
	assign outp= mode?buff1:buff2;
	
endmodule
