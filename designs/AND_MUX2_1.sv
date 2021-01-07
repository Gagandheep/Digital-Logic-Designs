module AND_MUX2_1(input a, b, output y);

    MUX2_1 mux(.data({1'b0, b}), .sel(a), .y(y));

endmodule