module top_module( 
    input a, b, cin,
    output cout, sum 
);
    
    assign sum = a^b^cin;
    assign cout = a&b | a&cin | b&cin;
    
    // truth table for cout
    // | a | b | cin | cout|
    // | 0 | 0 | 0   | 0   |
    // | 0 | 0 | 1   | 0   |
    // | 0 | 1 | 0   | 0   |
    // | 0 | 1 | 1   | 0   |
    // | 1 | 0 | 0   | 0   |
    // | 1 | 0 | 1   | 0   |
    // | 1 | 1 | 0   | 0   |
    // | 1 | 1 | 1   | 0   |
    // if using sum of product
    // assign cout = a&b | ~a&b&cin | a&~b&cin ;

endmodule
