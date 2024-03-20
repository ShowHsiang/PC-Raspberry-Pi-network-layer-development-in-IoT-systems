import firebase_admin
from firebase_admin import credentials, firestore

event_data = {
    "Device ID": "1",
    "Event ID": "1234567890123", 
    "Action": "xxxxxxxxx",
}

cred = credentials.Certificate('/path/to/your/firebase-private-key.json')
firebase_admin.initialize_app(cred)

db = firestore.client()

document_id = f"{event_data['Device ID']}_{event_data['Event ID']}"
event_ref = db.collection('events').document(document_id)
event_ref.set(event_data)  # Update data if document_id exists, create new document if not
