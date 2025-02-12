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


module dp_ram#(
parameter Data_width = 8,  //# of bits in word
          Addr_width = 10  //# of address bits
    )
    ( //ports
        input wire clk,
        input wire we,
        input wire [(Addr_width-1):0] w_addr, r_addr,
        input wire [(Data_width-1):0] d,
        output wire [(Data_width-1):0] q
    );
 
    //signal declaration
    // 2D array for RAM storage
    reg [Data_width-1:0] ram[2**Addr_width-1:0];
    //read output reg
    reg [Data_width-1:0] data_reg;
    
    //RAM initialization from external file (optional)
    initial
        $readmemh("initialRAM.txt", ram);
        
    //body
    //write op
    always@(posedge clk)
        begin
            if(we)
                ram[w_addr] <= d;  //wrute data
                data_reg <= ram[r_addr];  // read data to reg  
        end         
        
    assign q = data_reg;
        
endmodule
