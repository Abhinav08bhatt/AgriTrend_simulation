from fastapi import APIRouter, UploadFile, File, HTTPException
import pandas as pd
from io import StringIO

from state.dataset_store import set_dataset, set_model_bundle
from core.model import train_yield_model

router = APIRouter()


REQUIRED_COLUMNS = [
    "year",
    "rainfall_mm",
    "temperature_c",
    "soil_index",
    "irrigation_pct",
    "fertilizer_kg_ha",
    "yield_kg_ha",
]


@router.post("/upload")
async def upload_csv(file: UploadFile = File(...)):
    """
    Upload historical CSV data.
    Trains model immediately after loading.
    """
    try:
        content = await file.read()
        df = pd.read_csv(StringIO(content.decode("utf-8")))
    except Exception:
        raise HTTPException(status_code=400, detail="Invalid CSV file")

    # Validate schema
    missing = [c for c in REQUIRED_COLUMNS if c not in df.columns]
    if missing:
        raise HTTPException(
            status_code=400,
            detail=f"Missing columns: {missing}",
        )

    # Sort by year (important!)
    df = df.sort_values("year").reset_index(drop=True)

    # Store dataset
    set_dataset(df)

    # Train model (standardized regression model)
    model_bundle = train_yield_model(df)
    set_model_bundle(model_bundle)

    return {
        "rows": len(df),
        "years": [int(df["year"].min()), int(df["year"].max())],
        "status": "Dataset loaded and model trained",
    }
