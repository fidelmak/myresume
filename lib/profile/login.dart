import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../widgets/big_button.dart';
import '../../../widgets/special_button.dart';
import '../../../widgets/KtextField.dart';
import '../homepage/home_page.dart';
import '/profile/sign_up.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const empty = null;
  TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6555f261cf69c37f0043')
        .setSelfSigned(status: true);

    final account = Account(client);

    try {
      await account.createEmailSession(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      //print(emailController);
      //print(passwordController); // Access token, user ID, etc.
      print("login success");
      // Navigate to the next screen or perform other actions on successful login
    } catch (e) {
      print('Login failed: $e');
      // Handle login failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                "Sign in",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const Text(
                " HI!! Welcome back you have been missed",
                style: TextStyle(fontSize: 15, color: Color(0xD89E9E9E)),
              ),
              const SizedBox(height: 30),
              KtextField(
                controller: emailController,
                littleLabel: 'Email',
                littleHint: 'Email@gmail.com',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              KtextField(
                controller: passwordController,
                obscureText: true,
                littleLabel: 'Password',
                littleHint: 'Input a strong password',
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      login();
                      print(emailController);
                    },
                    child: const Text(
                      "Forget password",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(width: 90),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (emailController.text == "") {
                    Future.delayed(Duration(seconds: 3), () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      });
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Error()));
                  } else {
                    // Email is not empty, proceed with login
                    login();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserDetails()));
                    print(emailController.text);
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              SizedBox(height: 20),
              const Text(
                " or Sign in with ",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIcon('assets/images/icon1.png'),
                  _buildIcon('assets/images/icon2.png'),
                  _buildIcon('assets/images/icon3.png'),
                ],
              ),
              SizedBox(height: 50),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account ? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'sign-up ',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Sign in');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String imagePath) {
    return InkWell(
      onTap: () {
        // Handle the click for the image
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("your email is required ",
            style: TextStyle(
                color: Colors.red, decorationColor: null, fontSize: 10)),
      ),
    );
  }
}
