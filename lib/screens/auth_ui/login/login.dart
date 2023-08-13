import 'package:flipkart_grid_5/constants/constants.dart';
import 'package:flipkart_grid_5/constants/routes.dart';
import 'package:flipkart_grid_5/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:flipkart_grid_5/screens/auth_ui/sign_up/sign_up.dart';
import 'package:flipkart_grid_5/screens/home/homeScreen.dart';
import 'package:flipkart_grid_5/widgets/primary_button.dart';
import 'package:flipkart_grid_5/widgets/top_tiltle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShowPassword = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(title: "Login", subTitle: "Welcome Back"),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: password,
                obscureText: !isShowPassword,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              PrimaryButton(
                title: "Login",
                onPressed: () async {
                  bool isValid = loginVaildation(email.text, password.text);
                  if (isValid) {
                    bool isLoggedIn = await FirebaseAuthHelper.instance
                        .login(email.text, password.text, context);
                    if (isLoggedIn) {
                      Routes.instance
                          .pushAndRemoveUntil(const HomeScreen(), context);
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text("Don't have an account?",
                    style: TextStyle(color: Colors.grey)),
              ),
              // const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () {
                    Routes.instance.push(const SignUp(), context);
                  },
                  child: Text(
                    "Create an account",
                    style: TextStyle(color: Theme.of(context).primaryColor),
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
