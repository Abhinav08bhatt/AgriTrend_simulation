from src.data_generation import generate_synthetic_data
from src.data_loader import save_synthetic_data, load_synthetic_data
from src.analysis import run_regression_analysis
from src.visualization import plot_yield_trend, plot_standardized_trends
from src.model import train_yield_model, predict_baseline_future
from src.scenarios import run_best_case_1pct_scenario
from src.visualization import plot_baseline_vs_scenario
from src.report_builder import build_pdf_report


def main():
    df = generate_synthetic_data()
    save_synthetic_data(df)

    df = load_synthetic_data()

    analysis_results = run_regression_analysis(df)

    plot_yield_trend(df)
    
    plot_standardized_trends(df)
    
    model_bundle = train_yield_model(df)
    
    baseline_future = predict_baseline_future(df, model_bundle)
    
    best_case = run_best_case_1pct_scenario(baseline_future, model_bundle)

    plot_baseline_vs_scenario(
        historical_df=df,
        baseline_future=baseline_future,
        scenario_future=best_case
    )


    print(analysis_results["raw_coeffs"])

    print(analysis_results["std_coeffs"])

    print(baseline_future.head())


    print(best_case[["year", "baseline_yield_kg_ha", "scenario_yield_kg_ha"]])

    build_pdf_report()
    # print(f"Report generated at: {report_path}")


if __name__ == "__main__":
    main()
