// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtop.h for the primary calling header

#ifndef VERILATED_VTOP___024ROOT_H_
#define VERILATED_VTOP___024ROOT_H_  // guard

#include "verilated.h"

class Vtop__Syms;

class Vtop___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(rst,0,0);
    VL_OUT8(ram_we,0,0);
    CData/*0:0*/ top__DOT__reg_write;
    CData/*3:0*/ top__DOT__alu_op;
    CData/*0:0*/ top__DOT__mem_read;
    CData/*0:0*/ top__DOT__mem_write;
    CData/*0:0*/ top__DOT__alu_src;
    CData/*0:0*/ top__DOT__mem_to_reg;
    CData/*0:0*/ top__DOT__branch;
    CData/*0:0*/ top__DOT__jal_en;
    CData/*0:0*/ top__DOT__jalr_en;
    CData/*0:0*/ top__DOT__ebreak_en;
    CData/*0:0*/ top__DOT__auipc_flag;
    CData/*0:0*/ top__DOT__exu__DOT____VdfgTmp_h826bb330__0;
    CData/*0:0*/ __Vtrigrprev__TOP__clk;
    CData/*0:0*/ __VactContinue;
    VL_OUT(pc,31,0);
    VL_OUT(ram_addr,31,0);
    VL_OUT(ram_wdata,31,0);
    IData/*31:0*/ top__DOT__inst_out;
    IData/*31:0*/ top__DOT__rs1_data;
    IData/*31:0*/ top__DOT__rs2_data;
    IData/*31:0*/ top__DOT__wb_data;
    IData/*31:0*/ top__DOT__imm;
    IData/*31:0*/ top__DOT__alu_result;
    IData/*31:0*/ top__DOT__load_data;
    IData/*31:0*/ top__DOT__ifu__DOT__pc_ff;
    IData/*31:0*/ top__DOT__ifu__DOT__dnpc;
    IData/*31:0*/ top__DOT__ifu__DOT__msnpc;
    IData/*31:0*/ top__DOT__ifu__DOT__mdnpc;
    IData/*31:0*/ top__DOT__reg_file__DOT__i;
    IData/*31:0*/ top__DOT__exu__DOT__operand_a;
    IData/*31:0*/ top__DOT__exu__DOT__operand_b;
    IData/*31:0*/ top__DOT__exu__DOT____VdfgTmp_h8a6dd3c2__0;
    IData/*31:0*/ top__DOT__lsu__DOT__temp_data;
    IData/*31:0*/ __Vfunc_top__DOT__ifu__DOT__intake__2__Vfuncout;
    IData/*31:0*/ __Vfunc_top__DOT__ifu__DOT__intake__3__Vfuncout;
    IData/*31:0*/ __Vfunc_top__DOT__lsu__DOT__vaddr_read__10__Vfuncout;
    IData/*31:0*/ __Vfunc_top__DOT__lsu__DOT__vaddr_read__11__Vfuncout;
    IData/*31:0*/ __Vfunc_top__DOT__lsu__DOT__vaddr_read__12__Vfuncout;
    IData/*31:0*/ __Vfunc_top__DOT__lsu__DOT__vaddr_read__13__Vfuncout;
    IData/*31:0*/ __VstlIterCount;
    IData/*31:0*/ __VicoIterCount;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<IData/*31:0*/, 32> top__DOT__reg_file__DOT__registers;
    VlUnpacked<CData/*0:0*/, 3> __Vm_traceActivity;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VicoTriggered;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vtop__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtop___024root(Vtop__Syms* symsp, const char* v__name);
    ~Vtop___024root();
    VL_UNCOPYABLE(Vtop___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
