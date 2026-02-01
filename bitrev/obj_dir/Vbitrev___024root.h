// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vbitrev.h for the primary calling header

#ifndef VERILATED_VBITREV___024ROOT_H_
#define VERILATED_VBITREV___024ROOT_H_  // guard

#include "verilated.h"


class Vbitrev__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vbitrev___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(sck,0,0);
    VL_IN8(ss,0,0);
    VL_IN8(mosi,0,0);
    VL_OUT8(miso,0,0);
    CData/*1:0*/ bitrev__DOT__state;
    CData/*2:0*/ bitrev__DOT__bit_cnt;
    CData/*7:0*/ bitrev__DOT__rx_data;
    CData/*7:0*/ bitrev__DOT__tx_data;
    CData/*0:0*/ bitrev__DOT__miso_reg;
    CData/*7:0*/ bitrev__DOT__reversed_data_next;
    CData/*0:0*/ bitrev__DOT__test;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __Vtrigprevexpr___TOP__sck__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__ss__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<CData/*0:0*/, 2> __Vm_traceActivity;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<2> __VactTriggered;
    VlTriggerVec<2> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vbitrev__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vbitrev___024root(Vbitrev__Syms* symsp, const char* v__name);
    ~Vbitrev___024root();
    VL_UNCOPYABLE(Vbitrev___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
