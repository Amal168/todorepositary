import 'package:flutter/material.dart';
import 'package:todoexample/model/firebaseSurvices.dart';
import 'package:todoexample/view/Todopage.dart';
import 'package:todoexample/view/auth/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController Username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conferm = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register Here",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: Username,
                  validator: (value) {
                    if (password.text.isEmpty) {
                      return "Enter Username";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: password,
                  validator: (value) {
                    if (password.text.isEmpty) {
                      return "Enter password";
                    }if (password.text.length < 6) {
                      return 'must been 6 charecters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: conferm,
                  validator: (value) {
                    if (conferm.text.isEmpty) {
                      return "Enter Conferm  Password";
                    }if (password.text.length < 6) {
                      return 'must been 6 charecters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Conferm your Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.green)),
                    onPressed: ()  {
                      if (formkey.currentState!.validate()) {
                      if (conferm.text == password.text) {
                        Firebasesurvices().createUser(
                            context, Username.text, password.text);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => Login()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("password doesnot match")));
                      }
                    }
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
