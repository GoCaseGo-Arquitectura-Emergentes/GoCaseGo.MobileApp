import 'package:flutter/material.dart';
import 'package:go_case_go/sensor.dart';
import 'package:go_case_go/utils/page_animation.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String? _errorMessage;
  // late final LocalAuthentication _localAuthentication;

  @override
  void initState() {
    super.initState();
    // _localAuthentication = LocalAuthentication();

    // _localAuthentication.isDeviceSupported().then((isSupported) {
    //   if (isSupported) {
    //     isFirstTime().then((value) {
    //       if (!value) {
    //         authenticateBiometric();
    //       }
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    PageAnimation pageAnimation = PageAnimation();
    return Scaffold(
      backgroundColor: const Color(0xFF161D2F),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Image.network(
                  'https://raw.githubusercontent.com/GoCaseGo-Arquitectura-Emergentes/upc-pre-202401-si728-sw82-GoCaseGo-report/develop/Resources/styles/Equipa_Tour_Logo.jpg'),
              const SizedBox(height: 50),
              Form(
                key: _formKey,
                onChanged: () {},
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        hintText: 'Usuario',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su nombre de usuario';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const Dialog(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircularProgressIndicator(),
                                        SizedBox(width: 16.0),
                                        Text("Iniciando sesión..."),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                            Navigator.pop(context);

                            Navigator.push(context,
                                pageAnimation.createPageRoute(SensorScreen()));
                          }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ingresar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
