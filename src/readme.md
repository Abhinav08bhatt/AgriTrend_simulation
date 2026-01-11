# Source Code (`src/`)

This folder contains the complete source code for the **AgriTrend_simulation**
project.

The codebase is organized into small, focused modules, where each file is
responsible for a single part of the simulation pipeline. This modular structure
keeps the system easy to understand, debug, and extend.

The source code is independent of any specific dataset and is designed to work
with both synthetic and future real-world agricultural data.

---

## Module Overview

### `data_generation.py`
Generates **universal synthetic agricultural data** used for baseline simulation.
This module defines realistic long-term trends, variability, and constraints
across environmental and management factors.

---

### `crop_data_generation.py`
Generates **crop-specific synthetic datasets** (e.g., rice, wheat, maize).

Each function returns a structured DataFrame with the same schema, allowing
different crop behaviors to be analyzed using the same pipeline.

This module focuses only on **data generation**, not file storage.

---

### `data_loader.py`
Handles all dataset input/output operations.

Responsibilities include:
- saving generated datasets to disk
- loading datasets for analysis
- ensuring a single, consistent data storage location

This separation ensures that data handling remains centralized and predictable.

---

### `analysis.py`
Performs historical analysis on the dataset, including:
- regression-based factor analysis
- standardized coefficient computation
- identification of relative factor influence

The goal of this module is **interpretation**, not prediction.

---

### `model.py`
Trains a yield response model using historical data and uses it to:
- project a baseline future assuming no intervention
- support scenario-based comparisons

The model is intentionally simple and interpretable, prioritizing transparency
over complexity.

---

### `scenarios.py`
Defines scenario logic used to modify baseline future conditions.

Each scenario applies controlled, yearly changes to selected factors and
evaluates how these changes affect long-term yield trends relative to the
baseline.

---

### `visualization.py`
Generates all plots used in the project, including:
- historical yield trends
- standardized factor trends
- individual factor time series
- factor contribution charts
- baseline vs scenario comparison plots

All visualizations are generated automatically and saved to the outputs folder.

---

### `report_builder.py`
Builds the final **PDF report** by combining:
- explanatory text
- generated graphs
- dataset and scenario metadata

The report is designed to be scenario-aware, interpretation-safe, and suitable
for review without requiring access to the code.

---

### `paths.py`
Centralizes all filesystem paths used across the project.

This ensures:
- consistent file locations
- easier maintenance
- portability across environments

---

## Design Principles

- clear separation of concerns
- reproducible and transparent analysis
- scenario-aware reporting
- easy replacement of datasets without code changes

This structure allows the project to function both as a simulation tool and as a
foundation for future research or educational extensions.
