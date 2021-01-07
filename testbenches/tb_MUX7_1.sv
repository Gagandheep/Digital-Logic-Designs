module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #210
        $finish;
    end

endmodule

module tb_MUX7_1;

    reg d0, d1, d2, d3, d4, d5, d6;
    reg [2:0] s;
    wire y;
    integer i;

    MUX7_1 mux(.data({d0, d1, d2, d3, d4, d5, d6}), .sel(s), .y(y));

    always #1 d0 = ~d0;
    always #2 d1 = ~d1;
    always #4 d2 = ~d2;
    always #6 d3 = ~d3;
    always #4 d4 = ~d4;
    always #2 d5 = ~d5;
    always #1 d6 = ~d6;

    initial begin
        d0 = 1'b0;
        d1 = 1'b0;
        d2 = 1'b0;
        d3 = 1'b0;
        d4 = 1'b0;
        d5 = 1'b0;
        d6 = 1'b0;
        s = 3'h0;

        for (i = 0; i < 6; i = i + 1)
            #30 s = s + 1'b1;
    end

endmodule