import 'package:appwrite/appwrite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../widgets/big_button.dart';
import '../../../widgets/kTextField.dart';
import '../../../widgets/special_button.dart';
import '/homepage/home_page.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> createAccount() async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6555f261cf69c37f0043')
        .setSelfSigned(status: true);

    final account = Account(client);

    try {
      await account.create(
        userId: ID.unique(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      print("created");
    } catch (e) {
      if (e is AppwriteException &&
          e.code == 409 &&
          e.message == 'user_already_exists') {
        // User with the same email already exists
        // Handle accordingly, e.g., prompt the user to log in
      } else {
        // Handle other errors
        print('Error: $e');
      }
    }
  }

  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Create Account",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const Text(
            textAlign: TextAlign.center,
            "Fill your infomation below or register \n with your social account",
            style: TextStyle(
              fontSize: 15,
              color: Color(0xD89E9E9E),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          KtextField(
            controller: nameController,
            littleLabel: 'Name',
            littleHint: 'John Doe',
            obscureText: false,
          ),
          const SizedBox(
            height: 10,
          ),
          KtextField(
            controller: emailController,
            littleLabel: 'Email',
            littleHint: 'Email@gmail.com',
            obscureText: false,
          ),
          const SizedBox(
            height: 10,
          ),
          KtextField(
            controller: passwordController,
            obscureText: true,
            littleLabel: 'Password',
            littleHint: 'input a strong password',
          ),
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: 100,
            ),
            Icon(
              Icons.check_box_rounded,
              color: Colors.blue,
            ),
            SizedBox(
              width: 5,
            ),
            Text("Agree with"),
            TextButton(
                onPressed: () {},
                child: const Text("terms & condition",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ))),
          ]),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (emailController.text == "") {
                return print('Email is empty');
              } else {
                // Email is not empty, proceed with login
                SignUp();
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
          SizedBox(
            height: 20,
          ),
          Text(
            " or Sign up with ",
            style: TextStyle(
              fontSize: 11,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Handle the click for the first image
                  // You can navigate to a new screen or perform some action here
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/icon1.png'), // Replace with your image source
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                  // Handle the click for the second image
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/icon2.png'), // Replace with your image source
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                  // Handle the click for the third image
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/icon3.png'), // Replace with your image source
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Already have an account ? ",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'login ',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                      print('Sign in');
                      // Add your navigation logic here or perform any other action.
                    },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
