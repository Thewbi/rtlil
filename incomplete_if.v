module incomplete_if ( input [1:0] mode,
             input clk,
            input rstn,
            output reg [3:0] q);

  always @ (posedge clk) begin
    if (! rstn)
      q <= 0;
    else begin
      if (mode == 1)
        q <= q + 1;
      else if (mode == 2)
        q <= q - 1;
    end
  end

endmodule