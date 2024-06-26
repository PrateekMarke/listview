import 'package:flutter/material.dart';
import 'package:training/pages/homepage.dart';
import 'package:training/utils/widget.dart';
import 'signup.dart';
import '../model/datamodel.dart';
import '../utils/validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final model = LoginDataModel(email: '', password: '');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset('assets/images/facebook.png',
                  width: 150, height: 100),
              const SizedBox(height: 10),
              SizedBox(
                height: 405.0,
                child: Container(
                  width: 350.0,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    onChanged: () =>
                        setState(() => _formKey.currentState!.validate()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CustomHeader(text: "Log In to Your Account"),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email Address',
                          validator: (value) => evalEmail(value),
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          obscureText: true,
                          validator: (value) => evalPassword(value),
                        ),
                        const SizedBox(height: 20.0),
                        CustomButton(
                          text: "Log In",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Home()),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 1, 115, 207),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()),
                                  );
                                },
                                child: const Text(
                                  'Create New Account',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 1, 115, 207),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
