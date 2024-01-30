import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';

import '../signUp/signUpScreen.dart';

class Login extends StatefulWidget {
  Login({super.key, this.onChanged, this.initialValue = false});
  final ValueChanged<bool?>? onChanged;
  final bool initialValue;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Login to your\nAccount ",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            ),
          ),
          Spacer(),
          _TextFieldsEmail(),
          _TextFieldsPassword(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;
                    if (widget.onChanged != null) {
                      widget.onChanged!(_isChecked);
                    }
                  });
                }),
            Text('Remember me ')
          ]),
          SizedBox(
            height: 5,
          ),
          _signupButton(),
          _buitdforgotpass(),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1,
                width: Get.width / 5,
                color: Colors.black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'or continous with',
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 1,
                width: Get.width / 5,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Box(image: 'assets/images/facebook.png'),
              _Box(image: 'assets/images/google.png'),
              _Box(image: 'assets/images/apple.png'),
            ],
          ),
          Spacer(),
          _buildDontHaveAccount(context),
        ]),
      ),
    );
  }
}

Widget _TextFieldsEmail() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.grey,
        // controller:
        onSaved: (email) {},
        decoration: const InputDecoration(
          hintText: "Email",
          prefixIcon: Icon(Icons.email_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );

Widget _TextFieldsPassword() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        // controller: _controller.Lpassword,
        textInputAction: TextInputAction.done,
        obscureText: true,
        cursorColor: Colors.grey,
        decoration: const InputDecoration(
          hintText: "Password",
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(Icons.lock),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
Widget _signupButton() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(350, 65),
            backgroundColor: green,
          ),
          onPressed: () {
            // Get.to(());
          },
          child: Center(
            child: Text(
              'Sign in',
              style: TextStyle(color: white, fontSize: 17),
            ),
          ),
        ),
      ],
    );
Widget _Box({required String image}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black38,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Image.asset(
            image,
          ),
        ),
      ),
    );
Widget _buildDontHaveAccount(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? "),
        TextButton(
          onPressed: () {
            Get.to(SignupScreen());
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );

Widget _buitdforgotpass() => TextButton(
      onPressed: () {
        // Navigator.push(
        //   context,
        //   // MaterialPageRoute(builder: (context) => SignupScreen()),
        // );
      },
      child: Center(
        child: Text(
          "Forgot the password?",
          style: TextStyle(
            color: green,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
