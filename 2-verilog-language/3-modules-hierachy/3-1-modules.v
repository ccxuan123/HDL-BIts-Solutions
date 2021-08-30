/*
predefined module

module mod_a ( input in1, input in2, output out);
    // Module body
endmodule
*/

module top_module ( input a, input b, output out );

    // create an instance of "mod_a" named "inst1", and connect ports by position
    mod_a inst1 (a, b, out);

    // create an instance of "mod_a"' named "inst2", and connect ports by name:
    // mod_a inst2 ( .in1(a), .in2(b), .out(out) );

endmodule
