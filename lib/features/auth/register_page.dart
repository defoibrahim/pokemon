import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../providers/auth_provider.dart';
import 'login_page.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(top: 48),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Center(
                        child: Image.asset(
                          'assets/images/pokemon-logo.png',
                          height: 150,
                          width: 200,
                        ),
                      ),
                      const Spacer(flex: 1),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          controller: _email,
                          autocorrect: true,
                          enableSuggestions: true,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            hintStyle: const TextStyle(color: Colors.black54),
                            icon: Icon(Icons.email_outlined,
                                color: Colors.blue.shade700, size: 24),
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Invalid email!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          controller: _password,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return 'Password is too short!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.black54),
                            icon: Icon(Icons.lock_outline,
                                color: Colors.blue.shade700, size: 24),
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm password',
                            hintStyle: const TextStyle(color: Colors.black54),
                            icon: Icon(Icons.lock_outline,
                                color: Colors.blue.shade700, size: 24),
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value != _password.text) {
                              return 'Passwords do not match!';
                            }
                            return null;
                          },
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 40.0),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          width: double.infinity,
                          child: _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : MaterialButton(
                                  onPressed: () {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    ref
                                        .read(authenticationProvider)
                                        .signUpWithEmailAndPassword(
                                          _email.text,
                                          _password.text,
                                          context,
                                        );
                                  },
                                  textColor: Colors.blue.shade700,
                                  textTheme: ButtonTextTheme.primary,
                                  minWidth: 100,
                                  padding: const EdgeInsets.all(18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side:
                                        BorderSide(color: Colors.blue.shade700),
                                  ),
                                  child: const Text(
                                    'SignUp',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Log in',
                                  style: TextStyle(color: Colors.blue.shade700),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.off(() => LoginPage());
                                    },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
