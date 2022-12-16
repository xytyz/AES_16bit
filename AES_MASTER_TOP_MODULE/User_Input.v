module User_Input(
    output reg [15:0] inpreg,
    input enable,
    input [3:0] ip1,
    input [3:0] ip2,
    input [3:0] ip3,
    input [3:0] ip4
    );
    
    always@(*)
    begin
        if(enable == 0)
        begin
            inpreg[15:12] <= ip4;
            inpreg[11:8]  <= ip3;
            inpreg[7:4]   <= ip2;
            inpreg[3:0]   <= ip1;
        end
        
        else
            inpreg <= inpreg;
    end
endmodule
