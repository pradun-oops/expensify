import 'package:expensify/widget/round_btn.dart';
import 'package:expensify/widget/round_textfield.dart';
import 'package:expensify/screens/auth/signin.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/img/splash_bg.png")),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Image.asset("assets/img/budget.png", width: 250),
                const SizedBox(height: 30),
                RoundTextfield(hintText: "Full Name", controller: _fullname),
                const SizedBox(height: 20),
                RoundTextfield(hintText: "Email", controller: _email),
                const SizedBox(height: 20),
                RoundTextfield(
                  hintText: "Password",
                  controller: _password,
                  keyboardType: TextInputType.visiblePassword,
                  obsecured: true,
                ),
                const SizedBox(height: 20),
                RoundTextfield(
                  hintText: "Confirm password",
                  controller: _confirmpassword,
                  keyboardType: TextInputType.visiblePassword,
                  obsecured: true,
                ),
                SizedBox(height: 20),
                RoundBtn(title: "Create Account", onPressed: () {}),
                SizedBox(height: 20),
                _signinText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do You Have an Account?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignInPage(),
                ),
              );
            },
            child: const Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
