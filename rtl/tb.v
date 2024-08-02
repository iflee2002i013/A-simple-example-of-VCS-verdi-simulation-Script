module tb_counter_4bit;
    reg clk;
    reg rst;
    wire [3:0] count;

    // Instantiate the counter
    counter_4bit uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1; 
        #10;
        
        rst = 0;
        #100;

        rst = 1;
        #10;

        rst = 0;
        #100;

        $finish;
    end

    // Monitor the count
    initial begin
        $monitor("Time: %0t, Reset: %b, Count: %b", $time, rst, count);
    end

endmodule

