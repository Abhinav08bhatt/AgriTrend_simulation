import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression


def train_yield_model(df: pd.DataFrame) -> dict:
    """
    Trains a standardized linear regression model for crop yield.
    Mirrors the notebook logic exactly.
    """

    X = df[
        [
            "rainfall_mm",
            "temperature_c",
            "soil_index",
            "irrigation_pct",
            "fertilizer_kg_ha",
            "year",
        ]
    ]
    y = df["yield_kg_ha"]

    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)

    model = LinearRegression()
    model.fit(X_scaled, y)

    return {
        "model": model,
        "scaler": scaler,
        "features": X.columns.tolist(),
    }
