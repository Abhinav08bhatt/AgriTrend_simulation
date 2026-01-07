import pandas as pd

# In-memory state (simple + research-safe)
DATASET: pd.DataFrame | None = None
MODEL_BUNDLE: dict | None = None


def set_dataset(df: pd.DataFrame):
    global DATASET
    DATASET = df


def get_dataset() -> pd.DataFrame:
    if DATASET is None:
        raise RuntimeError("Dataset not loaded")
    return DATASET


def set_model_bundle(bundle: dict):
    global MODEL_BUNDLE
    MODEL_BUNDLE = bundle


def get_model_bundle() -> dict:
    if MODEL_BUNDLE is None:
        raise RuntimeError("Model not trained")
    return MODEL_BUNDLE
