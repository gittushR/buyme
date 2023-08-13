import 'package:flipkart_grid_5/constants/constants.dart';
import 'package:flipkart_grid_5/constants/routes.dart';
import 'package:flipkart_grid_5/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:flipkart_grid_5/screens/auth_ui/login/login.dart';
import 'package:flipkart_grid_5/screens/home/homeScreen.dart';
import 'package:flipkart_grid_5/widgets/primary_button.dart';
import 'package:flipkart_grid_5/widgets/top_tiltle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                  title: "Create Account", subTitle: "Welcome to Sign Up"),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
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
                title: "Create an account",
                onPressed: () async {
                  bool isValid =
                      signUpVaildation(email.text, password.text, name.text);
                  if (isValid) {
                    bool isLoggedIn = await FirebaseAuthHelper.instance
                        .signup(email.text, password.text, context);
                    if (isLoggedIn) {
                      // ignore: use_build_context_synchronously
                      Routes.instance
                          .pushAndRemoveUntil(const HomeScreen(), context);
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text("Already have an account?",
                    style: TextStyle(color: Colors.grey)),
              ),
              // const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "LOGIN",
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
