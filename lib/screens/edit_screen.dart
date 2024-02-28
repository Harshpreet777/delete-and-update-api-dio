import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool? isNameValid = true;
  bool? isEmailValid = true;
  String gender = "male";
  String status = "active";
  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  String emailPattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(emailPattern);
                  if (value.toString().isEmpty) {
                    return "Cannot be Empty";
                  } else if (!regExp.hasMatch(value!)) {
                    return "@gmail.com is required";
                  }
                  return null;
                },
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Email Id',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  String namePattern = r'^[a-z A-Z,.\-]+$';
                  RegExp regExp = RegExp(namePattern);
                  if (value.toString().isEmpty) {
                    return "Cannot be Empty";
                  } else if (!regExp.hasMatch(value!)) {
                    return "Only Characters are allowed";
                  }
                  return null;
                },
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Enter Your Name'),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: RadioListTile(
                    title: const Text("Male"),
                    value: "male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ),
                Flexible(
                  child: RadioListTile(
                    title: const Text("Female"),
                    value: "female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: RadioListTile(
                      title: const Text('Active'),
                      value: "active",
                      groupValue: status,
                      onChanged: (value) {
                        setState(() {
                          status = value.toString();
                        });
                      }),
                ),
                Flexible(
                  child: RadioListTile(
                      title: const Text('Inactive'),
                      value: "inactive",
                      groupValue: status,
                      onChanged: (value) {
                        setState(() {
                          status = value.toString();
                        });
                      }),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
