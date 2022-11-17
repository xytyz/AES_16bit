`timescale 1ns / 1ps
module LED_Timer(
    input a, b, c, d,
    input clkin, reset,
    output reg leda, ledb, ledc, ledd
    );
    
    wire pulsea, pulseb, pulsec, pulsed;
    
    Debounce_Filter dA (.Clk(clkin), .reset(reset),
                        .switch_in(a), .switch_out(pulsea));
    Debounce_Filter dB (.Clk(clkin), .reset(reset),
                        .switch_in(b), .switch_out(pulseb));
    Debounce_Filter dC (.Clk(clkin), .reset(reset),
                        .switch_in(c), .switch_out(pulsec));
    Debounce_Filter dD (.Clk(clkin), .reset(reset),
                        .switch_in(d), .switch_out(pulsed));
    
    
    wire pcha, pchb, pchc, pchd;
    Pulse_Elongate PLA(.clk(clkin), 
                       .trigger(pulsea), 
                       .reset(1'b0), 
                       .pulse(pcha));
    wire aout;
    assign aout = (pcha && pulseb) || (pcha && pulsec);
    always@(aout or pulsea)
    begin
        if(pulsea)
        leda<=1;
        
        if(aout)
        leda<=1;
            
        else
        leda<=0;
    end
    
    Pulse_Elongate PLB(.clk(clkin), 
                       .trigger(pulseb), 
                       .reset(1'b0), 
                       .pulse(pchb));
    wire bout;
    assign bout = (pchb && pulsea) || (pchb && pulsec);
    always@(bout or pulseb)
    begin
        if(pulseb)
        ledb<=1;
        
        if(bout)
        ledb<=1;
        
        else
        ledb<=0;
    end
    Pulse_Elongate PLC(.clk(clkin), 
                       .trigger(pulsec), 
                       .reset(1'b0), 
                       .pulse(pchc));
    wire cout;
    assign cout = (pchc && pulsea) || (pchc && pulseb);
    always@(cout or pulsec)
    begin
        if(pulsec)
        ledc<=1;
        if(cout)
        ledc<=1;
        else
        ledc<=0;
    end 
    /*Pulse_Elongate PLD(.clk(clkin), 
                       .trigger(pulsed), 
                       .reset(1'b0), 
                       .pulse(pchd));*/
                    
    
endmodule
