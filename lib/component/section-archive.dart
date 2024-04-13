import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SectionWidget extends StatelessWidget {
  final String title_jp;
  final String title_en;
  final String content;
  final String img;
  SectionWidget(this.title_jp,this.title_en,this.content,this.img);

  @override
  Widget build(BuildContext context) {
    return SelectionArea (
      child: Container(
        color: Theme.of(context).colorScheme.background,
        width: double.infinity,
        padding: EdgeInsets.only(top: 55, right: 40, bottom: 95, left: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title_jp,
              textAlign: TextAlign.center,
              style: GoogleFonts.shipporiMincho(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 40.0,
                letterSpacing: 8,
                fontWeight: FontWeight.w500,
              ),
            ),
            //- Widgetをキャッシュしておける
            const SizedBox(height: 14),
            SizedBox(
              child: Text(
                title_en,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
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
                border: Border.all(color: Theme.of(context).colorScheme.surface, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              //- 角丸用Padding
              padding: const EdgeInsets.all(0.5),
              //- 角丸にクロップ
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 800,
              child: Text(
                content,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 14,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 800,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          contentTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          titleTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text('急に芯食ってくんな‼︎'),
                          content: Text('確かにそうゆう説もあるよ‼︎'),
                          actions: <Widget>[
                            GestureDetector(
                              child:
                                Text(
                                  'いいえ',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            GestureDetector(
                              child:
                                Text(
                                  'はい',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });
                },
                child: Row(
                  //- 右寄せ
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.network(
                      'https://raw.githubusercontent.com/keichan37/keichan37.github.io/master/assets/images/circleArrowRight.svg',
                      colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: SizedBox(
                        width: 8,
                        height: 16,
                      ),
                    ),
                    Text(
                      '詳しく見る',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
