`timescale 1ns / 1ps
module TOP_PW_Det(
    input Apb, Bpb, Cpb, Dpb,
    input CLKIN, RESET,
    output [7:0] ANODE,
    output [6:0] CATHODE,
    output [3:0] LEDOUT
    );
    
    //wire LEDCTRL;
    wire [4:0] CHARACTER;
    wire [3:0] PB;
    //wire [3:0] LEDLIGHT;
    wire sela, selb, selc, seld;
    
    Debounce_Filter Pa (.Clk(CLKIN), .reset(RESET),
                        .switch_in(Apb), .switch_out(PB[0]));
    Debounce_Filter Pb (.Clk(CLKIN), .reset(RESET),
                        .switch_in(Bpb), .switch_out(PB[1]));
    Debounce_Filter Pc (.Clk(CLKIN), .reset(RESET),
                        .switch_in(Cpb), .switch_out(PB[2]));
    Debounce_Filter Pd (.Clk(CLKIN), .reset(RESET),
                        .switch_in(Dpb), .switch_out(PB[3]));
                        
    Anode_Control anodectrlwrap(.clkin(CLKIN), .reset(RESET), .Anode(ANODE));
    
    PW_Check pwcheckwrap(.clkin(CLKIN), .reset(RESET),
                         .a(Apb), .b(Bpb), .c(Cpb), .d(Dpb),
                         //.ledoff(LEDCTRL),
                         .OUT(CHARACTER));
                         
    Cathode_Control cathctrlwrap(.Digit(CHARACTER), 
                                 .Cathode(CATHODE));
                                   
    /*LED_Light ledlightwrap(.clkin(CLKIN), .reset(RESET),
                           .a(Apb), .b(Bpb), .c(Cpb), .d(Dpb),
                           .turnoff(LEDCTRL),
                           .leda(LEDLIGHT[0]), 
                           .ledb(LEDLIGHT[1]), 
                           .ledc(LEDLIGHT[2]), 
                           .ledd(LEDLIGHT[3]));*/
                           
    LED_light_timer ledtimerwrap(.a(PB[0]), .b(PB[1]), .c(PB[2]), .d(PB[3]),
                                 .clkin(CLKIN),
                                 .leda(LEDOUT[0]), 
                                 .ledb(LEDOUT[1]), 
                                 .ledc(LEDOUT[2]), 
                                 .ledd(LEDOUT[3]));
                    
    /*assign LEDOUT[0] = sela && LEDLIGHT[0];
    assign LEDOUT[1] = selb && LEDLIGHT[1];
    assign LEDOUT[2] = selc && LEDLIGHT[2];
    assign LEDOUT[3] = seld && LEDLIGHT[3];*/
endmodule
