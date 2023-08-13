import 'package:flipkart_grid_5/constants/asset_images.dart';
import 'package:flipkart_grid_5/constants/routes.dart';
import 'package:flipkart_grid_5/screens/auth_ui/login/login.dart';
import 'package:flipkart_grid_5/screens/auth_ui/sign_up/sign_up.dart';
import 'package:flipkart_grid_5/widgets/primary_button.dart';
import 'package:flipkart_grid_5/widgets/top_tiltle.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(
                title: "Welcome",
                subTitle: "Get your personalized recommendations "),
            Center(
              child: Image.asset(
                AssetsImages.instance.welcomeImage,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Image.asset(
                    AssetsImages.instance.googleLogo,
                    height: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              title: "Login",
              onPressed: () {
                Routes.instance.push(const Login(), context);
              },
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              title: "Sign Up",
              onPressed: () {
                Routes.instance.push(const SignUp(), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
