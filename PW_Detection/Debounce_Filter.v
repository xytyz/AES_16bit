module Debounce_Filter(
    input Clk, reset,
    input switch_in,
    output switch_out
    );
    
    wire clkout;              
    
    Clk_800ms clk800ms(.Clkin(Clk), .Clkout(clkout));
    
    //DEBOUNCE LOGIC
    wire q1, q2_, out;
    
    D_FF D1(.clkin(clkout), 
            .d(switch_in), .clear(reset),
            .q(q1));
                  
    D_FF D2(.clkin(clkout), 
            .d(q1), .clear(reset),
            .q_(q2_));
                  
    and(out, q1, q2_);
    assign switch_out = out;
endmodule