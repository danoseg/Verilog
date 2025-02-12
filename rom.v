`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2025 01:42:56 PM
// Design Name: Dual Port RA
// Module Name: dp_ram
// Project Name: 
// Target Devices: Zybo-10
// Tool Versions:  Vivado 2024.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rom#(
parameter Data_width = 8,  //# of bits in word
          Addr_width = 3   //# of address bits
    )
    ( //ports
        input wire clk,
        input wire [(Addr_width-1):0] addr,
        output wire [(Data_width-1):0] q
    );
 
    //signal declaration
    reg [Data_width-1:0] rom_data, data_reg;
   
    //body
    //write op
    always@(posedge clk)
        data_reg <= rom_data;
        
    always @*
        case(addr) //LUT
            3'b000 : rom_data = 8'b1000_0000;
            3'b001 : rom_data = 8'b1010_1010;
            3'b010 : rom_data = 8'b0101_0101;
            3'b011 : rom_data = 8'b1000_0011;
            3'b100 : rom_data = 8'b0000_0000;
            3'b101 : rom_data = 8'b1001_1001;
            3'b110 : rom_data = 8'b1000_0001;
            3'b111 : rom_data = 8'b1111_0000;
        endcase        
        
    assign q = data_reg;
        
endmodule
