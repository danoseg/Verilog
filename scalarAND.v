`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2025 12:08:36 AM
// Design Name: 
// Module Name: scalarAND
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


module scalarAND
    #(parameter N = 4)
    (input wire g,
    input wire [N-1:0] a,
    output reg [N-1:0]y);
    
    reg [N-1:0] tmp;
    integer i; //loop index (not a signal)
    
    always @(posedge a or g)
     begin
        for(i=0; i<N; i=i+1)
            begin 
                tmp[i] = a[i] & g;
            end 
        y = tmp;
     end
endmodule
