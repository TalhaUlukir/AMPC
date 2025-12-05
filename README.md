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

## 📦 Installation

### **Option 1 — Install the Toolbox File**
1. Download **`AMPC.mltbx`**
2. Double-click to install
3. MATLAB automatically registers the toolbox under  
   **Home → Add-Ons → Algebraic MPC Toolbox**
   
## 🎛 Simulink Block Overview
- Inputs: r(k), y(k)/x(k)
- Outputs: u(k), optional t_c
- Mask parameters with categories
- Automatic case selection (16 AMPC modes)
- Short diagram placeholder


### **Option 2 — Clone the Repository**
```bash
git clone https://github.com/<your-username>/AMPC-Toolbox.git
