import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formkey = GlobalKey<FormState>();
  final FocusNode _focusNodeConfPass = FocusNode();
  final FocusNode _focusNodeLastName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodepass = FocusNode();
  static bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'SignUp',
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
                    ///First name
                    TextFormField(
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_focusNodeLastName),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid First name";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text('First name'),
                      ),
                    ),

                    ///Last name
                    TextFormField(
                      focusNode: _focusNodeLastName,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_focusNodeEmail),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid Last name";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text('Last name'),
                      ),
                    ),
                    TextFormField(
                      focusNode: _focusNodeEmail,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_focusNodepass),
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
                      builder: (BuildContext context, setState) {
                        return TextFormField(
                          focusNode: _focusNodepass,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_focusNodeConfPass),
                          textInputAction: TextInputAction.next,
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
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                }),
                          ),
                        );
                      },
                    ),

                    ///Re enter password
                    StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return TextFormField(
                          textInputAction: TextInputAction.done,
                          focusNode: _focusNodeConfPass,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a valid Confirm Password';
                            }
                            if (value.length <= 7) {
                              return 'Enter more than 7 characters';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            label: const Text('Re enter password'),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                }),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.05,
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
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              const Icon(
                                Icons.person_add_alt,
                                color: Colors.white,
                                size: 29,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
