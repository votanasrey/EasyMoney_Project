import numpy as np
from flask import Flask, request, jsonify, render_template
import pickle
import pandas as pd
import os
import waitress


def get_port():
    if os.environ.get("PORT"):
        return int(os.environ.get("PORT"))
    else:
        return 8080


app = Flask(__name__)
model = pickle.load(open('model.pkl', 'rb'))


@app.route('/')
def home():
    return "<h1>API IS STARTING</h1>"


@app.route('/predict_api', methods=['POST', 'GET'])
def predict():
    '''
    For rendering results on HTML GUI
    '''
    json_ = request.json
    query_df = pd.DataFrame(json_)
    prediction = model.predict(query_df)

    return jsonify({"result": list(prediction)})


if __name__ == "__main__":
    waitress.serve(app=app, host='0.0.0.0', port=8080)
