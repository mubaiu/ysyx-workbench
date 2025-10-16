// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcomputer.h for the primary calling header

#include "Vcomputer__pch.h"
#include "Vcomputer__Syms.h"
#include "Vcomputer___024root.h"

extern "C" void set_callfunc();

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_callfunc_TOP() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_callfunc_TOP\n"); );
    // Body
    set_callfunc();
}

extern "C" void set_retfunc();

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_retfunc_TOP() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_retfunc_TOP\n"); );
    // Body
    set_retfunc();
}

extern "C" int intake(int pc);

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__intake_TOP(IData/*31:0*/ pc, IData/*31:0*/ &intake__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__intake_TOP\n"); );
    // Body
    int pc__Vcvt;
    pc__Vcvt = pc;
    int intake__Vfuncrtn__Vcvt;
    intake__Vfuncrtn__Vcvt = intake(pc__Vcvt);
    intake__Vfuncrtn = intake__Vfuncrtn__Vcvt;
}

extern "C" void set_snpc(int pc);

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_snpc_TOP(IData/*31:0*/ pc) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_snpc_TOP\n"); );
    // Body
    int pc__Vcvt;
    pc__Vcvt = pc;
    set_snpc(pc__Vcvt);
}

extern "C" void set_dnpc(int pc);

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_dnpc_TOP(IData/*31:0*/ pc) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_dnpc_TOP\n"); );
    // Body
    int pc__Vcvt;
    pc__Vcvt = pc;
    set_dnpc(pc__Vcvt);
}

extern "C" void set_pc(int pc);

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_pc_TOP(IData/*31:0*/ pc) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_pc_TOP\n"); );
    // Body
    int pc__Vcvt;
    pc__Vcvt = pc;
    set_pc(pc__Vcvt);
}

extern "C" void invalid_inst(int thispc);

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(IData/*31:0*/ thispc) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP\n"); );
    // Body
    int thispc__Vcvt;
    thispc__Vcvt = thispc;
    invalid_inst(thispc__Vcvt);
}

extern "C" void set_reg_value(int idx, int val);

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__set_reg_value_TOP(IData/*31:0*/ idx, IData/*31:0*/ val) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__set_reg_value_TOP\n"); );
    // Body
    int idx__Vcvt;
    idx__Vcvt = idx;
    int val__Vcvt;
    val__Vcvt = val;
    set_reg_value(idx__Vcvt, val__Vcvt);
}

extern "C" void ebreak();

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__ebreak_TOP() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__ebreak_TOP\n"); );
    // Body
    ebreak();
}

extern "C" void etrace_exception(int mcause, int epc, int mtvec);

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__etrace_exception_TOP(IData/*31:0*/ mcause, IData/*31:0*/ epc, IData/*31:0*/ mtvec) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__etrace_exception_TOP\n"); );
    // Body
    int mcause__Vcvt;
    mcause__Vcvt = mcause;
    int epc__Vcvt;
    epc__Vcvt = epc;
    int mtvec__Vcvt;
    mtvec__Vcvt = mtvec;
    etrace_exception(mcause__Vcvt, epc__Vcvt, mtvec__Vcvt);
}

extern "C" void vaddr_write(int addr, int len, int data);

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_write_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ data) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_write_TOP\n"); );
    // Body
    int addr__Vcvt;
    addr__Vcvt = addr;
    int len__Vcvt;
    len__Vcvt = len;
    int data__Vcvt;
    data__Vcvt = data;
    vaddr_write(addr__Vcvt, len__Vcvt, data__Vcvt);
}

extern "C" int vaddr_read(int addr, int len);

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_read_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ &vaddr_read__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_read_TOP\n"); );
    // Body
    int addr__Vcvt;
    addr__Vcvt = addr;
    int len__Vcvt;
    len__Vcvt = len;
    int vaddr_read__Vfuncrtn__Vcvt;
    vaddr_read__Vfuncrtn__Vcvt = vaddr_read(addr__Vcvt, len__Vcvt);
    vaddr_read__Vfuncrtn = vaddr_read__Vfuncrtn__Vcvt;
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__ico(Vcomputer___024root* vlSelf);
#endif  // VL_DEBUG

void Vcomputer___024root___eval_triggers__ico(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_triggers__ico\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VicoTriggered.setBit(0U, (IData)(vlSelfRef.__VicoFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vcomputer___024root___dump_triggers__ico(vlSelf);
    }
#endif
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__act(Vcomputer___024root* vlSelf);
#endif  // VL_DEBUG

void Vcomputer___024root___eval_triggers__act(Vcomputer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_triggers__act\n"); );
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.setBit(0U, ((IData)(vlSelfRef.clock) 
                                          & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clock__0))));
    vlSelfRef.__Vtrigprevexpr___TOP__clock__0 = vlSelfRef.clock;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vcomputer___024root___dump_triggers__act(vlSelf);
    }
#endif
}
