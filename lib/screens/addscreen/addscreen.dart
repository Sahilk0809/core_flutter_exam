import 'dart:io';

import 'package:core_flutter_exam/screens/homescreen/homescreen.dart';
import 'package:core_flutter_exam/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'components/componets.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

var formKey = GlobalKey();
var txtName = TextEditingController();
var txtStd = TextEditingController();
var txtGrid = TextEditingController();

ImagePicker imagePicker = ImagePicker();
File? fileImage;

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    studentModal = StudentModal.toList(l1: studentList);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Add Page'),
          leading: const Icon(Icons.account_circle_outlined),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                      image: (fileImage != null)
                          ? DecorationImage(
                        fit: BoxFit.cover,
                              image: FileImage(fileImage!),
                            )
                          : null,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () async {
                          XFile? xFileImage = await imagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            fileImage = File(xFileImage!.path);
                          });
                        },
                        icon: const Icon(
                          Icons.image,
                          size: 35,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          XFile? xFileImage = await imagePicker.pickImage(
                              source: ImageSource.camera);
                          setState(() {
                            fileImage = File(xFileImage!.path);
                          });
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  inputTextField(controller: txtName, label: 'Name'),
                  const SizedBox(
                    height: 20,
                  ),
                  inputTextField(controller: txtStd, label: 'Standard'),
                  const SizedBox(
                    height: 20,
                  ),
                  inputTextField(controller: txtGrid, label: 'Grid'),
                  const SizedBox(
                    height: 185,
                  ),
                  GestureDetector(
                    onTap: () {
                      studentModal!.studentModalList.add(StudentModal(
                          name: txtName.toString(),
                          grid: txtGrid.toString(),
                          std: txtStd.toString()));
                      Navigator.of(context).pushNamed('/home');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue,
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
