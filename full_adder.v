`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2025 06:02:38 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    output fco, fsum,
    input cin, a, b    
    );
    
    wire s1, c1, c2;
    
half_adder u1 (c1, s1, a, b);
half_adder u2 (.a(s1), .b(cin), .sum(fsum), .cout(c2));

assign fco = c1 | c2;

endmodule
