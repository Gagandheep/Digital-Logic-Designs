module SRFF_DFF(input s, r, clk, rst_n, output q);

    wire w;

    MUX4_1 mux(.data({q, 1'b0, 1'b1, 1'bz}), .sel({s, r}), .y(w));
    DFF dff(.din(w), .rst_n(rst_n), .clk(clk), .q(q));

endmodule
