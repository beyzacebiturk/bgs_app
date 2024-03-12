import 'package:bgs_app/views/fav_screen.dart';
import 'package:bgs_app/views/help_screen.dart';
import 'package:bgs_app/views/home.dart';
import 'package:bgs_app/views/login.dart';
import 'package:bgs_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:bgs_app/controllers/text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameSurnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  late String nSurname, email, password;

  int _currentIndex = 0;
  List<Widget> list = [
    const Home(),
    FavScreen(),
    HelpScreen(),
    const LoginPage(),
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
                          onSaved: (value) {},
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
                          onSaved: (value) {},
                        ),
                        const SizedBox(height: 10),
                        LoginTextFormField(
                          controller: phoneController,
                          hintText: 'Telefon',
                          obscureText: false,
                          validator: null,
                          onSaved: (value) {},
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
                          onSaved: (value) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                MyButtons.paintedButton(onPressed: () {}, buttonText: 'ÜYE OL'),
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
