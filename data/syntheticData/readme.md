# Synthetic Agricultural Data

This folder contains synthetically generated agricultural datasets used for
simulation, analysis, modeling, and scenario evaluation within the
**AgriTrend_simulation** project.

The synthetic data is designed to be **plausible and controlled**, rather than
an exact representation of any specific real-world region.

## File

- `universal_synthetic_data.csv`  
  A general-purpose synthetic dataset used across all analyses and scenarios.

## Data Structure

Each row represents one year of agricultural conditions.

| Column Name            | Description |
|------------------------|-------------|
| `year`                 | Calendar year |
| `rainfall_mm`          | Annual rainfall (mm) |
| `temperature_c`        | Average temperature (°C) |
| `soil_index`           | Soil health index (normalized) |
| `irrigation_pct`       | Percentage of land under irrigation |
| `fertilizer_kg_ha`     | Fertilizer usage (kg per hectare) |
| `pest_pressure_index`  | Pest pressure (normalized index) |
| `yield_kg_ha`          | Crop yield (kg per hectare) |

## Key Characteristics

- Values are constrained within realistic physical limits
- Long-term trends are intentionally embedded
- Year-to-year variability is included
- Randomness is controlled through fixed seeds for reproducibility

## Intended Use

This dataset is suitable for:
- trend analysis
- regression modeling
- baseline future projection
- scenario comparison and stress testing

The data is not meant to produce exact predictions, but to support exploration
of **long-term behavior under different assumptions**.
