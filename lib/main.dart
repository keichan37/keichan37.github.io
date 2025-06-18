import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'component/appbar.dart';
import 'views/home.dart';
import 'views/notification.dart';
import 'views/account.dart';
import 'dart:ui';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //- ↓を設定しなければ動的にステータスバーの色が変わる
      //-statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'yy',
      theme: ThemeData(
        useMaterial3: true,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: Color(0xFF231e1e),
          secondary: Color(0xFF514949),
          background: Color(0xFFffffff),
          surface: Color(0xFFdddddd),
          shadow: Color(0x26BB2739),
          onBackground: Color(0xFFffffff),
          onSurface: Color(0xFF231e1e),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Color(0xFFffffff),
          secondary: Color(0xFFffffff),
          background: Color(0xFF000000),
          surface: Color(0x30ffffff),
          shadow: Color(0x00ffffff),
          onBackground: Color(0xFF212124),
          onSurface: Color(0xFF000000),
        ),
      ),
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const _screens = [
    HomeScreen(),
    NotificationScreen(),
    AccountScreen()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //- ScaffoldとappBarの描画位置を一緒に
      extendBodyBehindAppBar: true,
      appBar: BlurredAppBar(),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).colorScheme.onBackground,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                child: Text(
                  'Domestic Brand',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18,
                    height: 1.4,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'sacai',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'ISSEI MIYAKE',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Yohji Yamamoto',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 50,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.surface,
        selectedFontSize: 12,
        enableFeedback: true,
        backgroundColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/tops.svg'
            ),
            label: 'トップス',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'ボトムス',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'プロフィール',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
