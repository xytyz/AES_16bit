`timescale 1ns / 1ps
module D_Latch(
    input D, Enable,
    output reg Q
    );
    
    always@(Enable)
    begin
    Q <= 0;
        if(Enable)
            Q<=D;
        else
            Q<=Q;
    end
endmodule
