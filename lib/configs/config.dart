import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../controller/auth_controller.dart';

const String apiKey = "6f8c440aaab04e3e8f063644aeab519b";
const String api = "https://api.themoviedb.org/3/movie/550?api_key=";
const String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZjhjNDQwYWFhYjA0ZTNlOGYwNjM2NDRhZWFiNTE5YiIsInN1YiI6IjYyODVmNDdlMDg1OWI0MTQ5ZDI4MDhiZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.19wvjJd7WtSjYkyNtBD9RBqG4NloS8SHyK2jqcws35U";

AuthController authController = AuthController.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
GoogleSignIn googleSign = GoogleSignIn();