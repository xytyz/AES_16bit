`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2022 12:31:10
// Design Name: 
// Module Name: UserInput
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module UserInput(
    input [3:0] ip1,ip2,ip3,ip4, //4 anode input (16 bit)
    output reg [6:0]seg, //cathode segment
    output reg [3:0] anode,  // 4 bit of each anode (total 4 anode)
    input clk
    );
    reg [3:0]i; //temporary register to hold the input values
    localparam N=18; // 18 bits for refresh counter to get desired frequency of around 240 hz + 2 bits to toggle
    //reg [N-1:0]count;
    reg [N-1:0] count = 0;
     // 2 MSB bit that will decide which digit to be selected 
    always @( posedge clk )
    begin
        count <= count+1;
    end
   wire [1:0]anode_selector = count[N-1:N-2];
    
    always @(posedge clk)
    begin
        case(anode_selector)
            2'b00: 
            begin
                anode <=4'b1110;
                i<=ip1;
                //UserDisplay ud(.user_hex(ip1),.seg(segment));
            end
            2'b01: 
            begin
                anode <=4'b1101;
                i<=ip2;
            end
            2'b10: 
            begin
                anode <=4'b1011;
                i<=ip3 ;
            end
            2'b11: 
            begin
                anode <=4'b0111;
                i<=ip4;
            end
         endcase
    end
//endmodule

    
//module UserDisplay( 
    //input [3:0] user_hex, //4 bit for each anode 
    //output reg [6:0]seg); //segments of cathode
    
    always @(*)
    begin
    case(i)
        4'h0: seg[6:0]=7'b1000000; //0
        4'h1: seg[6:0]=7'b1111001; //1
        4'h2: seg[6:0]=7'b0100100; //2
        4'h3: seg[6:0]=7'b0110000; //3
        4'h4: seg[6:0]=7'b0011001; //4
        4'h5: seg[6:0]=7'b0010010; //5
        4'h6: seg[6:0]=7'b0000010; //6
        4'h7: seg[6:0]=7'b1111000; //7
        4'h8: seg[6:0]=7'b0000000; //8
        4'h9: seg[6:0]=7'b0010000; //9
        4'ha: seg[6:0]=7'b0001000; //A
        4'hb: seg[6:0]=7'b0000011; //B
        4'hc: seg[6:0]=7'b1000110; //C
        4'hd: seg[6:0]=7'b0100001; //D
        4'he: seg[6:0]=7'b0000110; //E
        default: seg[6:0]=7'b0001110; //F
    endcase    
    end 
    
endmodule