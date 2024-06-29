import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../component/section-archive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //- appBar分
            CarouselSlider(
              options: CarouselOptions(
                height: 768,
                aspectRatio: 4/3,
                viewportFraction: 1,
              ),
              items: ["yy","si"].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      child: Image.network(
                        'https://raw.githubusercontent.com/keichan37/keichan37.github.io/master/assets/images/s-$i.jpg.webp',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SectionWidget("三宅一生", "ISSEY MIYAKE", "広島市立尾長小学校在学中7歳のとき被爆[4][13][14][15][16][17]。広島大学附属東雲中学校[18]～広島県立広島国泰寺高等学校卒業[15][19]。小学校高学年のときの担任が絵の先生で、絵を描く楽しさを教えてもらう[20]。広島の美術館や岡山県倉敷の大原美術館にもよく通った[20]。ルオーが好きだったという[20]。", "https://raw.githubusercontent.com/keichan37/keichan37.github.io/master/assets/images/im.png.webp"),
            SectionWidget("山本耀司", "Yohji Yamamoto", "歌舞伎町で百貨店に総菜を卸す会社を経営する父・山本文雄と、その経理や事務作業を手伝っていた母・山本冨美の長男として東京都新宿区に生まれた[3]。父がルソン島で戦死した後、母は歌舞伎町でオーダーメイドの洋装店（フミ洋装店）を営んでいた（母も文化服装学院出身）[4]。", "https://raw.githubusercontent.com/keichan37/keichan37.github.io/master/assets/images/yy.png.webp"),
          ],
        ),
      ),
    );
  }
}
