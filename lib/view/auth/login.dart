import 'package:flutter/material.dart';
import 'package:todoexample/model/firebaseSurvices.dart';
import 'package:todoexample/view/Todopage.dart';
import 'package:todoexample/view/auth/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
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
                  "Todo List",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.list_alt_outlined,
                  size: 50,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: username,
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
                    }
                    if (password.text.length < 6) {
                      return 'must been 6 charecters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {}, child: Text("Forgot Password")),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.green)),
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await Firebasesurvices()
                            .signinUser(context, username.text, password.text);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Todopage()));
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Did'nt singUp "),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Register()));
                        },
                        child: Text(
                          "Register now",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
