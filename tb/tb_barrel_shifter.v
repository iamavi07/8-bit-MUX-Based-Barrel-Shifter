module tb_barrel_shifter;

    reg  [7:0] din;
    reg  [2:0] shamt;
    reg        dir;
    wire [7:0] dout;

    barrel_shifter_8bit DUT (
        .din(din),
        .shamt(shamt),
        .dir(dir),
        .dout(dout)
    );

    initial begin
        din = 8'b10110011;

        // LEFT shifts
        dir = 0;
        for (shamt = 0; shamt < 8; shamt = shamt + 1)
            #10;

        // RIGHT shifts
        dir = 1;
        for (shamt = 0; shamt < 8; shamt = shamt + 1)
            #10;

        #20 $stop;
    end

endmodule

