import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo / muy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 95),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '山本耀司',
              textAlign: TextAlign.center,
              style: GoogleFonts.shipporiMincho(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Color(0xFF231e1e),
                fontSize: 40.0,
                letterSpacing: 8,
                fontWeight: FontWeight.w500,
              ),
            ),
            //- Widgetをキャッシュしておける
            const SizedBox(height: 14),
            SizedBox(
              child: Text(
                'Yohji Yamamoto',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF231e1e),
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 60),
            Container(
              width: 800,
              height: 200,
              //- 角丸ボーダー
              foregroundDecoration: BoxDecoration(
                border: Border.all(color: Color(0xFFdddddd), width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              //- 角丸用Padding
              padding: const EdgeInsets.all(0.5),
              //- 角丸にクロップ
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'images/yy.png.webp',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 800,
              child: Text(
                '歌舞伎町で百貨店に総菜を卸す会社を経営する父・山本文雄と、その経理や事務作業を手伝っていた母・山本冨美の長男として東京都新宿区に生まれた[3]。父がルソン島で戦死した後、母は歌舞伎町でオーダーメイドの洋装店（フミ洋装店）を営んでいた（母も文化服装学院出身）[4]。',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF231e1e),
                  fontSize: 14,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
