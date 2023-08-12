# Loan Price Prediction

This is the loan price prediction model was deployed on Flask. it's used to predict the loan price based on customer background and behaviors.
Our ML model will require customer informations, such as:
 - Installment (Amount to pay per month)
 - Term (Number of months)
 - Number of Experiences 
 - Property (RENT, OWN, MORGAGE, OTHERS)
 - Monthly income
 - Address area (URBAN, RURAL)

Features above we have studied the correlations and base on business concept also.

### Install

This project requires **Python** and the following Python libraries installed:

- [NumPy](http://www.numpy.org/)
- [Pandas](http://pandas.pydata.org/)
- [matplotlib](http://matplotlib.org/)
- [scikit-learn](http://scikit-learn.org/stable/)
- [seaborn](https://seaborn.pydata.org/)

You will also need to have software installed to run and execute a [Jupyter Notebook](http://jupyter.org/install.html) and [Flask](https://flask.palletsprojects.com/en/2.0.x/).

If you do not have Python installed yet, it is highly recommended that you install the [Anaconda](https://www.anaconda.com/download/) distribution of Python, which already has the above packages and more included. 

### Code

Template code is provided in the `LAP_Linear_Regression.ipynb` notebook file and other one is pickle that we exported as our ML model . You will also be required to use the included `loan_prediction_dataset.csv` dataset file to complete your work. While some code has already been implemented to get you started, you will need to implement additional functionality when requested to successfully complete the project. after you have done you need `python main.py` to run the our project.
