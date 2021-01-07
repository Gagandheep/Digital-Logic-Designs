module MUX7_1(input [0:6] data, input [2:0] sel, output y);

    wire w1, w2, w3, w4, w5;
    MUX2_1 mux11(.data(data[0:1]), .sel(sel[0]), .y(w1));
    MUX2_1 mux12(.data(data[2:3]), .sel(sel[0]), .y(w2));
    MUX2_1 mux13(.data(data[4:5]), .sel(sel[0]), .y(w3));
    MUX2_1 mux21(.data({w1, w2}), .sel(sel[1]), .y(w4));
    MUX2_1 mux22(.data({w3, data[6]}), .sel(sel[1]), .y(w5));
    MUX2_1 mux31(.data({w4, w5}), .sel(sel[2]), .y(y));


endmodule