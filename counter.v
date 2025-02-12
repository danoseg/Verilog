`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 05:52:42 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input wire [3:0] d,
    input wire clk, reset, load, en,
    output reg [3:0] q
    );
    
    always @ (posedge clk)
        begin
            if(reset)
                q <= 0;
            else if(load == 1'b1)
                if(en == 1'b0)
                     q <= d;
                else  
                     q <= q + 1;
        end
endmodule
