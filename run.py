from pathlib import Path
if not (Path(__file__).parent/'ai/model.pkl').exists():
    from ai.train_model import train
    train()
from backend.app import create_app
if __name__=='__main__':
    print('Open http://127.0.0.1:5000; Blender: run blender/solar_control.py')
    create_app().run(host='127.0.0.1',port=5000,threaded=True)
