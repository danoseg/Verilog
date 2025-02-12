`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2025 12:41:16 AM
// Design Name: 
// Module Name: add4_tb
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


module add4_tb();
    
    //signal declarations
    reg [3:0] a_tb, b_tb;   // data input stimulus
    reg  Cin;                // data input stimulus
    wire [3:0] y_tb;        // data output response
    wire  Co_tb;             // data output response
    reg  [3:0] expected;  // expected sum result    
    
    // DUT instantiation
    add4 DUT(.A(a_tb), .B(b_tb), .Cin(Cin), .Sum(y_tb), .Cout(Co_tb));
    
    integer i,j,k;
    //Test stimulus generation using for loop
    initial
        begin
            for(i=0;i<16;i=i+1)
             begin
                a_tb <= i;
             for(j=0;j<16;j=j+1)
              begin 
                b_tb <= j;
                for(k=0; k < 2; k = k +1)
                 begin
                  Cin <= k;
             #(10); 
             expected <= a_tb + b_tb + Cin;
             end
            end
           end           
          
         if(y_tb !== a_tb + b_tb + Cin)
               begin
                $display("Error - sum is incorrect");
                $stop;
                end
         end

    // Manual input stimulus
     /*   begin
        #0 a_tb=2; b_tb=2; Cin=0; expected=4;
        #10 a_tb=15; b_tb=0; Cin=1; expected=0;
        #10 a_tb=2; b_tb=4; Cin=1; expected=7;
        #10 $stop;
        end*/
        
        //Test results
        initial
        $monitor("time=%d, a=%b, b=%b, Cin=%b, sum=%b, cout=%b, expected==%b",
        $time, a_tb, b_tb, Cin, y_tb, Co_tb, expected);
endmodule
