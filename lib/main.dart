import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomScaffold(),
    );
  }
}

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //30,24,58
        backgroundColor: const Color.fromRGBO(30, 24, 58, 1),
        title: Text(
          '짭',
          style: GoogleFonts.abhayaLibre(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        leading: ConstrainedBox(
          constraints: const BoxConstraints(
              minWidth: 150,
              maxWidth: 300,
              minHeight: 40,
              maxHeight: 80
          ),
          child: Image.asset(
            'assets/image/logo_mangot5.png',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.reorder),
            tooltip: 'HI',
            onPressed: () => [],
          )
        ],
      ),
      body: Center(
          child: Text('asdfasfasdf')
      ),
      bottomNavigationBar: const Button(),
    );
  }
}

class Button extends StatefulWidget {
  const Button({super.key});
  @override
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<Button> {

  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  List<DotNavigationBarItem> item=  [
    DotNavigationBarItem(
        icon: const Icon(Icons.home),
        selectedColor: Colors.white
    ),
    DotNavigationBarItem(
        icon: const Icon(Icons.support_agent),
        selectedColor: Colors.white
    ),
    DotNavigationBarItem(
        icon: const Icon(Icons.shop_2),
        selectedColor: Colors.white
    ),
    DotNavigationBarItem(
        icon: const Icon(Icons.reorder),
        selectedColor: Colors.white
    ),
  ];

  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: const EdgeInsets.only(left: 10, right: 10),
          dotIndicatorColor: Colors.blue,
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _handleIndexChanged,
          items: item,
          backgroundColor: const Color.fromRGBO(30, 24, 58, 1),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.blue,
        )
    );
  }

}
enum _SelectedTab { home, support_agent, shop_2, reorder }