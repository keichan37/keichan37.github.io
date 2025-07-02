import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'component/appbar.dart';
import 'views/tops.dart';
import 'views/bottoms.dart';
import 'views/shoes.dart';
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
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        textTheme: GoogleFonts.notoSansTextTheme().copyWith(
          displayLarge: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          displayMedium: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          displaySmall: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          bodyLarge: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          bodyMedium: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          bodySmall: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          labelLarge: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          labelMedium: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          labelSmall: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
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
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        textTheme: GoogleFonts.notoSansTextTheme().copyWith(
          displayLarge: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          displayMedium: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          displaySmall: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          bodyLarge: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          bodyMedium: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          bodySmall: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          labelLarge: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          labelMedium: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
          labelSmall: GoogleFonts.notoSans(fontWeight: FontWeight.w500),
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
    TopsScreen(),
    BottomsScreen(),
    ShoesScreen()
  ];

  int _selectedIndex = 0;
  bool _isLoading = true; // 初期表示時はローディング状態

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    // 初期データの読み込みや準備のシミュレーション
    await Future.delayed(Duration(seconds: 2)); // 2秒の遅延
    setState(() {
      _isLoading = false; // 初期ローディング終了
    });
  }

  void _onItemTapped(int index) async {
    setState(() {
      _isLoading = true; // ローディング開始
    });

    // 実際のデータ取得や処理のシミュレーション
    await Future.delayed(Duration(milliseconds: 500)); // 500msの遅延

    setState(() {
      _selectedIndex = index;
      _isLoading = false; // ローディング終了
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
              SizedBox(height: MediaQuery.of(context).padding.top),
              ListTile(
                title: Text(
                  'トップス',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: _selectedIndex == 0
                        ? FontWeight.bold
                        : FontWeight.w500,
                  ),
                ),
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'ボトムス',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: _selectedIndex == 1
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'シューズ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: _selectedIndex == 2
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: CupertinoActivityIndicator()) // ローディング中はインジケータを表示
          : _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              blurRadius: 12,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ]
        ),
        child: BottomNavigationBar(
          elevation: 50,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Theme.of(context).colorScheme.surface,
          selectedFontSize: 12,
          enableFeedback: true,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/tops.svg',
                width: 28,
                height: 28,
                color: _selectedIndex == 0
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.surface,
              ),
              label: 'トップス',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/bottoms.svg',
                width: 28,
                height: 28,
                color: _selectedIndex == 1
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.surface,
              ),
              label: 'ボトムス',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/shoes.svg',
                width: 28,
                height: 28,
                color: _selectedIndex == 2
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.surface,
              ),
              label: 'シューズ',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
