import 'package:flutter/material.dart';
import 'package:spends/screens/signup_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formkey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  static bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      ///EMAIL
                      TextFormField(
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(_focusNode),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.com')) {
                            return "Please enter a valid Email adress";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          label: Text('Email'),
                        ),
                      ),

                      /// PASSWORD
                      StatefulBuilder(
                        builder: (context, setState) => TextFormField(
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          focusNode: _focusNode,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a valid password';
                            }
                            if (value.length <= 7) {
                              return 'Enter more than 7 characters';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => ForgetPassword()));
                      // ignore: avoid_print
                      print('Forget password?');
                    },
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.055,
                ),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: size.height * 0.07,
                    width: double.infinity,
                    color: Colors.deepOrangeAccent,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          const Icon(
                            Icons.login,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
