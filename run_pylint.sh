#!/bin/bash
python3 -m venv ~/./usr/bin/python3
source ~/./home/krishna/.local/bin/pylint
pip install --upgrade pip &&\
  pip install -r requirements.txt

pylint app.py