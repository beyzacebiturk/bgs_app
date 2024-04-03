import 'package:bgs_app/navbar/navbar.dart';
import 'package:bgs_app/views/login.dart';
import 'package:bgs_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:bgs_app/controllers/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameSurnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  late String nSurname, email, phone, password;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            SizedBox(
              width: deviceWidth,
              height: deviceHeight / 4,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/backgraound.png',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/eiscepte.png',
                          width: 100,
                          height: 100,
                        ),
                        const Text(
                          'Üye Ol',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Gelişiminizi takip etmek için ücretsiz üye olabilirsiniz',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    //autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        LoginTextFormField(
                          controller: nameSurnameController,
                          hintText: 'Ad Soyad',
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Ad soyad alanı boş bırakılamaz";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            nSurname = value!;
                          },
                        ),
                        const SizedBox(height: 10),
                        LoginTextFormField(
                          controller: emailController,
                          hintText: 'E-Posta',
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "E-Posta alanı boş bırakılamaz";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value!;
                          },
                        ),
                        const SizedBox(height: 10),
                        LoginTextFormField(
                          controller: phoneController,
                          hintText: 'Telefon',
                          obscureText: false,
                          validator: null,
                          onSaved: (value) {
                            phone = value!;
                          },
                        ),
                        const SizedBox(height: 10),
                        LoginTextFormField(
                          controller: passwordController,
                          hintText: 'Şifre',
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Şifre alanı boş bırakılamaz";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            password = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                MyButtons.paintedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    },
                    buttonText: 'ÜYE OL'),
                const SizedBox(height: 70),
                MyButtons.transparentButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    buttonText: 'ÜYE GİRİŞİ'),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: Navbar(),
      ),
    );
  }
}
