import 'package:bgs_app/navbar/navbar.dart';
import 'package:bgs_app/views/books_screen.dart';
import 'package:bgs_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:bgs_app/controllers/text_field.dart';

class QuestionAnswer {
  final String question;
  final String answer;

  QuestionAnswer({
    required this.question,
    required this.answer,
  });
}

class HelpScreen extends StatelessWidget {
  HelpScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameSurnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final List<QuestionAnswer> questionAnswer = [
    QuestionAnswer(question: 'Soru', answer: 'ahsbhka'),
    QuestionAnswer(question: 'Soru', answer: 'ahsbhka'),
    QuestionAnswer(question: 'Soru', answer: 'ahsbhka'),
    QuestionAnswer(question: 'Soru', answer: 'ahsbhka'),
    QuestionAnswer(question: 'Soru', answer: 'ahsbhka'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Row(
          children: [
            BackButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BooksScreen()));
              },
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 36, 86, 127),
        title: const Text(
          "Uygulama hakkında genel bilgiler",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: questionAnswer.map((questionAnswer) {
                  return buildExpansionTile(questionAnswer);
                }).toList(),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'İstek ve Öneri Formu',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              MessageTextFormField(
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
                              const SizedBox(height: 30),
                              MessageTextFormField(
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
                              const SizedBox(height: 30),
                              MessageTextFormField(
                                controller: phoneController,
                                hintText: 'Telefon',
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Cep telefonu alanı boş bırakılamaz";
                                  }
                                  return null;
                                },
                                onSaved: (value) {},
                              ),
                              const SizedBox(height: 70),
                              MessageTextFormField(
                                controller: messageController,
                                hintText: 'İletmek İstedikleriniz',
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Mesaj alanı boş bırakılamaz";
                                  }
                                  return null;
                                },
                                onSaved: (value) {},
                              ),
                              const SizedBox(height: 50),
                              MyButtons.paintedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                    }
                                  },
                                  buttonText: 'GÖNDER'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }

  Widget buildExpansionTile(QuestionAnswer questionAnswer) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ExpansionTile(
        iconColor: Colors.black,
        backgroundColor: const Color.fromARGB(78, 217, 217, 217),
        collapsedBackgroundColor: const Color.fromARGB(45, 158, 158, 158),
        collapsedShape: Border.all(color: Colors.grey, width: 2),
        collapsedTextColor: Colors.black,
        onExpansionChanged: (bool expanded) {},
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          questionAnswer.question,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        children: [
          ListTile(
            title: Text(questionAnswer.answer),
          ),
        ],
      ),
    );
  }
}
