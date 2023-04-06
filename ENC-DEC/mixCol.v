/*
*	Module to mix the columns during the AES encryption process
*/
module mixCol(
	input [255:0] code,
	output [255:0] altered
    );

genvar i;	

generate 
	for(i=255;i-31>=0;i-8) begin
		assign altered[i:i-7]= mixer (code[i:i-7],code[i-8:i-15],code[i-16:i-23],code[i-24:i-31]);		
		assign altered[i-8:i-15]= mixer (code[i-8:i-15],code[i-16:i-23],code[i-24:i-31],code[i:i-7]);
		assign altered[i-16:i-23]= mixer (code[i-16:i-23],code[i-24:i-31],code[i:i-7],code[i-8:i-15]);
		assign altered[i-24:i-31]= mixer (code[i-24:i-31],code[i:i-7],code[i-8:i-15],code[i-16:i-23]);
	end
endgenerate

function [7:0] mixer;
input [7:0] i1,i2,i3,i4;
begin
mixer[7]=i1[6] ^ i2[6] ^ i2[7] ^ i3[7] ^ i4[7];
mixer[6]=i1[5] ^ i2[5] ^ i2[6] ^ i3[6] ^ i4[6];
mixer[5]=i1[4] ^ i2[4] ^ i2[5] ^ i3[5] ^ i4[5];
mixer[4]=i1[3] ^ i1[7] ^ i2[3] ^ i2[4] ^ i2[7] ^ i3[4] ^ i4[4];
mixer[3]=i1[2] ^ i1[7] ^ i2[2] ^ i2[3] ^ i2[7] ^ i3[3] ^ i4[3];
mixer[2]=i1[1] ^ i2[1] ^ i2[2] ^ i3[2] ^ i4[2];
mixer[1]=i1[0] ^ i1[7] ^ i2[0] ^ i2[1] ^ i2[7] ^ i3[1] ^ i4[1];
mixer[0]=i1[7] ^ i2[7] ^ i2[0] ^ i3[0] ^ i4[0];
end
endfunction
endmodule


endmodule
