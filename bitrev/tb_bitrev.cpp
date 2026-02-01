#include "Vbitrev.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include <stdio.h>

int main(int argc, char** argv) {
    // Initialize Verilator
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);

    // Create instance of the module
    Vbitrev* dut = new Vbitrev;

    // Create VCD trace
    VerilatedVcdC* tfp = new VerilatedVcdC;
    dut->trace(tfp, 99);
    tfp->open("bitrev.vcd");

    uint64_t sim_time = 0;

    printf("Starting bitrev simulation...\n");

    // Initialize signals
    dut->sck = 0;
    dut->ss = 1;   // Reset (active high)
    dut->mosi = 0;
    dut->eval();
    tfp->dump(sim_time++);

    // Hold reset for a few cycles
    printf("Holding reset...\n");
    for (int i = 0; i < 10; i++) {
        dut->sck = !dut->sck;
        dut->eval();
        tfp->dump(sim_time++);
    }

    // Release reset
    printf("Releasing reset...\n");
    dut->ss = 0;
    dut->eval();
    tfp->dump(sim_time++);

    // Run for some cycles with simple stimulus
    printf("Running simulation with simple stimulus...\n");
    uint8_t test_data = 0xA5;  // Test pattern: 10100101

    // Send 8 bits via MOSI
    for (int bit = 7; bit >= 0; bit--) {
        dut->mosi = (test_data >> bit) & 1;

        // Clock low
        dut->sck = 0;
        dut->eval();
        tfp->dump(sim_time++);

        // Clock high
        dut->sck = 1;
        dut->eval();
        tfp->dump(sim_time++);

        printf("Sent bit %d: %d, MISO: %d\n", bit, dut->mosi, dut->miso);
    }

    // Continue running to receive response
    dut->mosi = 0;
    for (int i = 0; i < 16; i++) {
        // Clock low
        dut->sck = 0;
        dut->eval();
        tfp->dump(sim_time++);

        // Clock high
        dut->sck = 1;
        dut->eval();
        tfp->dump(sim_time++);

        printf("Cycle %d: MISO: %d\n", i, dut->miso);
    }

    // End transmission
    dut->ss = 1;
    dut->eval();
    tfp->dump(sim_time++);

    printf("Simulation completed. Total cycles: %lu\n", sim_time);

    // Cleanup
    tfp->close();
    delete tfp;
    delete dut;

    return 0;
}
