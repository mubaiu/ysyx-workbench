// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vbitrev__Syms.h"


void Vbitrev___024root__trace_chg_0_sub_0(Vbitrev___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vbitrev___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root__trace_chg_0\n"); );
    // Init
    Vbitrev___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vbitrev___024root*>(voidSelf);
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vbitrev___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vbitrev___024root__trace_chg_0_sub_0(Vbitrev___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root__trace_chg_0_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
        bufp->chgCData(oldp+0,(vlSelf->bitrev__DOT__state),2);
        bufp->chgCData(oldp+1,(vlSelf->bitrev__DOT__bit_cnt),3);
        bufp->chgCData(oldp+2,(vlSelf->bitrev__DOT__rx_data),8);
        bufp->chgCData(oldp+3,(vlSelf->bitrev__DOT__tx_data),8);
        bufp->chgBit(oldp+4,(vlSelf->bitrev__DOT__miso_reg));
        bufp->chgCData(oldp+5,(vlSelf->bitrev__DOT__reversed_data_next),8);
    }
    bufp->chgBit(oldp+6,(vlSelf->sck));
    bufp->chgBit(oldp+7,(vlSelf->ss));
    bufp->chgBit(oldp+8,(vlSelf->mosi));
    bufp->chgBit(oldp+9,(vlSelf->miso));
    bufp->chgBit(oldp+10,(vlSelf->bitrev__DOT__test));
}

void Vbitrev___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root__trace_cleanup\n"); );
    // Init
    Vbitrev___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vbitrev___024root*>(voidSelf);
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
}
