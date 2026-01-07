import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression


def run_regression_analysis(df: pd.DataFrame) -> dict:
    if len(df) < 2:
        raise ValueError("At least 2 rows are required for regression analysis")

    features = [
        "rainfall_mm",
        "temperature_c",
        "soil_index",
        "irrigation_pct",
        "fertilizer_kg_ha",
        "year",
    ]

    X = df[features]
    y = df["yield_kg_ha"]

    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)

    model = LinearRegression()
    model.fit(X_scaled, y)

    std_coeffs = pd.DataFrame({
        "Factor": features,
        "Standardized_Impact": model.coef_,
    })

    std_coeffs["Relative_Contribution (%)"] = (
        std_coeffs["Standardized_Impact"].abs()
        / std_coeffs["Standardized_Impact"].abs().sum()
        * 100
    )

    return {"std_coeffs": std_coeffs}
