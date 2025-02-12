module add4 (
input [3:0] Data1, Data2,
input Cin,
output Cout,
output wire [3:0] Sum);

assign {Cout, Sum} = Data1 + Data2 + Cin;

endmodule 