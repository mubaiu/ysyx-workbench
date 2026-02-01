// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vbitrev.h for the primary calling header

#include "Vbitrev__pch.h"
#include "Vbitrev___024root.h"

void Vbitrev___024root___eval_act(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_act\n"); );
}

VL_INLINE_OPT void Vbitrev___024root___nba_sequent__TOP__0(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___nba_sequent__TOP__0\n"); );
    // Init
    CData/*1:0*/ __Vdly__bitrev__DOT__state;
    __Vdly__bitrev__DOT__state = 0;
    CData/*2:0*/ __Vdly__bitrev__DOT__bit_cnt;
    __Vdly__bitrev__DOT__bit_cnt = 0;
    CData/*7:0*/ __Vdly__bitrev__DOT__rx_data;
    __Vdly__bitrev__DOT__rx_data = 0;
    CData/*7:0*/ __Vdly__bitrev__DOT__tx_data;
    __Vdly__bitrev__DOT__tx_data = 0;
    // Body
    __Vdly__bitrev__DOT__tx_data = vlSelf->bitrev__DOT__tx_data;
    __Vdly__bitrev__DOT__bit_cnt = vlSelf->bitrev__DOT__bit_cnt;
    __Vdly__bitrev__DOT__state = vlSelf->bitrev__DOT__state;
    __Vdly__bitrev__DOT__rx_data = vlSelf->bitrev__DOT__rx_data;
    if (vlSelf->ss) {
        __Vdly__bitrev__DOT__state = 0U;
        __Vdly__bitrev__DOT__bit_cnt = 0U;
        vlSelf->bitrev__DOT__miso_reg = 1U;
    } else if ((0U == (IData)(vlSelf->bitrev__DOT__state))) {
        __Vdly__bitrev__DOT__rx_data = ((0xfeU & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                  << 1U)) 
                                        | (IData)(vlSelf->mosi));
        __Vdly__bitrev__DOT__state = 1U;
        __Vdly__bitrev__DOT__bit_cnt = 1U;
        vlSelf->bitrev__DOT__miso_reg = 1U;
    } else if ((1U == (IData)(vlSelf->bitrev__DOT__state))) {
        if (VL_UNLIKELY((7U == (IData)(vlSelf->bitrev__DOT__bit_cnt)))) {
            __Vdly__bitrev__DOT__rx_data = ((0xfeU 
                                             & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                << 1U)) 
                                            | (IData)(vlSelf->mosi));
            __Vdly__bitrev__DOT__state = 2U;
            __Vdly__bitrev__DOT__bit_cnt = 0U;
            __Vdly__bitrev__DOT__tx_data = vlSelf->bitrev__DOT__reversed_data_next;
            vlSelf->bitrev__DOT__miso_reg = (1U & ((IData)(vlSelf->bitrev__DOT__reversed_data_next) 
                                                   >> 6U));
            VL_WRITEF("mosi: %b, rx_data: %b, tx_data: %b\n",
                      1,vlSelf->mosi,8,(IData)(vlSelf->bitrev__DOT__rx_data),
                      8,vlSelf->bitrev__DOT__reversed_data_next);
        } else if ((6U == (IData)(vlSelf->bitrev__DOT__bit_cnt))) {
            __Vdly__bitrev__DOT__bit_cnt = (7U & ((IData)(1U) 
                                                  + (IData)(vlSelf->bitrev__DOT__bit_cnt)));
            __Vdly__bitrev__DOT__rx_data = ((0xfeU 
                                             & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                << 1U)) 
                                            | (IData)(vlSelf->mosi));
            vlSelf->bitrev__DOT__miso_reg = vlSelf->mosi;
        } else {
            __Vdly__bitrev__DOT__bit_cnt = (7U & ((IData)(1U) 
                                                  + (IData)(vlSelf->bitrev__DOT__bit_cnt)));
            __Vdly__bitrev__DOT__rx_data = ((0xfeU 
                                             & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                << 1U)) 
                                            | (IData)(vlSelf->mosi));
        }
    } else if ((2U == (IData)(vlSelf->bitrev__DOT__state))) {
        if ((6U == (IData)(vlSelf->bitrev__DOT__bit_cnt))) {
            __Vdly__bitrev__DOT__rx_data = 0U;
            __Vdly__bitrev__DOT__state = 0U;
            __Vdly__bitrev__DOT__bit_cnt = 0U;
            vlSelf->bitrev__DOT__miso_reg = 1U;
        } else {
            __Vdly__bitrev__DOT__bit_cnt = (7U & ((IData)(1U) 
                                                  + (IData)(vlSelf->bitrev__DOT__bit_cnt)));
            __Vdly__bitrev__DOT__tx_data = (0x7eU & 
                                            ((IData)(vlSelf->bitrev__DOT__tx_data) 
                                             << 1U));
            vlSelf->bitrev__DOT__miso_reg = (1U & ((IData)(vlSelf->bitrev__DOT__tx_data) 
                                                   >> 5U));
        }
    } else {
        __Vdly__bitrev__DOT__state = 0U;
        vlSelf->bitrev__DOT__miso_reg = 1U;
    }
    vlSelf->bitrev__DOT__state = __Vdly__bitrev__DOT__state;
    vlSelf->bitrev__DOT__bit_cnt = __Vdly__bitrev__DOT__bit_cnt;
    vlSelf->bitrev__DOT__tx_data = __Vdly__bitrev__DOT__tx_data;
    vlSelf->bitrev__DOT__rx_data = __Vdly__bitrev__DOT__rx_data;
    vlSelf->miso = vlSelf->bitrev__DOT__miso_reg;
    vlSelf->bitrev__DOT__reversed_data_next = ((0x80U 
                                                & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                   << 7U)) 
                                               | ((0x40U 
                                                   & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                      << 5U)) 
                                                  | ((0x20U 
                                                      & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                         << 3U)) 
                                                     | ((0x10U 
                                                         & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                            << 1U)) 
                                                        | ((8U 
                                                            & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                               >> 1U)) 
                                                           | ((4U 
                                                               & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                                  >> 3U)) 
                                                              | ((2U 
                                                                  & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                                     >> 5U)) 
                                                                 | (1U 
                                                                    & ((IData)(vlSelf->bitrev__DOT__rx_data) 
                                                                       >> 7U)))))))));
}

VL_INLINE_OPT void Vbitrev___024root___nba_sequent__TOP__1(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___nba_sequent__TOP__1\n"); );
    // Body
    vlSelf->bitrev__DOT__test = vlSelf->mosi;
}

void Vbitrev___024root___eval_nba(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_nba\n"); );
    // Body
    if ((2ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vbitrev___024root___nba_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vbitrev___024root___nba_sequent__TOP__1(vlSelf);
    }
}

void Vbitrev___024root___eval_triggers__act(Vbitrev___024root* vlSelf);

bool Vbitrev___024root___eval_phase__act(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_phase__act\n"); );
    // Init
    VlTriggerVec<2> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vbitrev___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelf->__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
        vlSelf->__VnbaTriggered.thisOr(vlSelf->__VactTriggered);
        Vbitrev___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vbitrev___024root___eval_phase__nba(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_phase__nba\n"); );
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelf->__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vbitrev___024root___eval_nba(vlSelf);
        vlSelf->__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vbitrev___024root___dump_triggers__nba(Vbitrev___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vbitrev___024root___dump_triggers__act(Vbitrev___024root* vlSelf);
#endif  // VL_DEBUG

void Vbitrev___024root___eval(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval\n"); );
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vbitrev___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("bitrev.v", 1, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                Vbitrev___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("bitrev.v", 1, "", "Active region did not converge.");
            }
            vlSelf->__VactIterCount = ((IData)(1U) 
                                       + vlSelf->__VactIterCount);
            vlSelf->__VactContinue = 0U;
            if (Vbitrev___024root___eval_phase__act(vlSelf)) {
                vlSelf->__VactContinue = 1U;
            }
        }
        if (Vbitrev___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vbitrev___024root___eval_debug_assertions(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->sck & 0xfeU))) {
        Verilated::overWidthError("sck");}
    if (VL_UNLIKELY((vlSelf->ss & 0xfeU))) {
        Verilated::overWidthError("ss");}
    if (VL_UNLIKELY((vlSelf->mosi & 0xfeU))) {
        Verilated::overWidthError("mosi");}
}
#endif  // VL_DEBUG
