import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:pokemony/features/auth/register_page.dart';

import '../../providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false;
  LoginPage({super.key});

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
                      const Center(child: FlutterLogo(size: 81)),
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
                          padding: const EdgeInsets.only(top: 32.0),
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
                                        .signInWithEmailAndPassword(
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
                                    'Log in',
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
                              text: 'Don\'t have an account? ',
                              // : 'Already have an account? ',
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Sign up now',
                                  // : 'Log in',
                                  style: TextStyle(color: Colors.blue.shade700),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.off(() => RegisterPage());
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
