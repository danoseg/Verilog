`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2025 10:27:59 AM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();
    //constant declarations
    parameter delay = 10;
    localparam n = 4;
    localparam T=20;
    
    //signal declarations
    reg clock = 0;
    reg reset = 0;
    reg[n-1:0] d_tb = 4'b0000;  //data input stimulus
    reg load , en = 0;  //input stimulus
    wire [3:0] q_tb;  //output to check
    reg [n-1:0] checkcount = 4'b0000; //variable to compare to count

    integer i;
    
    //Instantiate DUT
    counter DUT(.d(d_tb), .clk(clock), .reset(reset), .load(load), .en(en), .q(q_tb));
    
    //clock driver
    always
    begin
        clock = 1'b1;
        #(T/2);
        clock = 1'b0;
        #(T/2);
    end
    
    //reset driver
    initial 
    begin
        reset = 1'b1;
        #(T/2);
        reset = 1'b0; 
    end 
    
    //test process
    initial
    begin
        @(negedge reset) //wait for reset inactive
        @(negedge clock) //wait flor one clock
            
        //test Load
        load = 1'b1;
      //  en = 1'b0;
        d_tb = 4'b1010;
        
        @(negedge clock) //wait for one clock
        if(q_tb != 4'b1010)
            $display("Load Failure %b" , q_tb);
    
        //test Count
        checkcount = 4'b1010;
        load = 1'b1;
        en = 1'b1;
        $display("Value of n: %d", n);
        
       //checkcount is compared againts q_tb for all value
       for(i=0; i < 2**n; i = i+1)   
       begin 
         @(negedge clock)
            checkcount = checkcount +1; //count        
             if(q_tb != checkcount)
                $display("Count failure at time %g$t at count %b", $time, q_tb);
       end         
                
        $stop;
    end 

endmodule
