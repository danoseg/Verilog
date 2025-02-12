`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 10:50:30 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file#(
    parameter Dwidth = 8,  // #bits in word
    parameter Awidth =2  // #address bits
    )
    (
    input wire clk, wren,
    input wire [(Dwidth-1):0] wdata,
    input wire [(Awidth-1):0] waddr, raddr,
    output wire [(Dwidth-1):0] rdata
    );
    
    //signal declaration
    reg [Dwidth-1:0] array_reg [2**Awidth-1:0];
    
    always @(posedge clk)
        if(wren) 
            array_reg[waddr] <= wdata;
        assign rdata = array_reg[raddr]; 
    
endmodule
