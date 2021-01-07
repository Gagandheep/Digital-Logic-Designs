module TFF_DFF(input t, clk, rst_n, output q);

    wire d;

    assign d = q ^ t;

    DFF dff(.din(d), .rst_n(rst_n), .clk(clk), .q(q));

endmodule
