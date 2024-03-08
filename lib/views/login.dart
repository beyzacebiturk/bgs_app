import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bgs_app/models/Users.dart';
import 'package:flutter/widgets.dart';
import 'package:bgs_app/views/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController, _passwordController;
  late String email, password;
  final formKey = GlobalKey<FormState>();
  Users user = Users();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      print('Email: $email, Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight / 4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Üyelik',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'E-posta ve şifrenizle giriş yapabilirsiniz',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Lütfen e-posta giriniz";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value!;
                          },
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 227, 79, 128),
                                  width: 3),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 227, 79, 128),
                                width: 2,
                              ),
                            ),
                            hintText: 'E-posta',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          obscureText: false,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Lütfen şifre giriniz.";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            password = value!;
                          },
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 227, 79, 128),
                                  width: 3),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 227, 79, 128),
                                width: 2,
                              ),
                            ),
                            hintText: 'Şifre',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          obscureText: true,
                        ),
                        const Text('şifremi unuttum')
                        //ŞİFRE SIFIRLAMA
                      ],
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              minWidth: double.tryParse('350'),
              height: 55,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  print("E-Posta: $email");
                  print("Şifre: $password");
                } 
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              color: const Color.fromARGB(255, 36, 86, 127),
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(255, 36, 86, 127),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "GİRİŞ YAP",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 80),
            MaterialButton(
              minWidth: double.tryParse('350'),
              height: 55,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  SignUpScreen()));
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(255, 36, 86, 127),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "KAYIT OL",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  letterSpacing: 2,
                  color: Color.fromARGB(255, 36, 86, 127),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
