import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:msdbz/utils/routes.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final usernameValidator =
  RequiredValidator(errorText: 'Username is required');
  final passwordValidator =
  RequiredValidator(errorText: 'Password is required');
  String username = '';
  String password = '';

  Future<void> navigateToHome() async {
    if (_formKey.currentState!.validate()) {
      // Simulate login logic (replace with actual authentication
      if (username == 'user' && password == 'password') {
        await Navigator.pushNamed(context, MyRoutes.HomeRoutes);
      } else {
        await Navigator.pushNamed(context, MyRoutes.HomeRoutes);
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
                  "assets/images/signnn.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Wellcome Back",
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
                        vertical: 17.0, horizontal: 25.0),
                    child: TextFormField(
                      onChanged: (value) => username = value,
                      validator: usernameValidator.call,
                      decoration: const InputDecoration(labelText: 'Username'),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 25.0),
                  child: TextFormField(
                    onChanged: (value) => password = value,
                    validator: passwordValidator.call,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ForgotPasswordPage');
                    },
                    child: const Text("Forgate Password!")),
                const SizedBox(
                  height: 32.0,
                ),
                Material(
                  child: InkWell(
                    onTap: () => navigateToHome,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                          minimumSize: const Size(150, 40)),
                      onPressed: navigateToHome,
                      child: const Text('Login'),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/SignUp');
                    },
                    child: const Text("New to Hear? Sign up")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
