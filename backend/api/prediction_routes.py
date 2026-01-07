from fastapi import APIRouter, HTTPException
from state.dataset_store import get_model_bundle, get_dataset
from core.model import train_yield_model

router = APIRouter()


@router.get("/status")
def prediction_status():
    """
    Simple sanity endpoint.
    Confirms prediction routes are alive.
    """
    return {"status": "Prediction routes ready"}
