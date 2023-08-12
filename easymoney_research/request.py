import requests

url = 'http://localhost:5000/predict_api'
r = requests.post(url, json={'installment': 200, 'term': 36, 'borrower_month_income': 500,
                  'borrower_length_experience': 5, 'home_ownership': 3, 'address_state': 1})

print(r.json())
