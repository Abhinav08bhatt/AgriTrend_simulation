import numpy as np
import pandas as pd
import os

def generate_base_factors(seed=123):
    np.random.seed(seed)
    years = np.arange(2000, 2025)
    n = len(years)

    # Rainfall
    baseline_rainfall = 800
    rainfall_trend = -3
    rainfall = (
        baseline_rainfall
        + rainfall_trend * (years - years[0])
        + np.random.normal(0, 60, n)
    )
    rainfall = np.clip(rainfall, 300, None)

    # Temperature
    temperature = (
        25.0
        + 0.03 * (years - years[0])
        + np.random.normal(0, 0.4, n)
    )

    # Soil
    soil = np.zeros(n)
    soil[0] = 0.72
    for i in range(1, n):
        soil[i] = soil[i - 1] - 0.003 + np.random.normal(0, 0.005)
    soil = np.clip(soil, 0.5, 0.85)

    # Irrigation
    irrigation = (
        30
        + 1.0 * (years - years[0])
        - 0.03 * (rainfall - rainfall.mean())
        + np.random.normal(0, 2.0, n)
    )
    irrigation = np.clip(irrigation, 30, 70)

    # Fertilizer
    fertilizer = (
        80
        + 0.8 * irrigation
        - 60 * (soil - 0.7)
        + 1.2 * (years - years[0])
        + np.random.normal(0, 10, n)
    )
    fertilizer = np.clip(fertilizer, 50, 200)

    # Pests
    pests = np.random.uniform(0.1, 0.5, n)
    for i in np.random.choice(n, 3, replace=False):
        pests[i] += np.random.uniform(0.4, 0.6)
    pests = np.clip(pests, 0, 1)

    return years, rainfall, temperature, soil, irrigation, fertilizer, pests


def generate_rice_synthetic(seed=123):
    years, rain, temp, soil, irr, fert, pest = generate_base_factors(seed)

    yield_kg_ha = (
        1500
        + 3.2 * rain                 # rice loves water
        + 1400 * soil
        + 18 * irr
        + 2.5 * fert
        - 160 * (temp - 25)          # heat stress
        - 1200 * pest                # very pest sensitive
        - 20 * (years - years[0])    # sustainability stress
        + np.random.normal(0, 180, len(years))
    )

    data = pd.DataFrame({
        "year": years,
        "rainfall_mm": rain.round(1),
        "temperature_c": temp.round(2),
        "soil_index": soil.round(3),
        "irrigation_pct": irr.round(1),
        "fertilizer_kg_ha": fert.round(1),
        "pest_pressure_index": pest.round(2),
        "yield_kg_ha": np.clip(yield_kg_ha, 0, None).round(0)
    })

    # data.to_csv(path, index=False)
    return data


def generate_wheat_synthetic(seed=123):
    years, rain, temp, soil, irr, fert, pest = generate_base_factors(seed)

    yield_kg_ha = (
        1800
        + 1.8 * rain
        + 1100 * soil
        + 10 * irr
        + 3.0 * fert
        - 220 * (temp - 22)          # wheat hates heat
        - 700 * pest
        - 12 * (years - years[0])
        + np.random.normal(0, 140, len(years))
    )

    data = pd.DataFrame({
        "year": years,
        "rainfall_mm": rain.round(1),
        "temperature_c": temp.round(2),
        "soil_index": soil.round(3),
        "irrigation_pct": irr.round(1),
        "fertilizer_kg_ha": fert.round(1),
        "pest_pressure_index": pest.round(2),
        "yield_kg_ha": np.clip(yield_kg_ha, 0, None).round(0)
    })

    # data.to_csv(path, index=False)
    return data


def generate_maize_synthetic(seed=789):
    years, rain, temp, soil, irr, fert, pest = generate_base_factors(seed)

    yield_kg_ha = (
        2000
        + 2.2 * rain
        + 1000 * soil
        + 14 * irr
        + 4.2 * fert                # maize LOVES fertilizer
        - 140 * (temp - 26)
        - 900 * pest
        - 10 * (years - years[0])
        + np.random.normal(0, 160, len(years))
    )

    data = pd.DataFrame({
        "year": years,
        "rainfall_mm": rain.round(1),
        "temperature_c": temp.round(2),
        "soil_index": soil.round(3),
        "irrigation_pct": irr.round(1),
        "fertilizer_kg_ha": fert.round(1),
        "pest_pressure_index": pest.round(2),
        "yield_kg_ha": np.clip(yield_kg_ha, 0, None).round(0)
    })

    # data.to_csv(path, index=False)
    return data


