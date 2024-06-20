import 'package:core_flutter_exam/screens/homescreen/component/component.dart';
import 'package:core_flutter_exam/utils/global.dart';
import 'package:flutter/material.dart';
import '../addscreen/addscreen.dart';
import '../addscreen/components/componets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

StudentModal? studentModal;
var txtName2 = TextEditingController();
var txtName3 = TextEditingController();
var txtStd2 = TextEditingController();
var txtStd3 = TextEditingController();
var txtGrid3 = TextEditingController();
var txtGrid2 = TextEditingController();

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    studentModal = StudentModal.toList(l1: studentList);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Students Data'),
          leading: const Icon(Icons.account_circle_outlined),
        ),
        body: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, index) => ListTile(
            leading: Text(txtGrid.text),
            title: Text(txtName.text),
            subtitle: Text(txtStd.text),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Update Dialoge'),
                        actions: [
                          inputTextField(label: 'Name', controller: txtName),
                          const SizedBox(
                            height: 10,
                          ),
                          inputTextField(label: 'Standard', controller: txtStd),
                          const SizedBox(
                            height: 10,
                          ),
                          inputTextField(label: 'Grid', controller: txtGrid),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                txtName = txtName;
                                txtStd = txtStd;
                                txtGrid = txtGrid;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('Update'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(index>0){
                        studentList.removeAt(index);
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            state = {
              'name': txtName.text,
              'std': txtStd.text,
              'grid': txtGrid.text,
            };
            studentList.add(state);
            Navigator.of(context).pushNamed('/');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
