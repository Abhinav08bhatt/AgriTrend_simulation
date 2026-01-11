# Data Directory

This folder contains all datasets used by the **AgriTrend_simulation** project.

The project is intentionally designed to separate **data** from **code**, so that
datasets can be inspected, replaced, or extended without modifying the core
analysis or modeling logic.

Currently, the system works with **synthetic agricultural data**, while keeping
the structure open for future integration of real-world datasets.

## Folder Structure

- `syntheticData/`  
  Contains generated datasets used for simulation, trend analysis, modeling,
  and scenario evaluation.

- `realData/`  
  Reserved for real-world agricultural datasets.  
  This folder documents how real data can be integrated when available.

## Design Philosophy

The data layer is kept simple and transparent:
- all datasets are stored as tabular files (CSV)
- file paths are centralized and managed by the codebase
- switching between datasets does not require architectural changes

This approach ensures reproducibility, clarity, and ease of future extension.
