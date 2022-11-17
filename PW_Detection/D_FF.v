`timescale 1ns / 1ps
module D_FF(
    input d, clkin, clear,
    output reg q, q_
    );
    
    always@(posedge clkin or posedge clear)
    begin
        if(clear)
        begin
            q<=0;
            q_<=1;
        end
        else
        begin
            q<=d;
            q_<=~d;
        end
    end
endmodule
