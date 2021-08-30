module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum
);
    wire [2:0] cout;  
    fadd fa1 (x[0], y[0], 0,       cout[0], sum[0]);
    fadd fa2 (x[1], y[1], cout[0], cout[1], sum[1]);
    fadd fa3 (x[2], y[2], cout[1], cout[2], sum[2]);
    fadd fa4 (x[3], y[3], cout[2], sum[4] , sum[3]);

    // another shorter solution
    // assign sum = x+y; 
    // 👆 4-bit ripple-carry adder with carry-out
    // Verilog addition automatically produces the carry-out bit.
    
    // Verilog quirk: Even though the value of (x+y) includes the carry-out, (x+y) is still considered to be a 4-bit number (The max width of the two operands).
	// This is correct:
	// assign sum = (x+y);
	// But this is incorrect:
	// assign sum = {x+y};	// Concatenation operator: This discards the carry-out

endmodule


module fadd( 
    input a, b, cin,
    output cout, sum 
);    
    assign sum = a^b^cin;
    assign cout = a&b | a&cin | b&cin;
    
endmodule
