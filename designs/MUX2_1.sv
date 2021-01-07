module MUX2_1(input [0:1] data, input sel, output y);

    assign y = (sel) ? data[1] : data[0];

endmodule