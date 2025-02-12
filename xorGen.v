`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2025 12:15:09 AM
// Design Name: 
// Module Name: xorGen
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


module xorGen
    #(parameter width = 4,
               delay = 10)
    (output [1:width] xout,
     input [1:width] xin1, xin2
      );
      
      generate
      genvar i;
      
      for(i=0; i<=width; i=i+1)
      begin
        assign #delay
            xout[i] = xin1[i] ^ xin2[i];
      end
      endgenerate      
endmodule
