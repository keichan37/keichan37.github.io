import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'component/appbar.dart';
import 'component/section-archive.dart';
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
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'yy',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Theme.of(context).colorScheme.background,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: Color(0xFF231e1e),
          secondary: Color(0xFF514949),
          background: Color(0xFFffffff),
          surface: Color(0xFFdddddd),
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
          secondary: Color(0xFF514949),
          background: Color(0xFF000000),
          surface: Color(0xFFeeeeee),
        ),
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        //- ScaffoldとappBarの描画位置を一緒に
        extendBodyBehindAppBar: true,
        appBar: BlurredAppBar(),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //- appBar分
                ColoredBox(
                  color: Color(0xFFFFFFFF),
                  child: SizedBox(
                    height: 160,
                    width: double.infinity,
                  ),
                ),
                SectionWidget("三宅一生", "ISSEY MIYAKE", "広島市立尾長小学校在学中7歳のとき被爆[4][13][14][15][16][17]。広島大学附属東雲中学校[18]～広島県立広島国泰寺高等学校卒業[15][19]。小学校高学年のときの担任が絵の先生で、絵を描く楽しさを教えてもらう[20]。広島の美術館や岡山県倉敷の大原美術館にもよく通った[20]。ルオーが好きだったという[20]。", "https://raw.githubusercontent.com/keichan37/keichan37.github.io/master/assets/images/im.png.webp"),
                SectionWidget("山本耀司", "Yohji Yamamoto", "歌舞伎町で百貨店に総菜を卸す会社を経営する父・山本文雄と、その経理や事務作業を手伝っていた母・山本冨美の長男として東京都新宿区に生まれた[3]。父がルソン島で戦死した後、母は歌舞伎町でオーダーメイドの洋装店（フミ洋装店）を営んでいた（母も文化服装学院出身）[4]。", "https://raw.githubusercontent.com/keichan37/keichan37.github.io/master/assets/images/yy.png.webp"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
