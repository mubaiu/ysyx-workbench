// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vbitrev.h for the primary calling header

#include "Vbitrev__pch.h"
#include "Vbitrev__Syms.h"
#include "Vbitrev___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vbitrev___024root___dump_triggers__act(Vbitrev___024root* vlSelf);
#endif  // VL_DEBUG

void Vbitrev___024root___eval_triggers__act(Vbitrev___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root___eval_triggers__act\n"); );
    // Body
    vlSelf->__VactTriggered.set(0U, ((IData)(vlSelf->sck) 
                                     & (~ (IData)(vlSelf->__Vtrigprevexpr___TOP__sck__0))));
    vlSelf->__VactTriggered.set(1U, (((IData)(vlSelf->sck) 
                                      & (~ (IData)(vlSelf->__Vtrigprevexpr___TOP__sck__0))) 
                                     | ((IData)(vlSelf->ss) 
                                        & (~ (IData)(vlSelf->__Vtrigprevexpr___TOP__ss__0)))));
    vlSelf->__Vtrigprevexpr___TOP__sck__0 = vlSelf->sck;
    vlSelf->__Vtrigprevexpr___TOP__ss__0 = vlSelf->ss;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vbitrev___024root___dump_triggers__act(vlSelf);
    }
#endif
}
