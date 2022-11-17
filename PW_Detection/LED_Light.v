module LED_Light(
    input a, b, c, d,
    input turnoff,
    input reset, clkin,
    output reg leda, ledb, ledc, ledd
    );
    
    reg leda = 0, ledb = 0, ledc = 0, ledd = 0;
    wire outa, outb, outc, outd;
    
                        
                        
/*
    reg clkout = 0;
    reg [28:0] count = 0;               
    always@(posedge clkin)
    begin
                                              //for 10ms, count = 499_999
        if(count==28'd39_999_999)             //for 800ms, count = 39_999_999
        begin
            clkout<=~clkout;
            count<=0;
        end
        
        else
            count<=count+1;
    end
    
always@(posedge clkout)
begin
  
end
*/
endmodule