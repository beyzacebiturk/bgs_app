import 'package:flutter/material.dart';
import 'package:bgs_app/providers/navbar_provider.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final mp = Provider.of<NavbarProvider>(context, listen: true);

    return Scaffold(
      body: mp.items[mp.selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 36, 86, 127),
        type: BottomNavigationBarType.fixed,
        iconSize: 27,
        currentIndex: mp.selectedIndex,
        onTap: (i){
          mp.selectedIndex = i;
        },
        items: mp.items
            .map((e) => BottomNavigationBarItem(
                icon: Icon(e.icon), label: e.name ?? ""))
            .toList(),
      ),
    );
  }
}
/*import 'package:bgs_app/main.dart';
import 'package:bgs_app/providers/nav_notifier.dart';
import 'package:bgs_app/views/fav_screen.dart';
import 'package:bgs_app/views/help_screen.dart';
import 'package:bgs_app/views/login.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({super.key});


@override
ConsumerState<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar>{
  int selectedIndex=0;
static final List<Widget>_widgetOptions = <Widget>[
  const HomePage(),
  const FavScreen(),
  const HelpScreen(),
];

 @override
  Widget build(BuildContext context) {
    var navIndex=ref.watch(NavProvider);
    return Scaffold(
      body: Center(
        child: _widgetOptions[navIndex.index],
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex.index,
      onTap: (value){
        ref.read(NavProvider.notifier).onIndexChanged(value);
      },
      elevation: 10,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.amber,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.pink,
      items: const [ 
      BottomNavigationBarItem(icon: Icon(Icons.home),activeIcon: Icon(Icons.home,),
      label: 'home'),
       BottomNavigationBarItem(icon: Icon(Icons.home),activeIcon: Icon(Icons.home,),
      label: 'home'),
       BottomNavigationBarItem(icon: Icon(Icons.home),activeIcon: Icon(Icons.home,),
      label: 'home'),
     
      ],),
    );
  }
}*/