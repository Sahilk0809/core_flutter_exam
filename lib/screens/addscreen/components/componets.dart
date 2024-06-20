import 'package:flutter/material.dart';

TextFormField inputTextField({required controller, required label}) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.black,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Required';
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.grey),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.black),
      ),
    ),
  );
}
