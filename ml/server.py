from flask import Flask, request, jsonify
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import pickle
import pandas as pd
from sklearn.preprocessing import StandardScaler, LabelEncoder

# Load the ML model
with open('xgboost_model.pkl', 'rb') as file:
    loaded_model = pickle.load(file)

# Initialize Flask app
app = Flask(__name__)

# Initialize Firestore
cred = credentials.Certificate('firebase_credentials.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

# Define the columns used during training
columns = ['age', 'sex', 'bmi', 'children', 'region_northeast', 'region_northwest', 'region_southeast', 'region_southwest', 'smoker']

# API endpoint for processing the data
@app.route('/predict_insurance_cost', methods=['POST'])
def predict_insurance_cost():
    # Get the request data
    data = request.get_json()

    print(data)

    # Extract the fields from the request data
    age = data['age']
    sex = data['sex']
    bmi = data['bmi']
    children = data['children']
    smoker = data['smoker']
    region = data['region']

    # Create a DataFrame with the new data
    new_data = pd.DataFrame({
        'age': [age],
        'sex': [sex],
        'bmi': [bmi],
        'children': [children],
        'smoker': [smoker],
        'region_northeast': [0],
        'region_northwest': [0],
        'region_southeast': [0],
        'region_southwest': [0]
    })

    # Set the corresponding region value to 1
    if region == 'northwest':
        new_data['region_northwest'] = 1
    elif region == 'northeast':
        new_data['region_northeast'] = 1
    elif region == 'southeast':
        new_data['region_southeast'] = 1
    elif region == 'southwest':
        new_data['region_southwest'] = 1

    print(new_data)

    # Apply the same preprocessing steps to the new data as done during training
    scaler = StandardScaler()
    new_data[['age', 'bmi', 'children']] = scaler.fit_transform(new_data[['age', 'bmi', 'children']])

    # Encode the 'sex' column
    le = LabelEncoder()
    le.fit(['male', 'female'])

    # Make sure the 'sex' value is within the expected values
    sex_value = str(sex).lower()
    if sex_value not in ['male', 'female']:
        # Handle missing or unexpected values
        sex_value = 'male'  # Set a default value or any desired handling

    new_data['sex'] = le.transform([sex_value])[0]

    # Make sure the new data columns match the training columns
    missing_cols = set(columns) - set(new_data.columns)
    for col in missing_cols:
        new_data[col] = 0

    # Make the prediction using the loaded model
    predicted_charge = loaded_model.predict(new_data.values)

    predicted_charge = float(predicted_charge)
    print(predicted_charge)

    # Save the results to Firestore
    doc_ref = db.collection('insurance_results').document()
    doc_ref.set({
        'age': age,
        'sex': sex,
        'bmi': bmi,
        'children': children,
        'region': region,
        'smoker': smoker,
        'estimated_insurance_charge': predicted_charge
    })

    return jsonify({'Estimated Insurance Charge': predicted_charge}), 200


# Run the app
if __name__ == '__main__':
    app.run()
