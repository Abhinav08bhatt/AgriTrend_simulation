from reportlab.platypus import SimpleDocTemplate,Paragraph,Spacer,Image,PageBreak
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.pagesizes import A4
from reportlab.lib.enums import TA_CENTER
from pathlib import Path
from reportlab.platypus import Table, TableStyle
from reportlab.lib import colors


def build_pdf_report(dataset_name: str,scenario_name: str,scenario_plot_path: Path):
    """
    Builds the final PDF report for AgriTrend Simulation.
    """

    """
    Builds the final PDF report for AgriTrend Simulation.
    """

    # --------------------------------------------------
    # Paths
    # --------------------------------------------------
    safe_dataset = dataset_name.replace(" ", "_").lower()
    safe_scenario = scenario_name.replace(" ", "_").lower()

    output_pdf = Path(f"outputs/reports/{safe_dataset}__{safe_scenario}.pdf")


    graph_yield = Path("outputs/graphs/yield_trend.png")
    graph_standardized = Path("outputs/graphs/standardized_trends.png")

    output_pdf.parent.mkdir(parents=True, exist_ok=True)

    # --------------------------------------------------
    # Document setup
    # --------------------------------------------------
    doc = SimpleDocTemplate(
        str(output_pdf),
        pagesize=A4,
        rightMargin=40,
        leftMargin=40,
        topMargin=40,
        bottomMargin=40,
    )

    styles = getSampleStyleSheet()
    story = []

# --------------------------------------------------
# PAGE 1 START
# --------------------------------------------------

    title_style = ParagraphStyle(
        name="TitleStyle",
        parent=styles["Title"],
        alignment=TA_CENTER,
        fontSize=20,
        spaceAfter=18,
    )

    subtitle_style = ParagraphStyle(
        name="SubtitleStyle",
        parent=styles["Normal"],
        alignment=TA_CENTER,
        fontSize=12,
        textColor="grey",
        spaceAfter=20,
    )

    story.append(Paragraph("AgriTrend_simulation", title_style))
    story.append(
        Paragraph(
            f"<b>Dataset:</b> {dataset_name}<br/><b>Scenario:</b> {scenario_name}",
            subtitle_style,
        )
    )

    story.append(
        Paragraph(
            "<i>Note: Results illustrate trend behavior under assumed conditions, not guaranteed outcomes.</i>",
            subtitle_style,
        )
    )

    story.append(
        Paragraph(
            "A research-oriented simulation framework to study crop yield trends using synthetic environmental data",
            subtitle_style,
        )
    )

    story.append(Spacer(1, 10))
    
    abstract_text = '''
    <para align="center">
    <b>Abstract</b>
    <br/><br/>

    <i>
    Agriculture today is under growing pressure from climate change,
    soil degradation, and rising food demand.
    </i>
    <br/><br/>

    In many regions, crop yields are no longer improving in a stable way.
    Adding more fertilizer or irrigation does not always lead to better results,
    and in some cases yields slowly decline over time.
    <br/><br/>

    <b>
    This raises a critical question:
    </b>
    <br/>
    <i>
    Are current farming practices reaching their limits under long-term environmental stress?
    </i>
    <br/><br/>

    <b>AgriTrend_simulation</b> is designed to explore this problem through a
    research-oriented and transparent simulation framework.
    Instead of predicting exact future yields, the system focuses on
    understanding long-term trends and how different factors interact.
    <br/><br/>

    The simulation uses synthetic but realistic data to model rainfall,
    temperature, soil health, irrigation, fertilizer use, pest pressure,
    and their combined effect on crop yield.
    A baseline future is projected assuming no major changes, and this is
    compared against scenarios with small, coordinated improvements.
    <br/><br/>

    The results point to a difficult reality :
    <b>Long-term system stress dominates agricultural outcomes.</b>
    <br/><br/>
    However, the analysis also highlights an important consideration.
    <i>
    Long-term outcomes are sensitive to how multiple factors evolve together.
    </i>

    Small, sustained changes when applied consistently across several factors
    can meaningfully alter long-term trends in some scenarios, while in others
    they help clarify the limits of intervention under continued stress.
    <br/><br/>

    <b>
    The future is challenging, but it remains shaped by long-term choices.
    </b>
    </para>
    '''
    abstract_style = ParagraphStyle(
        name="AbstractStyle",
        parent=styles["Normal"],
        alignment=TA_CENTER,
        fontSize=13,          
        leading=18,           
        spaceAfter=20,
    )
    
    story.append(Paragraph(abstract_text, abstract_style))


# --------------------------------------------------
# PAGE 1 END
# --------------------------------------------------

    story.append(PageBreak())

# --------------------------------------------------
# PAGE 2 START
# --------------------------------------------------

    story.append(Paragraph("System Overview", styles["Heading1"]))
    story.append(Spacer(1, 14))

    overview_text = '''
    <b>What is this system trying to do?</b>
    <br/><br/>

    AgriTrend_simulation is built to understand one core idea:
    <br/>
    <i>
    If farming continues the way it is today, how might crop yield trends evolve over the next 10 years?
    </i>
    <br/><br/>

    Instead of focusing on short-term predictions, the system looks at
    <b>long-term trends</b> and looks which factors matter most over time.
    <br/><br/>

    <hr/>

    <b>How the system works :</b>
    <br/><br/>

    <b>1. Synthetic data generation</b>
    <br/>
    The system first creates realistic agricultural data.
    This includes rainfall, temperature, soil quality, irrigation,
    fertilizer use, pest pressure, and crop yield.
    <br/><br/>
        The data is not random noise. Each factor follows:
        <br/>
        • realistic value ranges<br/>
        • slow long-term trends<br/>
        • natural year-to-year variation
    <br/><br/>

    <b>2. Historical trend analysis</b>
    <br/>
    Once the data is created, the system analyzes how each factor
    changes over time and how it relates to yield.
    <br/><br/>
    This helps answer questions like:
    <br/>
    • Is yield improving or declining?<br/>
    • Are inputs increasing faster than output?<br/>
    • Do some factors move together?
    <br/><br/>

    <b>3. Yield response modeling</b>
    <br/>
    A linear regression model is trained using historical data.
    The goal is understanding
    <i>how strongly each factor affects yield</i>.
    <br/><br/>
    Both raw and standardized models are used so that:
    <br/>
    • real-world impact can be measured<br/>
    • relative importance of factors can be compared
    <br/><br/>

    <b>4. Baseline future projection</b>
    <br/>
    Using the trained model, the system projects a future where
    current trends continue with no major intervention.
    <br/><br/>
    This baseline future acts as a reference point and answers:
    <br/>
    <i>What happens if nothing changes?</i>
    <br/><br/>

    <b>5. Controlled improvement scenarios</b>
    <br/>
    Finally, the system applies small, sustained improvements
    to multiple factors at the same time.
    <br/><br/>
    These scenarios explore how coordinated action,
    even at small annual change rates (such as 1%),
    can influence long-term trends under different conditions.
    <br/><br/>

    <hr/>

    <b>Why this structure matters</b>
    <br/><br/>

    This step-by-step structure keeps the system simple, transparent, and easy to understand.
    Each module does one clear task, which makes it easy to replace synthetic data with
    real-world datasets in the future without changing the overall design.
    <br/><br/>

    Because of this structure, the system helps reveal which factors are associated
    with long-term yield behavior, how different pressures interact over time,
    and why sustained changes may have compounding effects across years.
    '''

    story.append(Paragraph(overview_text, styles["Normal"]))

# --------------------------------------------------
# PAGE 2 END
# --------------------------------------------------

    story.append(PageBreak())

# --------------------------------------------------
# PAGE 3 START
# --------------------------------------------------

    story.append(Paragraph("Synthetic Data Characteristics", styles["Heading1"]))
    story.append(Spacer(1, 10))

    intro_text = '''
    The system uses synthetically generated data designed to mimic plausible
    agricultural behavior, with all variables staying within practical limits and
    changing gradually over time to reflect typical environmental and management constraints.
    '''

    story.append(Paragraph(intro_text, styles["Normal"]))

    story.append(Paragraph("<b>Key Assumptions Used in Synthetic Data</b>", styles["Heading3"]))
    story.append(Spacer(1, 3))

    assumption_table = Table(
        [
            ["Factor", "Typical Assumption / Range"],
            ["Rainfall", "~800 mm/year with variability"],
            ["Temperature", "~25 °C average"],
            ["Soil Quality Index", "0.5 - 0.85"],
            ["Irrigation Coverage", "30% /- 70%"],
            ["Fertilizer Usage", "50 - 200 kg/ha"],
            ["Pest Pressure", "0.0 - 1.0 (index)"],
        ],
        colWidths=[200, 300],
    )

    assumption_table.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), colors.lightgrey),
        ("GRID", (0, 0), (-1, -1), 0.5, colors.grey),
        ("FONT", (0, 0), (-1, 0), "Helvetica-Bold"),
        ("ALIGN", (0, 0), (-1, 0), "CENTER"),
        ("LEFTPADDING", (0, 0), (-1, -1), 6),
        ("RIGHTPADDING", (0, 0), (-1, -1), 6),
        ("TOPPADDING", (0, 0), (-1, -1), 6),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
    ]))

    story.append(assumption_table)
    story.append(Spacer(1, 12))

    factor_images = [
        "factor_rainfall_mm.png",
        "factor_temperature_c.png",
        "factor_soil_index.png",
        "factor_irrigation_pct.png",
        "factor_fertilizer_kg_ha.png",
        "factor_pest_pressure_index.png",
    ]

    image_cells = []
    row = []

    for i, img_name in enumerate(factor_images):
        img_path = Path("outputs/graphs") / img_name

        if img_path.exists():
            img = Image(str(img_path), width=240, height=140)
        else:
            img = Paragraph("Missing Image", styles["Normal"])

        row.append(img)

        if len(row) == 2:
            image_cells.append(row)
            row = []

    image_grid = Table(
        image_cells,
        colWidths=[260, 260]
    )

    image_grid.setStyle(TableStyle([
        ("ALIGN", (0, 0), (-1, -1), "CENTER"),
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 10),
    ]))

    story.append(image_grid)

# --------------------------------------------------
# PAGE 3 START
# --------------------------------------------------

    story.append(PageBreak())

# --------------------------------------------------
# PAGE 4 START
# --------------------------------------------------

    story.append(Paragraph("Historical Reality", styles["Heading1"]))
    
    story.append(Spacer(1, 12))
    
    story.append(
        Paragraph(
            "<i>Note: Observations below reflect trend behavior in the selected dataset and are not universal outcomes.</i>",
            styles["Normal"]
        )
    )
    story.append(Spacer(1, 8))


    synthetic_text = '''
    The graph below shows how crop yield changes over time when all agricultural
    factors interact together. 
    
    <br/><br/>
    Yield here is not driven by a single variable, but
    by the combined effect of rainfall, temperature, soil health, irrigation,
    fertilizer use, and pest pressure.
    <br/><br/>

    This graph should be read as a system-level signal rather than a year-by-year
    scorecard. Individual years may perform well or poorly, but the long-term
    pattern is what matters most.
    <br/><br/>

    <b>
    Key observations from the yield trend:
    </b>
    <br/>
    • yield does not increase smoothly over time<br/>
    • variability may increase as years progress<br/>
    • performance becomes less predictable across years<br/>
    • periods of lower yield appear intermittently
    <br/><br/>

    Even as management inputs such as irrigation and fertilizer increase over
    time, yield does not necessarily follow the same upward trajectory. This
    suggests that rising inputs may be increasingly used to offset environmental
    pressure rather than to generate sustained growth.
    <br/><br/>

    Another important signal is instability.
    <br/><br/>

    In several cases, yield shows sharper year-to-year fluctuations as long-term
    stress accumulates. Such instability can be as impactful as gradual decline,
    as it increases uncertainty and risk within agricultural systems.
    <br/><br/>

    This historical yield trend sets the foundation for the rest of the analysis.
    It highlights why simply continuing current practices may not be enough,
    and why future scenarios must be compared against this baseline behavior.
    '''

    story.append(Paragraph(synthetic_text, styles["Normal"]))
    story.append(Spacer(1, 30))

    if graph_yield.exists():
        story.append(Paragraph("<b>Historical Yield Trend</b>", styles["Heading3"]))
        story.append(Spacer(1, 20))
        img = Image(str(graph_yield), width=450, height=220)
        story.append(img)

# --------------------------------------------------
# PAGE 4 END
# --------------------------------------------------

    story.append(PageBreak())

# --------------------------------------------------
# PAGE 5 START
# --------------------------------------------------

    story.append(Paragraph("Relative Trends Across Factors", styles["Heading1"]))
    story.append(Spacer(1, 12))

    trend_text = '''
    Agricultural factors operate on different scales, so they are standardized
    to allow fair comparison over time.
    <br/><br/>

    This graph shows how each factor changes relative to its own historical
    baseline.
    While inputs such as irrigation and fertilizer tend to increase over time,
    crop yield does not always follow the same upward pattern.
    <br/><br/>

    In some cases, a widening gap between inputs and output may indicate
    reduced system efficiency, where additional input is increasingly used
    to compensate for environmental or structural pressures rather than to
    generate proportional yield gains.
    '''

    story.append(Paragraph(trend_text, styles["Normal"]))
    story.append(Spacer(1, 20))

    if graph_standardized.exists():
        img = Image(str(graph_standardized), width=450, height=220)
        story.append(img)

    story.append(Spacer(1, 25))
    story.append(Paragraph(
        "Which Factors Matter Most?",
        styles["Heading3"]
    ))
    story.append(Spacer(1, 10))

    factor_text = '''
    Trend lines show movement over time, but they do not reveal impact.
    <br/><br/>

    This chart shows the relative importance of each factor in driving yield.
    Larger bars indicate stronger influence, regardless of direction.
    '''

    story.append(Paragraph(factor_text, styles["Normal"]))
    story.append(Spacer(1, 15))

    story.append(
        Paragraph(
            "<i>Note: Factor importance reflects model sensitivity within the synthetic dataset, not universal causal strength.</i>",
            styles["Normal"]
        )
    )
    story.append(Spacer(1, 8))

    factor_graph = Path("outputs/graphs/factor_contributions.png")

    if factor_graph.exists():
        img = Image(str(factor_graph), width=450, height=220)
        story.append(img)

# --------------------------------------------------
# PAGE 5 END
# --------------------------------------------------

    story.append(PageBreak())

# --------------------------------------------------
# PAGE 5 START
# --------------------------------------------------

    story.append(Paragraph("Baseline Future: If Nothing Changes", styles["Heading1"]))
    story.append(Spacer(1, 10))


    baseline_text = '''
    The baseline future shows what happens if current trends continue without
    any major changes.
    <br/><br/>

    This scenario assumes:
    <br/>
    • no new technologies<br/>
    • no coordinated improvement efforts
    <br/><br/>

    Under these assumptions:
    <br/>
    • rainfall follows long-term climate drift<br/>
    • temperature continues to rise slowly<br/>
    • soil quality degrades gradually<br/>
    <br/><br/>

    As a result:
    <br/>
    • crop yield may exhibit increased variability over time<br/>
    • periods of lower yield can occur more frequently in some cases<br/>
    • long-term yield trends may stabilize, decline, or fluctuate depending on conditions
    <br/><br/>
    '''

    story.append(Paragraph(baseline_text, styles["Normal"]))

    story.append(Spacer(1, 6))

    story.append(
        Paragraph(
            "<i>Note: Scenario outcomes depend on the selected dataset and intervention assumptions.</i>",
            styles["Normal"]
        )
    )
    story.append(Spacer(1, 10))

    story.append(
        Paragraph(
            f"Scenario Analysis: {scenario_name}",
            styles["Heading1"]
        )
    )
    story.append(Spacer(1, 10))

    scenario_text = '''
    This section compares the selected scenario against the baseline future.

    <br/><br/>

    Rather than assuming guaranteed improvement or decline, the comparison
    highlights how small, sustained changes to multiple factors can compound
    over time under different conditions.

    <br/><br/>

    When interpreting the scenario relative to the baseline, attention should be
    paid to:
    <br/>
    • whether the scenario trajectory diverges above or below the baseline<br/>
    • how yield variability changes over time<br/>
    • whether long-term trends stabilize, accelerate, or weaken<br/>
    • how sensitive outcomes are to sustained annual changes

    <br/><br/>

    The purpose of this comparison is not to claim optimal outcomes, but to
    illustrate the directional impact and limits of intervention under
    the selected assumptions.
    '''

    story.append(Paragraph(scenario_text, styles["Normal"]))
    story.append(Spacer(1, 20))

    scenario_graph = Path(scenario_plot_path)

    if scenario_graph.exists():
        img = Image(str(scenario_graph), width=450, height=220)
        story.append(img)

# --------------------------------------------------
# PAGE 5 END
# --------------------------------------------------

    story.append(PageBreak())

# --------------------------------------------------
# PAGE 6 START
# --------------------------------------------------

    story.append(Paragraph("Conclusions and Limitations", styles["Heading1"]))
    story.append(Spacer(1, 12))

    conclusion_text = '''
    This simulation provides an illustrative view of how agricultural systems may
    behave under long-term stress. It does not focus on individual good or bad
    years, but instead highlights broader structural patterns that can emerge
    over time under sustained pressure.
    <br/><br/>

    <b>Main conclusions</b>
    <br/>
    • long-term environmental stress can play a significant role in yield outcomes<br/>
    • yield behavior is influenced by multiple interacting factors rather than a single cause<br/>
    • small pressures can compound over time and affect system efficiency<br/>
    • increasing inputs alone does not necessarily guarantee stable productivity<br/>
    • yield instability can be as impactful as gradual decline<br/>
    • higher variability is often associated with increased risk
    <br/><br/>

    <b>Key insights from the analysis</b>
    <br/>
    • irrigation and fertilizer inputs tend to increase over time in many cases<br/>
    • yield does not always increase at the same rate as inputs<br/>
    • additional inputs may increasingly be used to offset environmental stress<br/>
    • good years can still occur but may become less predictable<br/>
    • periods of lower yield can appear intermittently depending on conditions
    <br/><br/>

    <b>What this system is designed to do</b>
    <br/>
    • study long-term trends rather than short-term noise<br/>
    • compare baseline futures with intervention scenarios<br/>
    • identify which factors matter most for yield behavior<br/>
    • remain transparent and easy to interpret
    <br/><br/>

    <b>Limitations of the approach</b>
    <br/>
    • the model is linear by design<br/>
    • non-linear feedback effects are not included<br/>
    • regional crop differences are not modeled<br/>
    • results are based on synthetic data<br/>
    • values represent trends not exact predictions
    <br/><br/>

    <b>Future directions</b>
    <br/>
    • integrate real agricultural datasets<br/>
    • expand scenario design and testing<br/>
    • include additional stress factors where possible<br/>
    • build interactive tools for exploration and education
    '''

    story.append(Paragraph(conclusion_text, styles["Normal"]))

    story.append(Spacer(1, 85))

    reference_text = """
    <b>References and Project Resources</b>
    <br/><br/>

    For readers who want a deeper understanding of how the system works,
    the complete project code and explanations are publicly available.
    <br/><br/>

    <b>Interactive notebook (recommended)</b>
    <br/>
    A well-documented Jupyter notebook that explains the full pipeline,
    step by step, with code, outputs, and reasoning.
    <br/>
    <a href="https://github.com/Abhinav08bhatt/AgriTrend_simulation/blob/main/notebooks/documentation_code.ipynb">
    https://github.com/Abhinav08bhatt/AgriTrend_simulation/blob/main/notebooks/documentation_code.ipynb
    </a>
    <br/><br/>

    <b>Project repository</b>
    <br/>
    Complete source code, modular structure, graphs, and report generation scripts.
    <br/>
    <a href="https://github.com/Abhinav08bhatt/AgriTrend_simulation/tree/main">
    https://github.com/Abhinav08bhatt/AgriTrend_simulation/tree/main
    </a>
    <br/><br/>

    These resources are intended for transparency, reproducibility,
    and further exploration of the ideas presented in this report.
    """

    story.append(Paragraph(reference_text, styles["Normal"]))


# --------------------------------------------------
# PAGE 6 END
# --------------------------------------------------

    doc.build(story)
