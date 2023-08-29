import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth auth = FirebaseAuth.instance;
User? user = auth.currentUser;
FirebaseFirestore firestore = FirebaseFirestore.instance;

//collections
const userCollections = "users";
