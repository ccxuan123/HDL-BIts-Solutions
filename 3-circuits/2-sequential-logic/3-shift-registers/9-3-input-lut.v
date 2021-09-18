module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    
    reg [7:0] Q;
    
    // 8 bit shift register
    always @ (posedge clk) begin
        if (enable) begin
            Q <= { Q[6:0], S }; 
        end
    end
    
    // LUT / 8-to-1 mux circuit
    always @ (*) begin
        case ({A, B, C})
            3'b000: Z = Q[0];
            3'b001: Z = Q[1];
            3'b010: Z = Q[2];
            3'b011: Z = Q[3];
            3'b100: Z = Q[4];
            3'b101: Z = Q[5];
            3'b110: Z = Q[6];
            3'b111: Z = Q[7];
        endcase
    end
    
    // alternate 8-to-1 mux circuit
    // assign Z = Q[ {A, B, C} ];

endmodule
