`timescale 1ns / 1ps

module AES(
		output[255:0] outp, 
		input[255:0] inpu, 
		input mode,
    );
	wire [255:0] buff1,buff2;
    
	encryption u1(.codein(inpu),.key(256'habcd),.codeout(buff1));
	
	decryption u2(.codein(buff1),.key(256'habcd),.codeout(buff2),.prev(inpu));
	
	assign outp= mode?buff1:buff2;
	
endmodule
