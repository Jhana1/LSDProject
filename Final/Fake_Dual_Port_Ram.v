`ifndef SINGLE_PORT_RAM
`define SINGLE_PORT_RAM
// Quartus II Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// single read/write clock

module Fake_Dual_Port_Ram
#(parameter DATA_WIDTH=20, parameter ADDR_WIDTH=8)
(
    input [(DATA_WIDTH-1):0] data,
    input [(ADDR_WIDTH-1):0] read_addr_a, read_addr_b, write_addr,
    input we, clk,
    output reg [(DATA_WIDTH-1):0] q_a, q_b
);

    // Declare the RAM variable
    reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

    always @ (posedge clk)
    begin
        // Write
        if (we)
            ram[write_addr] = data;

        // Read (if read_addr == write_addr, return OLD data).  To return
        // NEW data, use = (blocking write) rather than <= (non-blocking write)
        // in the write assignment.  NOTE: NEW data may require extra bypass
        // logic around the RAM.
        q_a <= ram[read_addr_a];
		  q_b <= ram[read_addr_b];
    end

endmodule


`endif