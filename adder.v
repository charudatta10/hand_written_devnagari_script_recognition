module adder(a,b,cin,sum,cout);
input a;
input b;
input cin;
output reg sum;
output reg cout;
xor x1(sum,a,b,cin);
assign cout=!a & b & c | a & b | c;
endmodule
