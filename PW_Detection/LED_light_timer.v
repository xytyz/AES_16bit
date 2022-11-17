`timescale 1ns / 1ps

module LED_light_timer(
    input a, b, c, d,
    input clkin,
    /*output reg clktriga,
    output reg clktrigb,
    output reg clktrigc,
    output reg clktrigd*/
    output leda, ledb, ledc, ledd
    );
    
    //wire pulseouta, pulseoutb, pulseoutc, pulseoutd;
    //wire ledchecka, ledcheckb, ledcheckc, ledcheckd;
   //wire masterinput, masterpulseout;
    //reg [3:0] pulsecheck = 4'd0;
    
    /*or(masterinput, a, b, c, d);
    
    Pulse_Elongate PulselongMaster(.clk(clkin),                   //initiates at any pushbutton press
                             .trigger(masterinput),         //for comparing with other pulses within the same duration
                             .reset(1'b0), 
                             .pulse(masterpulseout));
                             
    and(ledchecka, masterpulseout, a);
    and(ledcheckb, masterpulseout, b);
    and(ledcheckc, masterpulseout, c);
    and(ledcheckd, masterpulseout, d);*/
    

    Pulse_Elongate PulselongA(.clk(clkin), 
                       .trigger(a), 
                       .reset(1'b0), 
                       .pulse(leda));
    /*always@(posedge a)
    begin
        if(pulseouta==1)
        pulsecheck[0]<=1;
        
        else
        pulsecheck[0]<=0;
    end*/
    

    Pulse_Elongate PulselongB(.clk(clkin), 
                       .trigger(b), 
                       .reset(1'b0), 
                       .pulse(ledb));
    /*always@(posedge b)
    begin
        if(pulseoutb==1)
        pulsecheck[1]<=1;
        
        else
        pulsecheck[1]<=0;
    end*/
    
    
    
    Pulse_Elongate PulselongC(.clk(clkin), 
                       .trigger(c), 
                       .reset(1'b0), 
                       .pulse(ledc));      
    /*always@(posedge c)
    begin
        if(pulseoutc==1)
        pulsecheck[2]<=1;
        
        else
        pulsecheck[2]<=0;
    end*/
    
    
    Pulse_Elongate PulselongD(.clk(clkin), 
                       .trigger(d), 
                       .reset(1'b0), 
                       .pulse(ledd));    
    /*always@(posedge d)
    begin
        if(pulseoutd==1)
        pulsecheck[3]<=1;
        
        else
        pulsecheck[3]<=0;
    end
    
    
    wire pulsechkor;
    or(pulsechkor,              //returns zero if all pulseouts are zero
       pulseouta,               //returns 1 if any of the pulses active
       pulseoutb,
       pulseoutc,
       pulseoutd);     
    
    
    always@(pulsechkor)         //when all pulses zero, assign zero to the register
    begin
        if(pulsechkor == 1'b0)
            pulsecheck <= 4'b0000;
    end
    
    wire ledctrlmux;
    and(ledctrlmux,                                                             //select line input to the ledctrl mux
        pulsecheck[0], pulsecheck[1], pulsecheck[2], pulsecheck[3],             //ledctrlmux line high if pulsecheck register 1111 and all pulses zero
        ~(pulsechkor));          
    
         
    wire [3:0] ledctrl;
    assign ledctrl[0] = ledctrlmux? 1 : 0;
    assign ledctrl[1] = ledctrlmux? 1 : 0;
    assign ledctrl[2] = ledctrlmux? 1 : 0;
    assign ledctrl[3] = ledctrlmux? 1 : 0;
    
    
    assign leda = pulseouta && ~(ledctrl[0]);                       //led lights till pulseout high and ledctrl is low
    assign ledb = pulseoutb && ~(ledctrl[1]);                       //as soon as ledctrl goes high(i.e., when all pulses zero and reg = 1111),
    assign ledc = pulseoutc && ~(ledctrl[2]);                       //all leds turn off
    assign ledd = pulseoutd && ~(ledctrl[3]);   */
                                                        
    /*
    assign pulsecheck[0] = pulseouta? 1 : 0 ;                  
    assign pulsecheck[1] = pulseoutb? 1 : 0 ;
    assign pulsecheck[2] = pulseoutc? 1 : 0 ;
    assign pulsecheck[3] = pulseoutd? 1 : 0 ;
    
   
    
    assign leda = pulseouta && pulsechkor;                                                                      
    assign ledb = pulseoutb && pulsechkor;                                                                      
    assign ledc = pulseoutc && pulsechkor;                                                                      
    assign ledd = pulseoutd && pulsechkor; */
    
    
                                                 
    /*always@(pulsecheck)                               //negedge pulseouta, negedge pulseoutb
    begin
      //  aON <= 0;
       // bON <= 0;
        if(pulsecheck == 4'b0000)begin
        leda <= 0;
        ledb <= 0; 
        ledc <= 0; 
        ledd <= 0; end
    end*/
    endmodule   
    
    
    
    //------------------------------------------------------------//
    
    
    /*wire outa, outb, outc, outd;
    reg clktriga = 0;
    reg clktrigb = 0;
    reg clktrigc = 0;
    reg clktrigd = 0;
    
    always@(a or b or c or d)
    begin
    clktriga <= 0;
    clktrigb <= 0;
    clktrigc <= 0;
    clktrigd <= 0;
        if(a==1 && b==0 && c==0 && d==0)
            begin
                clktrigb<=1;
                clktrigc<=1;
                clktrigd<=1;
            end
        
        if(a==0 && b==1 && c==0 && d==0)
            begin
                clktriga<=1;
                clktrigc<=1;
                clktrigd<=1;
            end
            
        if(a==0 && b==0 && c==1 && d==0)
            begin
                clktrigb<=1;
                clktriga<=1;
                clktrigd<=1;
            end
            
        if(a==0 && b==0 && c==0 && d==1)
            begin
                clktrigb<=1;
                clktrigc<=1;
                clktriga<=1;
            end
    end
    
    assign outa = clktriga && clkin;
    assign outb = clktrigb && clkin;
    assign outc = clktrigc && clkin;
    assign outd = clktrigd && clkin;
    or(outpb, outa, outb, outc, outd);
    
    reg [28:0] counta = 0;
    reg [28:0] countb = 0;
    reg [28:0] countc = 0;
    reg [28:0] countd = 0;
    
    /*always@(outpb)
    begin
        leda <= 1;
        ledb <= 1;
        ledc <= 1;
        ledd <= 1;
        if(counta == 28'd49_999_999)
        begin
            counta<=0;
            leda<=0;    
            ledb<=0;    
            ledc<=0;    
            ledd<=0;    
        end
        else
            counta <= counta+1;
    end*/
    
    /*always@(posedge outa)
    begin
    leda=1;
        if(counta == 28'd99_999)
        begin
            counta<=0;
            leda<=0;
        end
        else
            counta = counta+1;
    end
    
    
    always@(posedge outb)
    begin
    ledb=1;
        if(countb == 28'd99_999)
        begin
            countb<=0;
            ledb<=0;
        end
        else
            countb = countb+1;
    end
    
    always@(posedge outc)
    begin
    ledc=1;
        if(countc == 28'd99_999)
        begin
            countc<=0;
            ledc<=0;
        end
        else
            countc = countc+1;
    end
    
    always@(posedge outd)
    begin
    ledd=1;
        if(countd == 28'd99_999)
        begin
            countd<=0;
            ledd<=0;
        end
        else
            countd = countd+1;
    end*/

