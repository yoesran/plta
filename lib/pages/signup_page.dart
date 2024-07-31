import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plta/pages/home_page.dart';
import 'package:plta/pages/login_page.dart';
import 'package:plta/widgets/password_field_widget.dart';
import 'package:plta/widgets/text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _form = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _name = '';
  String _errorMessage = '';
  bool _isloading = false;

  Future _onPressedSubmit(BuildContext context) async {
    setState(() {
      _errorMessage = '';
    });

    _form.currentState?.save();

    setState(() {
      _isloading = true;
    });

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          _errorMessage = 'The password provided is too weak.';
        });
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          _errorMessage = 'The account already exists for that email.';
        });
      } else {
        setState(() {
          _errorMessage = e.message!;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }

    setState(() {
      _isloading = false;
    });
  }

  void _onSavedEmail(String? value) {
    _email = value!;
  }

  void _onSavedPassword(String? value) {
    _password = value!;
  }

  void _onSavedName(String? value) {
    _name = value!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Lottie.asset("assets/lotties/windmill.json"),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        "Sign Up For Your Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                          },
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                              color: Color(0xFF4D81E7),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: _form,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFieldWidget(
                              keyboardType: TextInputType.emailAddress,
                              onSaved: _onSavedEmail,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              suffixIcon: Icons.person,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: PasswordFieldWidget(
                              onSaved: _onSavedPassword,
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFieldWidget(
                              keyboardType: TextInputType.name,
                              onSaved: _onSavedName,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              suffixIcon: Icons.account_box,
                            ),
                          ),
                          _errorMessage == ''
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    const SizedBox(height: 32),
                                    Text(
                                      _errorMessage,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                          const SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: ElevatedButton(
                              onPressed: _isloading
                                  ? null
                                  : () {
                                      _onPressedSubmit(context);
                                    },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: const Color(0xFF1D61E7),
                                disabledBackgroundColor: Colors.grey,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 14,
                                child: Center(
                                  child: _isloading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        )
                                      : const Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
