import numpy as np
from flask import Flask, request, jsonify
import pickle
import pandas as pd

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
