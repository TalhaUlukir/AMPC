# Algebraic MPC (AMPC) Toolbox for MATLAB/Simulink  
**Smooth, Closed-Form, Optimization-Free MPC for Real-Time Applications**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](#license)
[![MATLAB](https://img.shields.io/badge/MATLAB-R2020b+-blue.svg)]()
[![Platform](https://img.shields.io/badge/Platform-MATLAB/Simulink-orange.svg)]()

The **AMPC Toolbox** provides a unified, fully algebraic formulation of Model Predictive Control (MPC) using **tanh-embedded constraints**, eliminating the need for any online optimization. All heavy computations are completed offline, and the online controller evaluates a lightweight nested–tanh control law with **microsecond-level runtime**, independent of prediction horizon.


---

## 🚀 Key Features

- **No Quadratic Programming** — MPC solved *entirely algebraically*
- **Closed-form nested–tanh control law**
- **Horizon-invariant computation time** (≈ 2–20 µs)
- **16 AMPC modes**, configurable via Simulink mask:
  - Integral action  
  - Disturbance model  
  - Input rate limits  
  - Output/feedback constraints  
- **Automatic model augmentation** (A, B, C → augmented system)
- **Unified offline–online architecture**
- **Simulink-ready block** for real-time control
- Compatible with any **discrete-time LTI** system

---

## 🎛 Simulink Block Overview

The AMPC Toolbox provides a drop-in Simulink block for real-time implementation.

### **Inputs**
- `r(k)` — Reference signal  
- `y(k)` or `x(k)` — Measured outputs or states  

### **Outputs**
- `u(k)` — Constrained control input  
- *(Optional)* computation time `t_c`

### **Mask Parameters**
- Discrete-time plant model: `A`, `B`, `C`, `D`, `Ts`
- Enable/disable:
  - Integral action  
  - Disturbance input  
  - Rate limit (Δu)  
  - Output-constraint shaping  
- Weight matrices: `Q`, `R`, `P`
- Prediction horizon `N`
- Constraint limits: `u_min`, `u_max`, `y_min`, `y_max`, `u_dot_max`

### **Automatic Mode Selection**
The block internally chooses among **16 AMPC controller modes** based on mask options.

---

## ⚙️ How It Works

### **Offline Stage (initialization, once)**
- Model augmentation  
- Constraint symmetrization  
- Batch matrices `Sy`, `Su`  
- Cost condensation → `H`, `F`, `Y`  
- Algebraic matrices `K1–K5`

### **Online Stage (every control step)**

A closed-form nested–tanh control law is evaluated:

```matlab
u(k) = Uc * tanh( Uc^-1 * ( K1*tanh(K2*x + K3*tanh(K4*x)) - K5*x ) );
```

---

## 📊 **Performance Summary**

```markdown


Measured online computation time (based on IFAC WC simulations):

| System | Case | N=10 | N=20 | N=50 | N=100 |
|--------|------|-------|-------|-------|--------|
| 2-state | 1  | 0.0068 µs | 0.010 µs | 0.041 µs | 0.160 µs |
| 2-state | 8  | 0.0091 µs | 0.026 µs | 0.053 µs | 0.206 µs |
| 2-state | 16 | 0.011 µs  | 0.045 µs | 0.073 µs | 0.293 µs |
| 4-state | 1  | 0.018 µs | 0.113 µs | 0.126 µs | 0.339 µs |
| 4-state | 8  | 0.022 µs | 0.120 µs | 0.138 µs | 0.495 µs |
| 4-state | 16 | 0.046 µs | 0.129 µs | 0.149 µs | 0.568 µs |
```
## **Key Findings**
- Runtime is **nearly horizon-invariant**
- All controller modes exhibit similar execution times
- Suitable for embedded real-time systems  
- Constraint satisfaction is smooth and stable  

---

## 📦 Installation

1. [Download Toolbox](AMPC.mltbx)
2. Double-click to install
3. MATLAB automatically registers the toolbox under  
   **Home → Add-Ons → Algebraic MPC Toolbox**
   
---
## 📚 Academic References

The theoretical foundations and application areas of this toolbox are supported by the following peer-reviewed publications:

[1] Algebraic MPC Theory
Dursun, U., Yıldız Taşkıkarağoğlu, F., & Üstoğlu, İ.
An algebraic and suboptimal solution of constrained model predictive control via tangent hyperbolic function.
Asian Journal of Control, 2020.
DOI: https://doi.org/10.1002/asjc.2357

[2] Algebraic MPC for Automatic Landing
Ulukır, T., Dursun, U., & Üstoğlu, İ.
Automatic landing of fixed-wing aircraft with constrained algebraic model predictive control.
Control Theory and Technology, 2025.
DOI: https://doi.org/10.1007/s11768-025-00275-5

