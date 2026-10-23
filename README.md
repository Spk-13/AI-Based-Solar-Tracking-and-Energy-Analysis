# Project Stage 1 Batch 1 Major Project

**AI-Based Solar Tracking and Energy Analysis**

This is a local Flask application that simulates one dual-axis solar tracker, predicts panel power with a trained Random Forest, selects azimuth and tilt angles, and displays the result in an interactive browser 3D dashboard. All weather, electrical and energy readings are simulated. No real sensors or motors are connected.

## Install on another Windows PC

1. Install **Python 3.12.x, 64-bit**. In the installer, select **Add Python to PATH**. Confirm in Command Prompt with `py -3.12 --version`.
2. Extract `Project_Stage_1_Batch_1_Major_Project.zip` to a normal folder, for example `C:\\SolarProject`. Do not run it from inside the ZIP.
3. Open Command Prompt in the extracted project folder (the folder containing `run.py` and `requirements.txt`).
4. Install the pinned Python packages once: `py -3.12 -m pip install -r requirements.txt`.
5. Start the app: `py -3.12 run.py`. Keep this Command Prompt window open.
6. Open `http://127.0.0.1:5000` in Chrome or Edge, then press Ctrl+F5 if an old page is cached.

For a later run, double-click `START_DASHBOARD.bat`, or repeat step 5. See `INSTALL_ON_NEW_PC.txt` for troubleshooting.

## What must be installed

- Python 3.12.x, 64-bit, with pip.
- Chrome or Microsoft Edge with WebGL/graphics acceleration enabled for the 3D view.
- Internet access during the one-time Python package installation.

Flask, NumPy, scikit-learn and joblib install from `requirements.txt`. The saved trained AI model and Three.js graphics files are included in this ZIP. Node.js, Blender, Git and a separate Three.js download are not needed to run the browser dashboard.

## AI and assumptions

The saved 90-tree Random Forest is reused. The optimizer scores 78 broad orientations, refines around the best region in 5-degree steps, adds an exact Sun-facing candidate, and selects the highest mean predicted watts. Exact ties prefer less angular movement. It re-evaluates every five simulated minutes. The reference simulator checks the choice but does not determine its ranking.

Forecasts assume current cloud cover and temperature persist. The tracker is a simulation: do not interpret simulated energy gains as measured real-world results. The 3D panel is one tracker with two axes: azimuth and tilt.

## Reproducibility

```bat
py -3.12 -m unittest discover -s tests -v
py -3.12 -m tests.live_api_v2
py -3.12 -m results.run_comparison
```

The browser uses locally bundled Three.js; the 3D renderer still depends on the computer's browser/GPU supporting WebGL. Test evidence is in `results/`. See `docs/upgrade_v2.md` for algorithm details.
