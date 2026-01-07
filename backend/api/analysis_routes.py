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

    # 🔒 STRICT COLUMN FILTER (CRITICAL)
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

    results = run_regression_analysis(df)
    std_coeffs = results["std_coeffs"]

    # 🔒 FORCE JSON-SAFE VALUES
    std_coeffs = std_coeffs.replace([np.inf, -np.inf], np.nan)
    std_coeffs = std_coeffs.fillna(0.0)

    return {
        "factors": std_coeffs["Factor"].tolist(),
        "standardized_impact": std_coeffs["Standardized_Impact"].round(6).tolist(),
        "relative_contribution": std_coeffs["Relative_Contribution (%)"].round(6).tolist(),
    }
