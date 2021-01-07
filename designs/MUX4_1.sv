module MUX4_1(input [0:3] data, input [1:0] sel, output y);

    wire w1, w2;

    MUX2_1 mux11(.data(data[0:1]), .sel(sel[0]), .y(w1));
    MUX2_1 mux12(.data(data[2:3]), .sel(sel[0]), .y(w2));
    MUX2_1 mux21(.data({w1, w2}), .sel(sel[1]), .y(y));

endmodule