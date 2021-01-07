module JKFF_DFF(input j, k, clk, rst_n, output q);

    wire w;

    MUX4_1 mux(.data({1'b0, 1'b0, 1'b1, ~q}), .sel({j, k}), .y(w));
    DFF dff(.din(w), .rst_n(rst_n), .clk(clk), .q(q));

endmodule
