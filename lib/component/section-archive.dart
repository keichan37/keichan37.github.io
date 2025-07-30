import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';

class SectionWidget extends StatefulWidget {
  //- 変数
  final String title_jp;
  final String title_en;
  final String content;
  final String img;
  SectionWidget(this.title_jp, this.title_en, this.content, this.img);

  @override
  _SectionWidgetState createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  final _random = Random();
  final List<String> _yyImages = [
    'assets/images/yy/0bbcd486584d997af7031bc50c491f88.jpg',
    'assets/images/yy/4316c759ee9a4c91ad6b2eae3a4c1997.jpg',
    'assets/images/yy/5c3cfad86e2d1daf306c539a11b860cd.jpg',
    'assets/images/yy/5c840c91c531d5c5dd14eb893e4334b2.jpg',
    'assets/images/yy/aabc90a53e158fe36e0e2933ba2737ed.jpg',
    'assets/images/yy/d52a6c73c4f88b50db12ada554966c1a.jpg',
    'assets/images/yy/df9c58267bb47e30403ebd8264591d34.jpg',
    'assets/images/yy/eb36c34e0ded90ae44737d84a0c10d31.jpg',
    'assets/images/yy/eb866f3d5fc0630cce6f41a67e4b0cfc.jpg',
    'assets/images/yy/eba4518cb58676c1eadd1edb21f8a91d.jpg',
    'assets/images/yy/ecb09e5785e805c4afcb08ee750c178b.jpg',
    'assets/images/yy/eeb4c831f4717d880fda6ef1c5c947f7.jpg',
    'assets/images/yy/feba574d0407b8d4166a82096efde9aa.jpg',
  ];

  Color? _backgroundColor;

  Future<void> _updateBackgroundColor(String imagePath) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(imagePath),
    );
    setState(() {
      _backgroundColor = paletteGenerator.dominantColor?.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
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
              widget.title_jp,
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
                widget.title_en,
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
                border: Border.all(
                    color: Theme.of(context).colorScheme.surface, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              //- 角丸用Padding
              padding: const EdgeInsets.all(0.5),
              //- 角丸にクロップ
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  widget.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 800,
              child: Text(
                widget.content,
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
                  final shuffledImages = _yyImages..shuffle(_random);
                  _updateBackgroundColor(shuffledImages.first);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: _backgroundColor,
                          contentTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          titleTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(widget.title_en),
                          content: Container(
                            width: 400,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                      height: 400,
                                      autoPlay: true,
                                      enlargeCenterPage: true,
                                      onPageChanged: (index, reason) {
                                        _updateBackgroundColor(
                                            shuffledImages[index]);
                                      }),
                                  items: shuffledImages
                                      .map((item) => Container(
                                            child: Center(
                                                child: Image.asset(item,
                                                    fit: BoxFit.cover,
                                                    height: 400)),
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(height: 20),
                                const Text('毎回異なるコーディネートの提案です。'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            GestureDetector(
                              child: Text(
                                '閉じる',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
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
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.secondary,
                          BlendMode.srcIn),
                    ),
                    //- アイコンとテキストの間も発火範囲
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
