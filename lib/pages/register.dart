import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:bee/services/api_services.dart';
import 'package:bee/pages/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BEE ORDER',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'EduNSW',
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Color(0xFFFFF3E0),
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 350,
            height: 560,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.orange, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.15),
                  blurRadius: 20,
                  spreadRadius: 2,
                )
              ],
            ),
            child: FormBuilder(
              key: _formkey,
              child: Column(
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.orange.shade700,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // First Name
                  FormBuilderTextField(
                    name: 'firstName',
                    style: const TextStyle(color: Colors.black87),
                    decoration: _decoration('First Name', Icons.person),
                    validator: FormBuilderValidators.required(),
                  ),

                  const SizedBox(height: 16),

                  // Last Name
                  FormBuilderTextField(
                    name: 'lastName',
                    style: const TextStyle(color: Colors.black87),
                    decoration:
                    _decoration('Last Name', Icons.person_outline),
                    validator: FormBuilderValidators.required(),
                  ),

                  const SizedBox(height: 16),

                  // Email
                  FormBuilderTextField(
                    name: 'email',
                    style: const TextStyle(color: Colors.black87),
                    decoration: _decoration('Email', Icons.email),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),

                  const SizedBox(height: 16),

                  // Password
                  FormBuilderTextField(
                    name: 'password',
                    obscureText: true,
                    style: const TextStyle(color: Colors.black87),
                    decoration: _decoration('Password', Icons.lock),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.saveAndValidate()) {
                        final data = _formkey.currentState!.value;

                        bool ok = await ApiService.registerUser(
                          firstname: data['firstName'],
                          lastname: data['lastName'],
                          password: data['password'],
                          email: data['email'],
                        );

                        if (ok) {
                          print(data);
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                              const Duration(milliseconds: 500),
                              pageBuilder: (_, __, ___) => const Home(),
                              transitionsBuilder:
                                  (_, animation, __, child) {
                                final slide = Tween(
                                  begin: const Offset(-1, 0),
                                  end: Offset.zero,
                                ).animate(animation);

                                return SlideTransition(
                                  position: slide,
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          print('invalid register');
                        }
                      } else {
                        print('invalid');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 45),
                      backgroundColor: Colors.orange.shade600,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _decoration(String hint, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.orange.shade700),
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black45),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.orange),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide:
        const BorderSide(color: Colors.orange, width: 2),
      ),
    );
  }
}
