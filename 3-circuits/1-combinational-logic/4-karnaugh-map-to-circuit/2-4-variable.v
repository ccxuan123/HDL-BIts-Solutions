module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  
);
    // SOP
    // assign out = (~a&~d)|(a&c&d)|(a&~b&~c)|(~a&~b&~c&d)|(~a&b&c&d);
    assign out = (~a&~d)|(~b&~c)|(~a&b&c)|(a&c&d);

    // POS
    // assign out = (~b|c|~d)&(~a|~b|d)&(~a|~c|d)&(a|b|~c|~d);

endmodule
