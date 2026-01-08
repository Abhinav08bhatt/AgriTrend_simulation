import numpy as np
import pandas as pd
from fastapi import APIRouter
from pydantic import BaseModel
from io import StringIO
from core.analysis import run_regression_analysis

router = APIRouter()

class DatasetPayload(BaseModel):
    csv: str

@router.post("/regression")
def regression_analysis(payload: DatasetPayload):
    df = pd.read_csv(StringIO(payload.csv))

    required_cols = [
        "year",
        "rainfall_mm",
        "temperature_c",
        "soil_index",
        "irrigation_pct",
        "fertilizer_kg_ha",
        "yield_kg_ha",
    ]
    df = df[required_cols]

    # 🔒 CRITICAL FIX (BEFORE REGRESSION)
    df = df.replace([np.inf, -np.inf], np.nan).dropna()

    if len(df) < 3:
        return {
            "factors": [],
            "standardized_impact": [],
            "relative_contribution": [],
        }

    results = run_regression_analysis(df)
    std_coeffs = results["std_coeffs"]

    # 🔒 JSON-SAFE
    std_coeffs = std_coeffs.replace([np.inf, -np.inf], np.nan).fillna(0.0)

    return {
        "factors": std_coeffs["Factor"].tolist(),
        "standardized_impact": std_coeffs["Standardized_Impact"].round(6).tolist(),
        "relative_contribution": std_coeffs["Relative_Contribution (%)"].round(6).tolist(),
    }
