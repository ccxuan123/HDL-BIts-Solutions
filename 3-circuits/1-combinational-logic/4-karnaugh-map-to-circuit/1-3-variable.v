module top_module(
    input a,
    input b,
    input c,
    output out  
); 
    // SOP : out = c | (b & ~c) | (a & ~b & ~c);
    // simplify to out = a | b | c;
	assign out = a | b | c;
    // POS: out = a | b | c;
    
endmodule
