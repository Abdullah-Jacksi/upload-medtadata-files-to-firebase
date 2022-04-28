import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:upload_medtadata_firebase/core/services/firebase_service.dart';
import 'package:upload_medtadata_firebase/core/view_models/home/home_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel(firebaseService: FirebaseService(firebaseFirestore: FirebaseFirestore.instance))),
];
