import 'package:connected_android/pages/login.dart';
import 'package:connected_android/services/firebase_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/validator.dart';
import 'home_page.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final password2Controller = TextEditingController();
    final _focusEmail = FocusNode();
    final _focusPassword = FocusNode();
    final _focusPassword2 = FocusNode();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(child: SvgPicture.asset(
            'images/logo/logoWithText.svg',
            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onBackground, BlendMode.srcIn),
            width: 200,
            height: 200,
            )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Crea una cuenta', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 8,),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) => Validator.validateEmail(email: value),
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Theme.of(context).colorScheme.onSurfaceVariant,
                                decoration: InputDecoration(
                                  border:
                                    const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                  label: const Text('Correo electronico'),
                                  prefixIcon: SizedBox(
                                    width: 18,
                                    child: Icon(Icons.email_rounded, color:Theme.of(context).colorScheme.primary),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8,),
                              TextFormField(
                                validator: (value) => Validator.validatePassword(password: value),
                                focusNode: _focusPassword,
                                controller: passwordController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                cursorColor: Theme.of(context).colorScheme.onSurfaceVariant,
                                decoration: InputDecoration(
                                  border:
                                    const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                  label: const Text('Contraseña'),
                                  prefixIcon: SizedBox(
                                    width: 18,
                                    child: Icon(Icons.lock_rounded, color: Theme.of(context).colorScheme.primary,),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8,),
                              TextFormField(
                                validator: (value) => Validator.validateRegisterPassword(password: passwordController.text, confirmPassword: value),
                                controller: password2Controller,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                cursorColor: Theme.of(context).colorScheme.onSurfaceVariant,
                                decoration: InputDecoration(
                                  border:
                                    const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                  label: const Text('Confirmar contraseña'),
                                  prefixIcon: SizedBox(
                                    width: 18,
                                    child: Icon(Icons.lock_rounded, color: Theme.of(context).colorScheme.primary,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8,),
                        FilledButton(
                          onPressed: () async {
                            _focusEmail.unfocus();
                            _focusPassword.unfocus();

                            if (_formKey.currentState!.validate()) {
                              User? user = await registerUsingEmailPassword(
                                email: emailController.text, password: passwordController.text
                              );
                              if (user != null) {
                                Navigator.of(context)
                                    .pushReplacement(
                                  MaterialPageRoute(builder: (context) => HomePage(user: user)),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Error al registrarse, puede que ya haya una cuenta con este correo"),
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50)
                          ),
                          child: const Text('Registrarse')
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿Ya tienes cuenta?'),
                    TextButton(onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text('Inicia sesión'))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}