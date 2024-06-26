import 'package:flutter/material.dart';
import 'package:training/utils/widget.dart';
import 'login.dart';
import '../model/datamodel.dart';
import '../utils/validator.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final model = LoginDataModel(email: '', password: '');
  final signUp = SignDataModel(confirmpass: '', first: '', last: '', phone: '');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              onChanged: () => setState(() => _formKey.currentState!.validate()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Image.asset('assets/images/facebook.png', width: 150, height: 100),
                  const SizedBox(height: 10),
                  CustomHeader(text: "Create Your Account"),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    controller: _firstController,
                    hintText: 'First Name',
                    validator: (value) => evalFirst(value),
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _lastController,
                    hintText: 'Last Name',
                    validator: (value) => evalLast(value),
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email Address',
                    validator: (value) => evalEmail(value),
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _phoneController,
                    hintText: 'Phone Number',
                    
                    validator: (value) => evalPhone(value),
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    validator: (value) => evalPassword(value),
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _confirmpassController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != model.password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  CustomButton(
                    text: "Sign Up",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      }
                    },
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
