// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vbitrev__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vbitrev::Vbitrev(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vbitrev__Syms(contextp(), _vcname__, this)}
    , sck{vlSymsp->TOP.sck}
    , ss{vlSymsp->TOP.ss}
    , mosi{vlSymsp->TOP.mosi}
    , miso{vlSymsp->TOP.miso}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vbitrev::Vbitrev(const char* _vcname__)
    : Vbitrev(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vbitrev::~Vbitrev() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vbitrev___024root___eval_debug_assertions(Vbitrev___024root* vlSelf);
#endif  // VL_DEBUG
void Vbitrev___024root___eval_static(Vbitrev___024root* vlSelf);
void Vbitrev___024root___eval_initial(Vbitrev___024root* vlSelf);
void Vbitrev___024root___eval_settle(Vbitrev___024root* vlSelf);
void Vbitrev___024root___eval(Vbitrev___024root* vlSelf);

void Vbitrev::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vbitrev::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vbitrev___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vbitrev___024root___eval_static(&(vlSymsp->TOP));
        Vbitrev___024root___eval_initial(&(vlSymsp->TOP));
        Vbitrev___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vbitrev___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vbitrev::eventsPending() { return false; }

uint64_t Vbitrev::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vbitrev::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vbitrev___024root___eval_final(Vbitrev___024root* vlSelf);

VL_ATTR_COLD void Vbitrev::final() {
    Vbitrev___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vbitrev::hierName() const { return vlSymsp->name(); }
const char* Vbitrev::modelName() const { return "Vbitrev"; }
unsigned Vbitrev::threads() const { return 1; }
void Vbitrev::prepareClone() const { contextp()->prepareClone(); }
void Vbitrev::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vbitrev::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vbitrev___024root__trace_decl_types(VerilatedVcd* tracep);

void Vbitrev___024root__trace_init_top(Vbitrev___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vbitrev___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vbitrev___024root*>(voidSelf);
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    Vbitrev___024root__trace_decl_types(tracep);
    Vbitrev___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vbitrev___024root__trace_register(Vbitrev___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vbitrev::trace(VerilatedVcdC* tfp, int levels, int options) {
    if (tfp->isOpen()) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vbitrev::trace()' shall not be called after 'VerilatedVcdC::open()'.");
    }
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addModel(this);
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vbitrev___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}
