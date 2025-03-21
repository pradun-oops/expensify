import 'package:expensify/helper/app_route.dart';
import 'package:expensify/widget/round_btn.dart';
import 'package:expensify/widget/round_textfield.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/img/splash_bg.png")),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Image.asset("assets/img/budget.png", width: 250),
                SizedBox(height: 30),
                RoundTextfield(
                  hintText: "Enter Username or Email",
                  controller: _email,
                ),
                const SizedBox(height: 20),
                RoundTextfield(
                  hintText: "Password",
                  controller: _password,
                  keyboardType: TextInputType.visiblePassword,
                  obsecured: true,
                ),
                const SizedBox(height: 20),
                RoundBtn(
                  title: "Next",
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoute.HOME_SCREEN,
                    );
                  },
                ),
                SizedBox(height: 30),
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
            'Not A Member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoute.SIGN_UP_SCREEN);
            },
            child: const Text(
              'Register Now',
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
