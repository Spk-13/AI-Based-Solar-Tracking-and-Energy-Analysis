@echo off
cd /d "%~dp0"
if not exist "ai\model.pkl" (
 echo The saved model is missing. Extract the complete project ZIP again.
 pause
 exit /b 1
)
echo Starting Project Stage 1 Batch 1 Major Project. Keep this window open.
echo Open http://127.0.0.1:5000 in Chrome or Edge.
py -3.12 run.py
pause
