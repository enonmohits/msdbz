import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:msdbz/pages/home.dart';
import 'package:msdbz/pages/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  String email = '';

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();

  registration() async {
    if (password != null&& namecontroller.text != "" && mailcontroller.text != "") {
      try {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/nbco.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Hello Sir",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 25.0),
                    child: TextFormField(
                        onChanged: (value) => email = value,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          }
                          return null;
                        })),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17.0, horizontal: 25.0),
                    child: TextFormField(
                      onChanged: (value) => username = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Username';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Username'),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 25.0),
                  child: TextFormField(
                    onChanged: (value) => password = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        email = mailcontroller.text;
                        username = namecontroller.text;
                        password = passwordcontroller.text;
                      });
                    }
                    registration();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 13.0, horizontal: 30.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 116, 40, 247),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  "or LogIn with",
                  style: TextStyle(
                      color: Color.fromARGB(255, 116, 40, 247),
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/google.png",
                      height: 45,
                      width: 45,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Image.asset(
                      "assets/images/apple1.png",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(
                            color: Color(0xFF8c8e98),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text(
                        "LogIn",
                        style: TextStyle(
                            color: Color(0xFF273671),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
