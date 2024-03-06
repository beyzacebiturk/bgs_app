import 'package:bgs_app/views/home.dart';
import 'package:flutter/material.dart';

class Item {
  Item({
    required this.headerText,
    required this.expandedText,
    this.isExpanded = false,
  });
  String headerText;
  String expandedText;
  bool isExpanded;
}

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          /*leading: Row(
          children: [
            BackButton(
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),*/ //ROW KULLANIMI
          leading: BackButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            color: Colors.white,
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
                ExpansionTile(
                  iconColor: Colors.black,
                  expandedAlignment: Alignment.centerLeft,
                  backgroundColor: const Color.fromARGB(78, 217, 217, 217),
                  collapsedBackgroundColor:
                      const Color.fromARGB(45, 158, 158, 158),
                  collapsedShape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 2)),
                  onExpansionChanged: (bool expanded) {},
                  controlAffinity: ListTileControlAffinity
                      .leading, //okun solda olmasını sağlar(leading)
                  title: const Text(
                    'Soru',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  children: const <Widget>[
                    ListTile(
                      title: Text('asjlalsaldald'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ExpansionTile(
                  iconColor: Colors.black,
                  backgroundColor: const Color.fromARGB(78, 217, 217, 217),
                  collapsedBackgroundColor:
                      const Color.fromARGB(45, 158, 158, 158),
                  collapsedShape: Border.all(color: Colors.grey, width: 2),
                  collapsedTextColor: Colors.black,
                  onExpansionChanged: (bool expanded) {},
                  controlAffinity: ListTileControlAffinity
                      .leading, //okun solda olmasını sağlar(leading)
                  title: const Text(
                    'Soru',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  children: const <Widget>[
                    ListTile(
                      title: Text('asjlalsaldald'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ExpansionTile(
                  iconColor: Colors.black,
                  backgroundColor: const Color.fromARGB(78, 217, 217, 217),
                  collapsedBackgroundColor:
                      const Color.fromARGB(45, 158, 158, 158),
                  collapsedShape: Border.all(color: Colors.grey, width: 2),
                  collapsedTextColor: Colors.black,
                  onExpansionChanged: (bool expanded) {},
                  controlAffinity: ListTileControlAffinity
                      .leading, //okun solda olmasını sağlar(leading)
                  title: const Text(
                    'Soru',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  children: const <Widget>[
                    ListTile(
                      title: Text('asjlalsaldald'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ExpansionTile(
                  iconColor: Colors.black,
                  backgroundColor: const Color.fromARGB(78, 217, 217, 217),
                  collapsedBackgroundColor:
                      const Color.fromARGB(45, 158, 158, 158),
                  collapsedShape: Border.all(color: Colors.grey, width: 2),
                  collapsedTextColor: Colors.black,
                  onExpansionChanged: (bool expanded) {},
                  controlAffinity: ListTileControlAffinity
                      .leading, //okun solda olmasını sağlar(leading)
                  title: const Text(
                    'Soru',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  children: const <Widget>[
                    ListTile(
                      title: Text('asjlalsaldald'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ExpansionTile(
                  iconColor: Colors.black,
                  backgroundColor: const Color.fromARGB(78, 217, 217, 217),
                  collapsedBackgroundColor:
                      const Color.fromARGB(45, 158, 158, 158),
                  collapsedShape: Border.all(color: Colors.grey, width: 2),
                  collapsedTextColor: Colors.black,
                  onExpansionChanged: (bool expanded) {},
                  controlAffinity: ListTileControlAffinity
                      .leading, //okun solda olmasını sağlar(leading)
                  title: const Text(
                    'Soru',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  children: const <Widget>[
                    ListTile(
                      title: Text('asjlalsaldald'),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
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
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Ad soyad alanı boş bırakılamaz";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //email = value!;
                                  },
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 36, 86, 127),
                                          width: 3),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 36, 86, 127),
                                        width: 2,
                                      ),
                                    ),
                                    hintText: 'Ad Soyad',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  obscureText: false,
                                ),
                                const SizedBox(height: 30),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "E-Posta alanı boş bırakılamaz";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //email = value!;
                                  },
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 36, 86, 127),
                                          width: 3),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 36, 86, 127),
                                        width: 2,
                                      ),
                                    ),
                                    hintText: 'E-Posta',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                  obscureText: false,
                                ),
                                const SizedBox(height: 30),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Cep telefonu alanı boş bırakılamaz";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //email = value!;
                                  },
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 36, 86, 127),
                                          width: 3),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 36, 86, 127),
                                        width: 2,
                                      ),
                                    ),
                                    hintText: 'Telefon',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                  obscureText: false,
                                ),
                                const SizedBox(height: 70),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Mesaj alanı boş bırakılamaz";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //email = value!;
                                  },
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 36, 86, 127),
                                          width: 3),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 36, 86, 127),
                                        width: 2,
                                      ),
                                    ),
                                    hintText: 'İletmek İstedikleriniz',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                  obscureText: true,
                                ),
                                const SizedBox(height: 50),
                                MaterialButton(
                                  minWidth: double.tryParse('350'),
                                  height: 55,
                                  onPressed: () {},
                                  elevation: 0,
                                  color: const Color.fromARGB(255, 36, 86, 127),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Color.fromARGB(255, 36, 86, 127),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    "GÖNDER",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      letterSpacing: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
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
        ));
  }
}