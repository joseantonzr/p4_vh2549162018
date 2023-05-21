import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:p4_vh2549162018/services/firebase.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const VihiculosApp());
}

class VihiculosApp extends StatelessWidget {
  const VihiculosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRU Vehiculo',
      home: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: getClientes(),
          builder: ((context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data?[index]['sNombreCliente']);
              },
            );
          }),
        ),
      ),
    );
  }
}
