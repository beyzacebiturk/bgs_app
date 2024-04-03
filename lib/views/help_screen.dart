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
    QuestionAnswer(
        question: 'Bazı sorular-testler yüklü değil.',
        answer:
            'Her şeyden önce yaşanan gecikmelerden dolayı siz değerli öğrencilerimizden özür dileriz. Ülkemizde müfredatların çok sık değişmesi ile birlikte maalesef kitapların da değişmesi gerekmektedir. Bu değişim süreci, kitapların içeriğinin değişmesi ile birlikte çekilen videoların da tekrar çekilmesini gerektiriyor. Yaşanan gecikme değişen müfredatlara bağlı olarak birden fazla kitapta kendini gösterebilmektedir. Bütün bunlara ek olarak çok fazla eleştiri veya yanlış/eksik anlatım ya da olumsuz herhangi farklı bir durumdan dolayı bazı videolarımızı tekrar çekiyoruz. Bu nedenle videoların yüklenme süreleri gecikebiliyor.'),
    QuestionAnswer(
        question: 'Video önceden açılıyordu, şimdi açılmıyor.',
        answer:
            'Böyle durumlar çok sık olmasa da ortaya çıkabiliyor. Bunun nedeni ilgili videonun yeniden çekilmek üzere silinmiş olmasıdır. Videolar en kısa sürede yüklenmiş olacaktır. Bunun için uygulamanızı güncellemenize gerek yok, sadece bir süre sonra tekrar kontrol etmeniz yeterli olacaktır.'),
    QuestionAnswer(
        question: 'Soruyu doğru seçiyorum ama başka sorunun çözümü geliyor.',
        answer:
            'Lütfen önce kitabınızın iç kapağından basım yılını kontrol ediniz ve doğru yıla ait kitabın çözümlerine baktığınızdan emin olunuz. Aynı kitap olsa bile basım yılına bağlı olarak soruların yerleri değişebilmektedir. Kitabın doğru yıla ait olduğuna emin olduğunuz halde yanlış çözüm videosu yükleniyorsa lütfen bize mesaj kısmından bildiriniz. İlgili birimimiz gereken düzeltmeyi hızlı bir şekilde yapacaktır. Videoların güncellenmesi ya da yeni videoların yüklenmesi için uygulamanızı güncellemenize gerek yoktur. Sadece soruyu tekrar kontrol etmeniz yeterli olacaktır.'),
    QuestionAnswer(
        question: 'Kitabım listede yok.',
        answer:
            'Öncelikle kitabınızın basım yılını kapağının iç kısmından kontrol ederek doğru yılın kitaplarını listelediğinizden emin olunuz. Eğer hala listede kitabınızı göremiyorsanız henüz videolar sisteme yüklenmemiş olabilir. İlgili kitabın durumunu Birey Akademi Forum Sayfası üzerinden bize sorarak öğrenebilirsiniz.'),
    QuestionAnswer(
        question: 'Videoda ses var ancak görüntü açılmıyor.',
        answer:
            'Eğer çözüm videolarının görüntülerini duyamıyorsanız cihazınızın android versiyonu html5 videolarını desteklemiyor olabilir. Bu durum genelde düşük model cihazlarda görülür. Cihazınızın işlemcisinin düşük olması ya da bellek miktarının yeterli olmaması gibi birçok etken de bu duruma yol açabilir. Bu yüzden önce diğer uygulamaları kapatıp belleği boşaltarak çalıştırmayı deneyiniz. Sonuç alamazsanız Birey Akademi Forum Sayfası üzerinden bize yazınız. Birlikte bir çözüm yolu bulmaya çalışabiliriz.'),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BooksScreen()));
              },
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 36, 86, 127),
        title: const Text(
          "Sıkça Sorulan Sorular",
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
        backgroundColor: Colors.white24,
        collapsedBackgroundColor: const Color.fromARGB(45, 158, 158, 158),
        collapsedShape: Border.all(
            color: const Color.fromARGB(45, 158, 158, 158), width: 2),
        collapsedTextColor: Colors.black,
        onExpansionChanged: (bool expanded) {},
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          questionAnswer.question,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        children: [
          ListTile(
            title: Text(
              questionAnswer.answer,
              style: const TextStyle(fontSize: 13, letterSpacing: 0),
            ),
          ),
        ],
      ),
    );
  }
}
