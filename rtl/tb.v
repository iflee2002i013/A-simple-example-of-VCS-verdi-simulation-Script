module tb;

reg d_in_NRZ,d_in_RZ,en,clk,reset;
wire Mealy_NRZ;
wire Moore_NRZ;
wire Melay_RZ;
wire Moore_RZ;

Seq_Rec_3_1s_Mealy  Seq_Rec_3_1s_Mealy_inst1 (
    .clk(clk),
    .rst_n(reset),
    .d_in(d_in_NRZ),
    .en(en),
    .d_out(Mealy_NRZ)
  );
  Seq_Rec_3_1s_Mealy  Seq_Rec_3_1s_Mealy_inst2 (
        .clk(clk),
        .rst_n(reset),
        .d_in(d_in_RZ),
        .en(en),
        .d_out(Melay_RZ)
      );
initial begin
#275 $finish;
end
initial begin
        #5 reset=1;
        #22 reset=0;
end
initial begin
        clk=0;
        forever begin
            #10 clk = ~clk;
        end
end
initial begin
        #5 en = 1;
        #50 en = 0;
end

initial fork
    begin
        #10 d_in_NRZ = 0;
        #25 d_in_NRZ = 1;
        #80 d_in_NRZ = 0;
    end
    begin
        #135 d_in_NRZ = 1;
        #40 d_in_NRZ = 0;
    end
    begin
        #195 d_in_NRZ = 1'bx;
        #60 d_in_NRZ = 0;
    end
join

initial fork
    begin
        #10 d_in_RZ = 0;
        #35 d_in_RZ = 1; #45 d_in_RZ = 0;
        #55 d_in_RZ = 1; #65 d_in_RZ = 0;
        #75 d_in_RZ = 1; #85 d_in_RZ = 0;
        #95 d_in_RZ = 1; #105 d_in_RZ = 0;
        #135 d_in_RZ = 1; #145 d_in_RZ = 0;
        #155 d_in_RZ = 1; #165 d_in_RZ = 0;
        #175 d_in_RZ = 1; #185 d_in_RZ = 0;
        #195 d_in_RZ = 'bx; #250 d_in_RZ = 0;

    end
join

endmodule