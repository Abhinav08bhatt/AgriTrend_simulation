from src.data_generation import generate_synthetic_data
from src.data_loader import save_synthetic_data, load_synthetic_data
from src.analysis import run_regression_analysis
from src.model import train_yield_model, predict_baseline_future
from src.scenarios import (run_best_case_1pct_scenario,run_drought_stress_scenario,run_fertilizer_optimization_scenario,run_climate_shift_scenario,)
from src.report_builder import build_pdf_report
from src.visualization import plot_yield_trend,plot_standardized_trends,plot_factor_contributions,plot_baseline_vs_scenario,plot_factor_timeseries

def main():

# 1 Generate and store synthetic historical data
    print('''
Enter the data you want to analyse : 

    1) Universal Synthetic Data
    2) Rice Synthetic Data
    3) Wheat Synthetic Data
    4) Maize Synthetic Data

    ''')
    data_choice = input("Enter option number: ").strip()

    if data_choice == "1":
        df = generate_synthetic_data()
        dataset_name = "Universal Synthetic Data"

    elif data_choice == "2":
        from src.crop_data_generation import generate_rice_synthetic
        df = generate_rice_synthetic()
        dataset_name = "Rice Synthetic Data"

    elif data_choice == "3":
        from src.crop_data_generation import generate_wheat_synthetic
        df = generate_wheat_synthetic()
        dataset_name = "Wheat Synthetic Data"

    elif data_choice == "4":
        from src.crop_data_generation import generate_maize_synthetic
        df = generate_maize_synthetic()
        dataset_name = "Maize Synthetic Data"

    elif data_choice == "5":
        print("Upload feature not implemented yet.")
        print("Defaulting to Universal Synthetic Data.")
        df = generate_synthetic_data()
        dataset_name = "Universal Synthetic Data"

    else:
        print("Invalid choice. Defaulting to Universal Synthetic Data.")
        df = generate_synthetic_data()
        dataset_name = "Universal Synthetic Data"

    save_synthetic_data(df)


# 2 Load data (simulates real-world data pipeline)
    df = load_synthetic_data()

# 3 Analyze historical yield drivers
    analysis_results = run_regression_analysis(df)

# 4 Visualize historical trends
    plot_yield_trend(df)
    plot_standardized_trends(df)
    plot_factor_timeseries(df)
    plot_factor_contributions(analysis_results["std_coeffs"])

# 5 Train yield prediction model
    model_bundle = train_yield_model(df)

# 6 Predict baseline future (no intervention)
    baseline_future = predict_baseline_future(df, model_bundle)
    
    
# 7 Run scenarios
    print("""
Choose Scenario:
          
    1) Best-case 1% Improvement
    2) Drought Stress Scenario
    3) Fertilizer Optimization Scenario
    4) Climate Shift Scenario

    """)
    choice = input("Enter option number: ").strip()

    if choice == "1":
        scenario_future = run_best_case_1pct_scenario(baseline_future, model_bundle)
        scenario_name = "Best Case 1% Improvement"
    elif choice == "2":
        scenario_future = run_drought_stress_scenario(baseline_future, model_bundle)
        scenario_name = "Drought Stress"
    elif choice == "3":
        scenario_future = run_fertilizer_optimization_scenario(baseline_future, model_bundle)
        scenario_name = "Fertilizer Optimization"
    elif choice == "4":
        scenario_future = run_climate_shift_scenario(baseline_future, model_bundle)
        scenario_name = "Climate Shift"
    else:
        print("Invalid choice, defaulting to Best Case.")
        scenario_future = run_best_case_1pct_scenario(baseline_future, model_bundle)
        scenario_name = "Best Case 1% Improvement"

# 8 Compare baseline vs intervention
    # plot_baseline_vs_scenario(historical_df=df,baseline_future=baseline_future,scenario_future=scenario_future,scenario_name=scenario_name)
    scenario_plot_path = plot_baseline_vs_scenario(historical_df=df,baseline_future=baseline_future,scenario_future=scenario_future,scenario_name=scenario_name)


# 9 Build final PDF report
    build_pdf_report(dataset_name=dataset_name,scenario_name=scenario_name,scenario_plot_path=scenario_plot_path)
    print("Report Created Successfully \nLocation: outputs/reports/")

if __name__ == "__main__":
    main()
