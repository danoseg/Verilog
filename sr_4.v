`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 05:35:43 PM
// Design Name: 
// Module Name: sr_4
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


module sr_4(clk, reset, D0, shift_en, Q);
    input clk, reset, shift_en, D0;
    output reg [3:0] Q;
    
    always@(posedge clk)
    begin
        if(!reset)
            Q <= 4'b0000;
        else if(shift_en == 1)
            begin
                Q <=  Q << 1;
                Q[0] <= D0;
            end
        else ;
    end      
    endmodule
