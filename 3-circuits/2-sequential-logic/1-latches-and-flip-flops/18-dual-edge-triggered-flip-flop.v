module top_module (
    input clk,
    input d,
    output q
);
    wire q_pos;
    wire q_neg;
    always @ (posedge clk) begin
        q_pos <= d;
    end
    always @ (negedge clk) begin
        q_neg <= d;
    end
    assign q = clk ? q_pos : q_neg;
    // use a 2-to-1 mux to select from both posedge and negedge dff
    // mux selector 0 choose posedge dff, as dff update after the clk switching
    // mux selector 1 choose negedge dff

endmodule
