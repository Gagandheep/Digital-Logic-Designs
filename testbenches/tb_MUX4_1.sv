module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #120
        $finish;
    end

endmodule

module tb_MUX4_1;

    reg d0, d1, d2, d3;
    reg [1:0] s;
    wire y;
    integer i;

    MUX4_1 mux(.data({d0, d1, d2, d3}), .sel(s), .y(y));

    always #1 d0 = ~d0;
    always #2 d1 = ~d1;
    always #4 d2 = ~d2;
    always #6 d3 = ~d3;

    initial begin
        d0 = 1'b0;
        d1 = 1'b0;
        d2 = 1'b0;
        d3 = 1'b0;
        s = 2'h0;

        for (i = 0; i < 3; i = i + 1)
            #30 s = s + 1'b1;
    end

endmodule