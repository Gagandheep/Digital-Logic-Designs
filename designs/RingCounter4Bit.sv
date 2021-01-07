module RingCounter4Bit(input rst_n, clk,
                       output reg [4:0] out);

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) 
            out <= 4'b0001;
        else
            out <= {out[2:0], out[3]};
    end

endmodule