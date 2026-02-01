// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vbitrev.h for the primary calling header

#include "Vbitrev__pch.h"
#include "Vbitrev__Syms.h"
#include "Vbitrev___024root.h"

void Vbitrev___024root___ctor_var_reset(Vbitrev___024root* vlSelf);

Vbitrev___024root::Vbitrev___024root(Vbitrev__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vbitrev___024root___ctor_var_reset(this);
}

void Vbitrev___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vbitrev___024root::~Vbitrev___024root() {
}
