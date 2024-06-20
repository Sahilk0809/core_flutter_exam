import 'package:flutter/material.dart';

List studentList = [
  {
    'name': 'Sahil',
    'grid': '5673',
    'std': '12',
  },
];

class StudentModal {
  String? name;
  String? std;
  String? grid;

  List<StudentModal> studentModalList = [];

  StudentModal({this.name, this.std, this.grid});

  factory StudentModal.fromQuote(Map m1) {
    return StudentModal(std: m1['std'], name: m1['name'], grid: m1['grid']);
  }

  StudentModal.toList({required List l1}) {
    for (int i = 0; i < l1.length; i++) {
      studentModalList.add(
        StudentModal.fromQuote(l1[i]),
      );
    }
  }
}

