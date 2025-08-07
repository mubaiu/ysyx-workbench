// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Prototypes for DPI import and export functions.
//
// Verilator includes this file in all generated .cpp files that use DPI functions.
// Manually include this file where DPI .c import functions are declared to ensure
// the C functions match the expectations of the DPI imports.

#ifndef VERILATED_VTOP__DPI_H_
#define VERILATED_VTOP__DPI_H_  // guard

#include "svdpi.h"

#ifdef __cplusplus
extern "C" {
#endif


    // DPI IMPORTS
    // DPI import at vsrc/REG.v:20:32
    extern void ebreak();
    // DPI import at vsrc/IFU.v:18:33
    extern int intake(int pc);
    // DPI import at vsrc/IDU.v:33:30
    extern void invalid_inst(int thispc);
    // DPI import at vsrc/top.v:143:30
    extern void set_callfunc();
    // DPI import at vsrc/IFU.v:20:34
    extern void set_dnpc(int pc);
    // DPI import at vsrc/IFU.v:21:34
    extern void set_pc(int pc);
    // DPI import at vsrc/REG.v:19:32
    extern void set_reg_value(int idx, int val);
    // DPI import at vsrc/top.v:144:30
    extern void set_retfunc();
    // DPI import at vsrc/IFU.v:19:34
    extern void set_snpc(int pc);
    // DPI import at vsrc/LSU.v:21:33
    extern int vaddr_read(int addr, int len);
    // DPI import at vsrc/LSU.v:20:34
    extern void vaddr_write(int addr, int len, int data);

#ifdef __cplusplus
}
#endif

#endif  // guard
