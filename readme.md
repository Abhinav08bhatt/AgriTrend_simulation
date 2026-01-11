# AgriTrend_simulation

### Long-Term Crop Yield Trend Analysis & Scenario Simulation Framework

AgriTrend_simulation is a **research-oriented simulation project** designed to
study **long-term crop yield behavior** under environmental and management stress.

Instead of focusing on short-term prediction, the project emphasizes:

- explainability over black-box accuracy  
- long-term trend analysis  
- scenario-based reasoning  
- automated, reproducible reporting  

The system runs a **complete analysis pipeline** and automatically generates
**visualizations** and a **structured PDF report** that summarizes:

- historical trends  
- factor influence on yield  
- baseline futures  
- controlled intervention scenarios  

This repository represents the **Round 2 continuation** of the project,
originally developed for **Hack The Winter – Round 1**.

---

## Problem Statement

Modern agriculture is under increasing pressure from:

- climate variability and rising temperatures  
- soil degradation  
- growing dependency on inputs such as irrigation and fertilizer  

In many observed systems:

- inputs increase every year  
- yields do not improve at the same rate  
- yield becomes more unstable over time  

Most existing solutions either:
- focus on short-term prediction, or  
- rely on opaque, API-driven, black-box models  

There is a need for a **transparent system** that answers a simpler but more
fundamental question:

**If current trends continue, how might crop yield behave in the long run — and which changes actually matter?**

---

## Theme
- **AI / Machine Learning**

---

## Solution Overview

AgriTrend_simulation addresses this problem through a structured and explainable pipeline:

1. Generate statistically realistic synthetic agricultural data  
2. Analyze long-term relationships between factors and yield  
3. Quantify the relative importance of yield drivers  
4. Project a baseline future assuming no intervention  
5. Compare it against controlled scenario-based changes  

> The system does **not** aim to predict exact future yields.  
> It is designed to reveal **patterns, risks, sensitivities, and limits** under sustained conditions.

---

## Project Evolution

### 🔹 Round 1 Summary (Prototype Foundation)

Round 1 focused on establishing a **clean, interpretable proof of concept**.

**Scope in Round 1:**
- One synthetic region  
- One synthetic crop  
- ~25 years of tabular data  
- Linear regression models (raw + standardized)  
- Single best-case intervention scenario  

**Key insights from Round 1:**
- Yield shows increasing instability over time  
- Rising inputs do not guarantee yield growth  
- A small number of factors dominate yield behavior  
- Baseline futures carry increasing long-term risk  
- Coordinated 1% improvements can stabilize trends under certain conditions  

**Round 1 code is preserved and accessible:**  
- Git tag: `round-1-final`
- Branch: `round-1`
- Round 1 Tag:   
  https://github.com/Abhinav08bhatt/AgriTrend_simulation/tree/round-1-final
- Round 1 Branch:  
  https://github.com/Abhinav08bhatt/AgriTrend_simulation/tree/round-1

---

### 🔹 Round 2 Enhancements (Current Version)

Round 2 extends the prototype into a **more flexible and presentable system**:

- Multiple selectable synthetic crops (rice, wheat, maize, universal)  
- Multiple selectable scenarios (best-case, drought stress, fertilizer optimization, climate shift)  
- Dataset-aware automated PDF reports  
- Cleaner project structure and documentation  
- Improved interpretability and safer reporting language  

**Round 2 code is preserved and accessible:**  
- Git tag: `round-2-final`
- Branch: `round-2`
- Round 2 Tag:   
  https://github.com/Abhinav08bhatt/AgriTrend_simulation/tree/round-2-final
- Round 2 Branch:  
  https://github.com/Abhinav08bhatt/AgriTrend_simulation/tree/round-2

---

## What the System Does / Does Not Do

<details>
<summary><b>What the system DOES</b></summary>

- Generates realistic synthetic agricultural datasets  
- Analyzes historical yield trends  
- Quantifies factor influence using interpretable models  
- Projects baseline futures  
- Simulates controlled intervention scenarios  
- Automatically generates graphs and a final PDF report  

</details>

<details>
<summary><b>What the system DOES NOT do</b></summary>

- Predict real-world yields  
- Claim causal certainty  
- Use black-box or deep learning models  
- Replace domain expertise  
- Provide a production-grade decision system  

</details>

---

## Documentation (Recommended)

- **System flow & architecture:**  
  [RepoWorking.md](RepoWorking.md)

- **Step-by-step reasoning notebook:**  
  [Documentation Notebook](notebooks/documentation_code.ipynb)

> The notebook provides the best insight into design decisions, assumptions, and interpretation logic.

---

## Preview

![Documentation Preview](preview/Documentation.png)
![Auto Generation Preview](preview/AutoGenerate.png)

---

## How to Run

### 1. Check Python version (3.9+)
```bash
python --version
```

### 2. Clone the repository
```bash
git clone https://github.com/Abhinav08bhatt/AgriTrend_simulation.git
cd AgriTrend_simulation
```

### 3. Create a virtual environment (recommended)
- **Windows**
```bash
python -m venv venv
```
- **Linux/macOS**
```bash
source venv/bin/activate   
```

### 4. Install dependencies
```bash
pip install -r requirements.txt
```

### 5. Run the simulation
```bash
python AgriTrend_simulation.py
```

### 6. View generated report
> Reports are saved automatically in:
```bash
outputs/reports/
```

---

## Limitations
- Synthetic data only
- Linear modeling by design
- No economic or policy constraints
- No regional calibration

These limitations are intentional to preserve clarity and explainability.

---

## Future Directions

Planned extensions include:
- Interactive GUI or local app interface
- Expanded crop and regional modeling
- Improved data validation
- Integration of real-world datasets (where feasible)
- Interactive scenario exploration

---

## Team

This project was developed by **The Eskimos!** as part of *Hack The Winter*.

> Development activity appears under a single Git account due to coordination and submission constraints.
> Work was planned, reviewed, and distributed among team members according to individual skill sets and responsibility areas.

### Team Members & Roles

- **Abhinav**  
  *System design, data modeling, analysis pipeline implementation, scenario logic, visualization, report generation, and overall integration.*

- **Anubhav**  
  *Problem formulation, conceptual discussion, validation of assumptions, and feedback on analytical approach.*

- **Hariom Chamoli**  
  *Review of system flow, interpretation of results, and documentation feedback.*

- **Abhinav Benjwal**  
  *Documentation assistance, README review, and project presentation inputs.*

> Roles reflect contribution areas rather than commit volume.
---

## License

This project is intended for academic, educational, and research demonstration purposes.

---