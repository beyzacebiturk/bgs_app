import 'package:bgs_app/views/fav_screen.dart';
import 'package:bgs_app/views/help_screen.dart';
import 'package:bgs_app/views/home.dart';
import 'package:bgs_app/views/login.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  late TextEditingController _emailController, _passwordController;
  late String nSurname, email, password;
  SignUpScreen({super.key});

  int _currentIndex = 0;
  List<Widget> list = const [
    Home(),
    FavScreen(),
    HelpScreen(),
    LoginPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login.png'),
                    fit: BoxFit.cover),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Üye Ol',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Gelişiminizi takip etmek için ücretsiz üye olabilirsiniz.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 97, 97, 97),
                      fontSize: 15,
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
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Lütfen ad soyad giriniz";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            nSurname = value!;
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
                            hintText: 'Ad Soyad',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Lütfen E-Posta giriniz";
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
                            hintText: 'E-Posta',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          validator: null,
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
                            hintText: 'Telefon',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Lütfen şifre giriniz";
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                MaterialButton(
                  minWidth: double.tryParse('350'),
                  height: 55,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
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
                    "ÜYE OL",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Column(
                  children: [
                    MaterialButton(
                      minWidth: double.tryParse('350'),
                      height: 55,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
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
                        "ÜYE GİRİŞİ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          letterSpacing: 2,
                          color: Color.fromARGB(255, 36, 86, 127),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: const Color.fromARGB(255, 36, 86, 127),
          type: BottomNavigationBarType.fixed,
          iconSize: 27,
         /* onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },*/
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Kitaplar'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoriler'),
            BottomNavigationBarItem(
                icon: Icon(Icons.question_mark), label: 'Yardım'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Üyelik'),
          ],
        ),
      ),
    );
  }
}
