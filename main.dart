import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(WellnessConnectApp());
}

class WellnessConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wellness Connect Kenya',
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale('en', ''),
        Locale('sw', ''),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
// login_screen.dart
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Wellness Connect Kenya", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 40),
            TextField(decoration: InputDecoration(labelText: "Email")),
            TextField(decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Login")),
            TextButton(onPressed: () {}, child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> register(String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return cred.user;
  }

  Future<User?> login(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return cred.user;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
google_maps_flutter: ^2.5.0
geolocator: ^9.0.0
import 'package:geolocator/geolocator.dart';

class Clinic {
  final String name;
  final double lat, lng;
  Clinic(this.name, this.lat, this.lng);
}

class MapService {
  Future<Position> getCurrentLocation() => Geolocator.getCurrentPosition();
  List<Clinic> getSampleClinics() => [
    Clinic('Nairobi Women's Hospital', -1.312, 36.821),
    Clinic('Coptic Hospital Nairobi', -1.280, 36.817),
    // add more...
  ];
}
cloud_firestore: ^4.0.0
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/health_tip.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Stream<List<HealthTip>> getHealthTips() => _db
      .collection('healthTips')
      .orderBy('timestamp', descending: true)
      .snapshots()
      .map((snap) => snap.docs.map((d) => HealthTip.fromDoc(d)).toList());
}
import 'package:cloud_firestore/cloud_firestore.dart';

class HealthTip {
  final String title, content;
  final Timestamp timestamp;
  HealthTip(this.title, this.content, this.timestamp);

  factory HealthTip.fromDoc(DocumentSnapshot d) {
    return HealthTip(d['title'], d['content'], d['timestamp']);
  }
}

