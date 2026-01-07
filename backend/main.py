from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from api.data_routes import router as data_router
from api.analysis_routes import router as analysis_router
from api.prediction_routes import router as prediction_router

app = FastAPI(
    title="AgriTrend Backend",
    description="Python backend for agricultural trend analysis",
    version="1.0.0",
)

# Allow Flutter (localhost / emulator / device)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Register API routes
app.include_router(data_router, prefix="/data", tags=["Data"])
app.include_router(analysis_router, prefix="/analysis", tags=["Analysis"])
app.include_router(prediction_router, prefix="/predict", tags=["Prediction"])


@app.get("/")
def health_check():
    return {"status": "AgriTrend backend running"}
