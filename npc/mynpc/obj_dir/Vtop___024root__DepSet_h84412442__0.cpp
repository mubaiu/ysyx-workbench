// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vtop__Syms.h"
#include "Vtop___024root.h"

extern "C" void set_callfunc();

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__set_callfunc_TOP() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__set_callfunc_TOP\n"); );
    // Body
    set_callfunc();
}

extern "C" void set_retfunc();

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__set_retfunc_TOP() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__set_retfunc_TOP\n"); );
    // Body
    set_retfunc();
}

extern "C" int intake(int pc);

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__intake_TOP(IData/*31:0*/ pc, IData/*31:0*/ &intake__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__intake_TOP\n"); );
    // Body
    int pc__Vcvt;
    for (size_t pc__Vidx = 0; pc__Vidx < 1; ++pc__Vidx) pc__Vcvt = pc;
    int intake__Vfuncrtn__Vcvt;
    intake__Vfuncrtn__Vcvt = intake(pc__Vcvt);
    intake__Vfuncrtn = intake__Vfuncrtn__Vcvt;
}

extern "C" void set_snpc(int pc);

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_snpc_TOP(IData/*31:0*/ pc) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_snpc_TOP\n"); );
    // Body
    int pc__Vcvt;
    for (size_t pc__Vidx = 0; pc__Vidx < 1; ++pc__Vidx) pc__Vcvt = pc;
    set_snpc(pc__Vcvt);
}

extern "C" void set_dnpc(int pc);

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_dnpc_TOP(IData/*31:0*/ pc) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_dnpc_TOP\n"); );
    // Body
    int pc__Vcvt;
    for (size_t pc__Vidx = 0; pc__Vidx < 1; ++pc__Vidx) pc__Vcvt = pc;
    set_dnpc(pc__Vcvt);
}

extern "C" void set_pc(int pc);

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_pc_TOP(IData/*31:0*/ pc) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_pc_TOP\n"); );
    // Body
    int pc__Vcvt;
    for (size_t pc__Vidx = 0; pc__Vidx < 1; ++pc__Vidx) pc__Vcvt = pc;
    set_pc(pc__Vcvt);
}

extern "C" void invalid_inst(int thispc);

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(IData/*31:0*/ thispc) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP\n"); );
    // Body
    int thispc__Vcvt;
    for (size_t thispc__Vidx = 0; thispc__Vidx < 1; ++thispc__Vidx) thispc__Vcvt = thispc;
    invalid_inst(thispc__Vcvt);
}

extern "C" void set_reg_value(int idx, int val);

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__reg_file__DOT__set_reg_value_TOP(IData/*31:0*/ idx, IData/*31:0*/ val) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__reg_file__DOT__set_reg_value_TOP\n"); );
    // Body
    int idx__Vcvt;
    for (size_t idx__Vidx = 0; idx__Vidx < 1; ++idx__Vidx) idx__Vcvt = idx;
    int val__Vcvt;
    for (size_t val__Vidx = 0; val__Vidx < 1; ++val__Vidx) val__Vcvt = val;
    set_reg_value(idx__Vcvt, val__Vcvt);
}

extern "C" void ebreak();

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__reg_file__DOT__ebreak_TOP() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__reg_file__DOT__ebreak_TOP\n"); );
    // Body
    ebreak();
}

extern "C" void etrace_exception(int mcause, int epc, int mtvec);

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__exu__DOT__etrace_exception_TOP(IData/*31:0*/ mcause, IData/*31:0*/ epc, IData/*31:0*/ mtvec) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__exu__DOT__etrace_exception_TOP\n"); );
    // Body
    int mcause__Vcvt;
    for (size_t mcause__Vidx = 0; mcause__Vidx < 1; ++mcause__Vidx) mcause__Vcvt = mcause;
    int epc__Vcvt;
    for (size_t epc__Vidx = 0; epc__Vidx < 1; ++epc__Vidx) epc__Vcvt = epc;
    int mtvec__Vcvt;
    for (size_t mtvec__Vidx = 0; mtvec__Vidx < 1; ++mtvec__Vidx) mtvec__Vcvt = mtvec;
    etrace_exception(mcause__Vcvt, epc__Vcvt, mtvec__Vcvt);
}

extern "C" void vaddr_write(int addr, int len, int data);

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_write_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ data) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_write_TOP\n"); );
    // Body
    int addr__Vcvt;
    for (size_t addr__Vidx = 0; addr__Vidx < 1; ++addr__Vidx) addr__Vcvt = addr;
    int len__Vcvt;
    for (size_t len__Vidx = 0; len__Vidx < 1; ++len__Vidx) len__Vcvt = len;
    int data__Vcvt;
    for (size_t data__Vidx = 0; data__Vidx < 1; ++data__Vidx) data__Vcvt = data;
    vaddr_write(addr__Vcvt, len__Vcvt, data__Vcvt);
}

extern "C" int vaddr_read(int addr, int len);

VL_INLINE_OPT void Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ &vaddr_read__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP\n"); );
    // Body
    int addr__Vcvt;
    for (size_t addr__Vidx = 0; addr__Vidx < 1; ++addr__Vidx) addr__Vcvt = addr;
    int len__Vcvt;
    for (size_t len__Vidx = 0; len__Vidx < 1; ++len__Vidx) len__Vcvt = len;
    int vaddr_read__Vfuncrtn__Vcvt;
    vaddr_read__Vfuncrtn__Vcvt = vaddr_read(addr__Vcvt, len__Vcvt);
    vaddr_read__Vfuncrtn = vaddr_read__Vfuncrtn__Vcvt;
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__ico(Vtop___024root* vlSelf);
#endif  // VL_DEBUG

void Vtop___024root___eval_triggers__ico(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_triggers__ico\n"); );
    // Body
    vlSelf->__VicoTriggered.at(0U) = (0U == vlSelf->__VicoIterCount);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtop___024root___dump_triggers__ico(vlSelf);
    }
#endif
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(Vtop___024root* vlSelf);
#endif  // VL_DEBUG

void Vtop___024root___eval_triggers__act(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_triggers__act\n"); );
    // Body
    vlSelf->__VactTriggered.at(0U) = ((IData)(vlSelf->clk) 
                                      & (~ (IData)(vlSelf->__Vtrigrprev__TOP__clk)));
    vlSelf->__Vtrigrprev__TOP__clk = vlSelf->clk;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtop___024root___dump_triggers__act(vlSelf);
    }
#endif
}
