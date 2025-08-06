import 'dart:math';
import 'dart:ui';
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
    'assets/images/yy/13e564280a019353109d119c9ee1df7f.jpg',
    'assets/images/yy/32ebeaec6da38a6fe5f6c0054e0f74ca.jpg',
    'assets/images/yy/4316c759ee9a4c91ad6b2eae3a4c1997.jpg',
    'assets/images/yy/5c3cfad86e2d1daf306c539a11b860cd.jpg',
    'assets/images/yy/5c840c91c531d5c5dd14eb893e4334b2.jpg',
    'assets/images/yy/7ccb4126246aa437ffa0715a02bc31c6.jpg',
    'assets/images/yy/99772ddb373dfd97f4780e19debc38dc.jpg',
    'assets/images/yy/aabc90a53e158fe36e0e2933ba2737ed.jpg',
    'assets/images/yy/d52a6c73c4f88b50db12ada554966c1a.jpg',
    'assets/images/yy/d6af56ff0df5c29f5f9437331e0196d6.jpg',
    'assets/images/yy/df9c58267bb47e30403ebd8264591d34.jpg',
    'assets/images/yy/eb36c34e0ded90ae44737d84a0c10d31.jpg',
    'assets/images/yy/eb866f3d5fc0630cce6f41a67e4b0cfc.jpg',
    'assets/images/yy/eba4518cb58676c1eadd1edb21f8a91d.jpg',
    'assets/images/yy/ecb09e5785e805c4afcb08ee750c178b.jpg',
    'assets/images/yy/eeb4c831f4717d880fda6ef1c5c947f7.jpg',
    'assets/images/yy/feba574d0407b8d4166a82096efde9aa.jpg',
  ];

  List<Color> _paletteColors = [];
  bool _isBackgroundDark = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_paletteColors.isEmpty) {
      _paletteColors = [
        Theme.of(context).colorScheme.surface,
        Theme.of(context).colorScheme.background,
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.secondary,
      ];
      _updateTextColor();
    }
  }

  void _updateTextColor() {
    if (_paletteColors.isEmpty) return;
    double totalLuminance = 0;
    for (var color in _paletteColors) {
      totalLuminance += color.computeLuminance();
    }
    final averageLuminance = totalLuminance / _paletteColors.length;
    setState(() {
      _isBackgroundDark = averageLuminance < 0.4;
    });
  }

  Future<void> _updateBackgroundColor(String imagePath) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(imagePath),
    );
    setState(() {
      if (paletteGenerator.colors.isNotEmpty) {
        _paletteColors = paletteGenerator.colors.toList();
      } else {
        _paletteColors = [
          Theme.of(context).colorScheme.surface,
          Theme.of(context).colorScheme.background,
        ];
      }
      _updateTextColor();
    });
  }

  Widget _buildColorGrid() {
    if (_paletteColors.isEmpty) {
      return const SizedBox.shrink();
    }
    const int gridSize = 6;
    return GridView.builder(
      key: ValueKey<List<Color>>(_paletteColors),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridSize,
      ),
      itemCount: 100, // A large number to fill the dialog background
      itemBuilder: (context, index) {
        final color = _paletteColors[_random.nextInt(_paletteColors.length)];
        return Container(color: color);
      },
    );
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
                    useSafeArea: false,
                    barrierColor: Colors.transparent,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setState) {
                        final textColor = _isBackgroundDark
                            ? Colors.white
                            : Theme.of(context).colorScheme.primary;

                        return AlertDialog(
                          insetPadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          contentTextStyle: TextStyle(
                            color: textColor,
                          ),
                          titleTextStyle: TextStyle(
                            color: textColor,
                          ),
                          content: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 500),
                                      child: _buildColorGrid(),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 90, sigmaY: 90),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: 80),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: TweenAnimationBuilder<Color?>(
                                            tween: ColorTween(end: textColor),
                                            duration:
                                                const Duration(milliseconds: 500),
                                            builder: (context, color, child) {
                                              return Text(
                                                'Murakami',
                                                style: TextStyle(
                                                  color: color,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        CarouselSlider(
                                          options: CarouselOptions(
                                              height: 400,
                                              autoPlay: true,
                                              enlargeCenterPage: true,
                                              viewportFraction: 0.75,
                                              onPageChanged: (index, reason) async {
                                                final PaletteGenerator
                                                    paletteGenerator =
                                                    await PaletteGenerator
                                                        .fromImageProvider(
                                                  AssetImage(
                                                      shuffledImages[index]),
                                                );

                                                List<Color> newPalette;
                                                if (paletteGenerator
                                                    .colors.isNotEmpty) {
                                                  newPalette = paletteGenerator
                                                      .colors
                                                      .toList();
                                                } else {
                                                  newPalette = [
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .surface,
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                  ];
                                                }

                                                double totalLuminance = 0;
                                                for (var color in newPalette) {
                                                  totalLuminance +=
                                                      color.computeLuminance();
                                                }
                                                final averageLuminance = newPalette
                                                        .isNotEmpty
                                                    ? totalLuminance /
                                                        newPalette.length
                                                    : 0;
                                                final isDark =
                                                    averageLuminance < 0.4;

                                                setState(() {
                                                  _paletteColors = newPalette;
                                                  _isBackgroundDark = isDark;
                                                });
                                              }),
                                          items: shuffledImages
                                              .map((item) => Container(
                                                    child: Center(
                                                        child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(8.0),
                                                      child: Image.asset(item,
                                                          fit: BoxFit.cover,
                                                          height: 400),
                                                    )),
                                                  ))
                                              .toList(),
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 32,
                                          ),
                                          child: TweenAnimationBuilder<Color?>(
                                            tween: ColorTween(end: textColor),
                                            duration:
                                                const Duration(milliseconds: 500),
                                            builder: (context, color, child) {
                                              return Text('Yohji Yamamoto POUR HOMMEのスタイリングをご紹介致します。',
                                                  style: TextStyle(color: color));
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 60),
                                        GestureDetector(
                                          child: TweenAnimationBuilder<Color?>(
                                            tween: ColorTween(end: textColor),
                                            duration:
                                                const Duration(milliseconds: 500),
                                            builder: (context, color, child) {
                                              return Text(
                                                '×',
                                                style: TextStyle(
                                                  color: color,
                                                  fontSize: 32,
                                                ),
                                              );
                                            },
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  );
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

