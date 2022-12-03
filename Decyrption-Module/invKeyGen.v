module invKeyGen(
	input [3:0]count,
	input [15:0]key,
    output [15:0] keyout);
   
   wire [15:0] temp;

	invSubByte a1(.code(key),.altered(temp));
	
	assign keyout= key ^ temp ^ rcon(count);
       
       
   function[15:0]	rcon;
    input[3:0]	count;
    case(count)	
       4'h9: rcon=15'h0100;
       4'h8: rcon=15'h0200;
       4'h7: rcon=15'h0400;
       4'h6: rcon=15'h0800;
       4'h5: rcon=15'h1000;
       4'h4: rcon=15'h2000;
       4'h3: rcon=15'h4000;
       4'h2: rcon=15'h8000;
       4'h1: rcon=15'h1b00;
       4'h0: rcon=15'h3600;
       default: rcon=15'h00_00;
     endcase

   endfunction

endmodule
