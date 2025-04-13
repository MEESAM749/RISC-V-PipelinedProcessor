# RISC-V Pipelined Processor 🚀

This project is a simulation of a **5-stage RISC-V pipelined processor**, built in **Verilog** and simulated using **Xilinx ISE Design Suite 14.5**. The goal is to gain hands-on experience with processor architecture, pipelining concepts, and hardware simulation/verification workflows.

---

## 🎯 Objectives

- Implement a classic 5-stage RISC-V pipeline:
  1. Instruction Fetch (IF)  
  2. Instruction Decode (ID)  
  3. Execute (EX)  
  4. Memory Access (MEM)  
  5. Write Back (WB)
- Understand instruction flow, hazards, stalling, and forwarding
- Simulate and verify behavior using waveform analysis tools

---

## ✅ Current Progress

- ✅ Stage 1: Instruction Fetch  
- ✅ Stage 2: Instruction Decode  
- ✅ Stage 3: Execute  
- ✅ Stage 4: Memory Access  
- ✅ Stage 5: Write Back  
- 🔄 **Currently working on integrating all stages into a single top-level module**

---

## 🛠 Tools & Technologies

- **Language**: Verilog HDL  
- **Simulation Suite**: Xilinx ISE Design Suite 14.5  
- **Architecture**: RISC-V (RV32I subset)

---


---

## 🧪 Testing & Simulation

Each pipeline stage is tested using dedicated testbenches.  
Simulation is performed using **ISim**, part of Xilinx ISE, with waveform analysis for functional verification.

---

## 🔮 Future Work

- [ ] Complete top-level integration  
- [ ] Implement hazard detection and data forwarding  
- [ ] Add support for more RISC-V instructions  
- [ ] Run realistic instruction streams and benchmark patterns  
- [ ] Optimize for timing and area (targeting FPGA synthesis later)

---

## 📜 License

MIT License — feel free to use, modify, and share. Attribution is appreciated.

---

## 🤝 Contributions

If you're working on similar projects or interested in collaboration, feel free to open an issue or start a discussion. Feedback and contributions are welcome!

