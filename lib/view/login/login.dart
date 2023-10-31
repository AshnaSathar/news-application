import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorconstant.dart';
import 'package:flutter_application_1/view/Home/home.dart';
// import 'package:phonenumbers/phonenumbers.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    RegExp regex = RegExp(r'^\+[1-9]\d{1,14}$');

    TextEditingController phonenumberController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: myColor,
        child: Center(
          child: Stack(
            children: [
              Container(
                height: 450,
                width: 250,
                color: myColor,
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                controller: phonenumberController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Phone Number",
                                  hintText: "Phone Number",
                                  labelStyle: TextStyle(color: Colors.white54),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white38)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Password",
                                    hintText: "Password",
                                    labelStyle:
                                        TextStyle(color: Colors.white54),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white38))),
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(myColor)),
                                onPressed: () {
                                  if (!regex
                                      .hasMatch(phonenumberController.text)) {
                                    print("invalid");
                                  } else {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                  }
                                },
                                child: Text("LOGIN"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
