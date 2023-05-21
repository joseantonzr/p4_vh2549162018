import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore baseD = FirebaseFirestore.instance;
Future<List> getClientes() async {
  List clientes = [];
  CollectionReference collectionReferenceclientes =
      baseD.collection('MD_Clientes');
  QuerySnapshot queryclientes = await collectionReferenceclientes.get();

  for (var documento in queryclientes.docs) {
    clientes.add(documento.data());
  }
  return clientes;
}
