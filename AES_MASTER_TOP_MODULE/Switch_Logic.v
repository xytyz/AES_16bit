`timescale 1ns / 1ps
module Switch_Logic(
    input clkin, Inp,
    output SelOut
    );
    
    //Inp is the input from the debounce filter for the middle button
    reg Regout = 1'b0;
    reg Regswitch = 1'b0;
    
    always@(posedge clkin)
    begin
        Regswitch <= Inp;
        if(Inp == 1'b0 && Regswitch == 1'b1)
            begin
                Regout<=~Regout;
            end
    end
    
    assign SelOut = Regout;
endmodule
