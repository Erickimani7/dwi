🩺 Wellness Connect Kenya 🇰🇪
A mobile Flutter application designed to empower Kenyans with accessible health tips, clinic locations, and wellness programs. Built with Firebase, Google Maps, and multilingual support (English & Kiswahili).

📱 Features
🔐 User Registration & Login (via Firebase Auth)

📰 Dynamic Health Tips (Firestore-based)

🏥 Clinic Locator with Google Maps (Kenya-based sample data)

🧘‍♀️ Wellness Programs (to be expanded)

💬 Support chat (basic, optional)

🌍 Multilingual support (English & Swahili)

🚀 Getting Started
1. Clone the Repo
bash
Copy
Edit
git clone https://github.com/your-username/wellness_connect_kenya.git
cd wellness_connect_kenya
flutter pub get
2. Setup Firebase
Go to Firebase Console

Create a new project: Wellness Connect Kenya

Add Android & iOS apps

Enable:

Email/Password Authentication

Firestore Database

Download google-services.json and place it in android/app/

3. Add Google Maps API Key
Get a key from Google Cloud Console

Enable Maps SDK for Android/iOS

Add your key to:

xml
Copy
Edit
<!-- android/app/src/main/AndroidManifest.xml -->
<meta-data android:name="com.google.android.geo.API_KEY"
           android:value="YOUR_API_KEY_HERE"/>
📂 Project Structure
bash
Copy
Edit
lib/
├── main.dart
├── screens/
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── home_screen.dart
│   ├── clinic_locator.dart
│   └── health_tips_screen.dart
├── models/
│   ├── user_model.dart
│   └── health_tip.dart
├── services/
│   ├── auth_service.dart
│   ├── firestore_service.dart
│   └── map_service.dart
├── widgets/
│   └── custom_button.dart
📦 Dependencies
yaml
Copy
Edit
firebase_core: ^2.0.0
firebase_auth: ^4.0.0
cloud_firestore: ^4.0.0
google_maps_flutter: ^2.5.0
geolocator: ^9.0.0
provider: ^6.0.0
http: ^1.0.0
flutter_localizations:
  sdk: flutter
🌐 Localization (English & Kiswahili)
String translations are stored in assets/lang/en.json and sw.json

Use the flutter_localizations package and locale delegates

🧪 Firestore Sample Data
Health Tips Collection (healthTips):

json
Copy
Edit
{
  "title": "Stay Hydrated",
  "content": "Drink at least 8 glasses of water daily.",
  "timestamp": [Server Timestamp]
}
📸 Screenshots (optional)
Include device screenshots showing:

Login screen

Map with clinics

Health tips feed

👨‍💻 Maintainers
[Your Name] – Developer

Community contributions are welcome!

📄 License
MIT License © 2025 Wellness Connect Kenya
