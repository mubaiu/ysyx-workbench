// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vbitrev.h for the primary calling header

#include "Vbitrev__pch.h"
#include "Vbitrev___024root.h"

VL_ATTR_COLD void Vbitrev___024root___eval_static(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_static\n"); );
}

VL_ATTR_COLD void Vbitrev___024root___eval_initial(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vtrigprevexpr___TOP__sck__0 = vlSelf->sck;
    vlSelf->__Vtrigprevexpr___TOP__ss__0 = vlSelf->ss;
}

VL_ATTR_COLD void Vbitrev___024root___eval_final(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_final\n"); );
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vbitrev___024root___dump_triggers__stl(Vbitrev___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vbitrev___024root___eval_phase__stl(Vbitrev___024root* vlSelf);

VL_ATTR_COLD void Vbitrev___024root___eval_settle(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_settle\n"); );
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelf->__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY((0x64U < __VstlIterCount))) {
#ifdef VL_DEBUG
            Vbitrev___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("bitrev.v", 1, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vbitrev___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelf->__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vbitrev___024root___dump_triggers__stl(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VstlTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vbitrev___024root___stl_sequent__TOP__0(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___stl_sequent__TOP__0\n"); );
    // Body
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

VL_ATTR_COLD void Vbitrev___024root___eval_stl(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_stl\n"); );
    // Body
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        Vbitrev___024root___stl_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
        vlSelf->__Vm_traceActivity[0U] = 1U;
    }
}

VL_ATTR_COLD void Vbitrev___024root___eval_triggers__stl(Vbitrev___024root* vlSelf);

VL_ATTR_COLD bool Vbitrev___024root___eval_phase__stl(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_phase__stl\n"); );
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vbitrev___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelf->__VstlTriggered.any();
    if (__VstlExecute) {
        Vbitrev___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vbitrev___024root___dump_triggers__act(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge sck)\n");
    }
    if ((2ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @(posedge sck or posedge ss)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vbitrev___024root___dump_triggers__nba(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge sck)\n");
    }
    if ((2ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @(posedge sck or posedge ss)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vbitrev___024root___ctor_var_reset(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->sck = VL_RAND_RESET_I(1);
    vlSelf->ss = VL_RAND_RESET_I(1);
    vlSelf->mosi = VL_RAND_RESET_I(1);
    vlSelf->miso = VL_RAND_RESET_I(1);
    vlSelf->bitrev__DOT__state = VL_RAND_RESET_I(2);
    vlSelf->bitrev__DOT__bit_cnt = VL_RAND_RESET_I(3);
    vlSelf->bitrev__DOT__rx_data = VL_RAND_RESET_I(8);
    vlSelf->bitrev__DOT__tx_data = VL_RAND_RESET_I(8);
    vlSelf->bitrev__DOT__miso_reg = VL_RAND_RESET_I(1);
    vlSelf->bitrev__DOT__reversed_data_next = VL_RAND_RESET_I(8);
    vlSelf->bitrev__DOT__test = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__sck__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__ss__0 = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
