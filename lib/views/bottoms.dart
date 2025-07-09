import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomsScreen extends StatefulWidget {
  const BottomsScreen({Key? key}) : super(key: key);

  @override
  _BottomsScreenState createState() => _BottomsScreenState();
}

class _BottomsScreenState extends State<BottomsScreen> {
  final List<String> domesticBrands = [
    'COMME des GARÇONS',
    'Yohji Yamamoto',
    'ISSEY MIYAKE',
    'sacai',
    'UNDERCOVER',
    'AURALEE',
    'COMOLI',
    'YAECA',
    'UNUSED',
    'YOKE',
    'NEIGHBORHOOD',
    'Hender Scheme',
    'NEEDLES',
    'WTAPS',
    'JAPAN BLUE JEANS',
  ];

  final Map<String, String> brandDescriptions = {
    'COMME des GARÇONS': '1969年に川久保玲が設立したCOMME des GARÇONSは、ファッション界に革命をもたらしたブランドです。そのデザインは、既成概念を打ち破る前衛的で挑戦的なアプローチが特徴で、特にアシンメトリーなカッティングや、黒を基調とした表現は世界中で高く評価されています。単なる服ではなく、アートとしての側面も持ち合わせており、着る人に強いメッセージを伝えます。',
    'Yohji Yamamoto': '山本耀司によるYohji Yamamotoは、1981年のパリコレクションデビュー以来、その独特の世界観でファッションシーンを牽引してきました。黒を基調とし、身体と服の間に生まれる空間を重視したデザインは、既成概念にとらわれない自由な発想から生まれています。ドレープやレイヤードを多用し、ジェンダーレスなスタイルを提案することで、着る人の個性を引き出すことを追求しています。',
    'ISSEY MIYAKE': '三宅一生が設立したISSEY MIYAKEは、「一枚の布」という哲学を核に、革新的な素材開発とデザインで世界的に有名です。特に、プリーツ加工の技術はブランドの代名詞であり、身体の動きに合わせて美しく変化する服は、機能性と芸術性を兼ね備えています。テクノロジーと伝統を融合させ、常に新しい表現を追求し続ける姿勢が、多くの人々を魅了しています。',
    'sacai': '1999年に阿部千登勢が立ち上げたsacaiは、異なる素材やシルエットを巧みに組み合わせた「ハイブリッドデザイン」が特徴のブランドです。ミリタリー、ワーク、トラッドなど、一見相反する要素を融合させることで、唯一無二のスタイルを確立しています。細部にまでこだわり抜かれたディテールと、遊び心のあるデザインは、ファッション感度の高い層から絶大な支持を得ています。',
    'UNDERCOVER': '高橋盾が手掛けるUNDERCOVERは、パンクやロックの精神を根底に持ちながら、独創的でアート性の高いデザインが人気のブランドです。ストリートカルチャーとモードを融合させた独自のスタイルは、常にファッションシーンに刺激を与え続けています。反骨精神と美意識が共存するコレクションは、着る人の内面にある個性を引き出し、強いメッセージを放ちます。',
    'AURALEE': '2015年に岩井良太が設立したAURALEEは、世界中から厳選された上質な素材と、それを最大限に活かした洗練されたデザインで知られています。素材本来の良さを追求し、シンプルながらも細部にまでこだわり抜かれたアイテムは、着る人の日常に寄り添いながらも、上質な着心地と美しいシルエットを提供します。普遍的でありながらも、現代的な感性が光るブランドです。',
    'COMOLI': '小森啓二郎が手掛けるCOMOLIは、日本の気候や風土、日本人の体型に合わせた、ゆったりとしたシルエットと上質な天然素材が魅力のブランドです。日常に溶け込むような、リラックスした大人のカジュアルスタイルを提案しており、着る人のライフスタイルに自然と馴染むデザインが特徴です。シンプルでありながらも、素材の風合いや着心地の良さを追求した、長く愛用できるアイテムが揃っています。',
    'YAECA': '「必然的にシンプル」をコンセプトに掲げるYAECAは、普遍的で長く愛されるデザインを追求するブランドです。日常着としての機能性と着心地の良さを重視し、上質な素材と丁寧な縫製で、シンプルながらも細部にまでこだわりが光るアイテムを生み出しています。流行に左右されないタイムレスな魅力があり、着る人の個性を引き立てる、洗練されたスタイルを提案しています。',
    'UNUSED': '2004年に設立されたUNUSEDは、デザイナー名を非公開にし、プロダクトの完成度で勝負する姿勢を貫いています。古着やヴィンテージの要素を現代的に再構築し、ストリートとモードを融合させた独自のスタイルが特徴です。既成概念にとらわれない自由な発想と、細部にまでこだわり抜かれたディテールが、ファッション感度の高い層から支持されています。',
    'YOKE': '2018年に設立されたYOKEは、ニットを中心とした、ジェンダーレスでミニマルなデザインが特徴のブランドです。つなぎ目を意識したデザインや、上質な素材と計算されたシルエットで、洗練された大人のカジュアルスタイルを提案しています。シンプルでありながらも、着る人の個性を引き出すような、繊細で美しいアイテムが揃っています。',
    'NEIGHBORHOOD': '滝沢伸介が手掛けるNEIGHBORHOODは、モーターサイクル、ミリタリー、アウトドアなどの要素を独自の解釈で昇華させた、ベーシックながらもタフな服作りをコンセプトにしています。ストリートカルチャーを背景に持ち、男らしい無骨なデザインと、細部にまでこだわり抜かれたディテールが特徴です。デニムやレザーアイテムなど、長く愛用できる高品質なアイテムが揃っています。',
    'Hender Scheme': '柏崎亮が手掛けるHender Schemeは、レザーシューズや革小物など、経年変化を楽しめる「ヌメ革」を使用したアイテムが人気のブランドです。工業製品としての靴を、手作業で丁寧に作り上げることで、温かみのある独特の風合いを生み出しています。使い込むほどに味わいが増すアイテムは、愛着を持って長く愛用できる、大人のための逸品です。',
    'NEEDLES': '有名セレクトショップ「NEPENTHES（ネペンテス）」の創立者である清水慶三が設立したNEEDLESは、アメリカンカジュアルやヒッピー、ロックなどの要素をミックスした、個性的なスタイルが特徴のブランドです。特に、トラックパンツやパピヨン柄のアイテムはブランドのアイコンとして人気を集めています。遊び心のあるデザインと、独特の世界観が魅力です。',
    'WTAPS': '西山徹が手掛けるWTAPSは、ミリタリーウェアをバックボーンに持ち、機能的で実用的なデザインを追求するブランドです。ストリートカルチャーとミリタリーを融合させた独自のスタイルは、都会的でありながらもタフな印象を与えます。丁寧なアップデートを重ねたアイテムは、日常使いにも適しており、長く愛用できる高品質なウェアが揃っています。',
    'JAPAN BLUE JEANS': 'デニムの産地である岡山県倉敷市児島地区を拠点とするJAPAN BLUE JEANSは、品質の高さで海外からも注目されているブランドです。原綿の選定から紡績、染色、織り、縫製まで、すべての工程を自社で一貫して行うことで、高品質なデニムを生み出しています。デニム本来の風合いや色落ちを楽しめる、本格的なジーンズが魅力です。',
  };

  final Map<String, List<String>> brandRecommendations = {
    'COMME des GARÇONS': ['Yohji Yamamoto', 'ISSEY MIYAKE', 'sacai', 'UNDERCOVER'],
    'Yohji Yamamoto': ['COMME des GARÇONS', 'ISSEY MIYAKE', 'sacai', 'UNDERCOVER'],
    'ISSEY MIYAKE': ['COMME des GARÇONS', 'Yohji Yamamoto', 'sacai', 'UNDERCOVER'],
    'sacai': ['COMME des GARÇONS', 'Yohji Yamamoto', 'ISSEY MIYAKE', 'UNDERCOVER'],
    'UNDERCOVER': ['COMME des GARÇONS', 'Yohji Yamamoto', 'ISSEY MIYAKE', 'sacai'],
    'AURALEE': ['COMOLI', 'YAECA', 'UNUSED', 'YOKE'],
    'COMOLI': ['AURALEE', 'YAECA', 'UNUSED', 'YOKE'],
    'YAECA': ['AURALEE', 'COMOLI', 'UNUSED', 'YOKE'],
    'UNUSED': ['AURALEE', 'COMOLI', 'YAECA', 'YOKE'],
    'YOKE': ['AURALEE', 'COMOLI', 'YAECA', 'UNUSED'],
    'NEIGHBORHOOD': ['WTAPS', 'NEEDLES'],
    'Hender Scheme': ['JAPAN BLUE JEANS'],
    'NEEDLES': ['NEIGHBORHOOD', 'WTAPS'],
    'WTAPS': ['NEIGHBORHOOD', 'NEEDLES'],
    'JAPAN BLUE JEANS': ['Hender Scheme'],
  };

  String? selectedBrand;
  String? coordinationText; // Add this line

  final Map<String, String> brandCoordinationTexts = {
    'COMME des GARÇONS': 'COMME des GARÇONSのコーディネートは、アシンメトリーなデザインや黒を基調としたモードなスタイルが特徴です。全身を黒で統一し、素材感の異なるアイテムをレイヤードすることで、奥行きのあるスタイリングが完成します。例えば、ボリュームのあるサルエルパンツに、シャープなジャケットを合わせ、足元は厚底のシューズでバランスを取ると、ブランドらしい前衛的な印象になります。小物には、ブランドロゴの入ったバッグや、個性的なアクセサリーを取り入れると、さらに世界観が深まります。',
    'Yohji Yamamoto': 'Yohji Yamamotoのコーディネートは、黒を基調としたゆったりとしたシルエットが特徴です。ドレープ感のあるロングシャツに、ワイドパンツを合わせることで、リラックス感がありながらも洗練されたスタイルが生まれます。足元はレザーシューズやブーツで引き締め、全体的に重厚感を出すと良いでしょう。ジェンダーレスなアイテムが多いので、あえてオーバーサイズを選び、身体と服の間に生まれる空間を楽しむ着こなしもおすすめです。',
    'ISSEY MIYAKE': 'ISSEY MIYAKEのコーディネートは、プリーツやA-POCなどの独自素材と革新的なデザインが魅力です。例えば、プリーツ加工のトップスに、シンプルなボトムスを合わせるだけで、動きのある美しいシルエットが際立ちます。鮮やかな色彩のアイテムを取り入れることで、よりアーティスティックな印象になります。アクセサリーは控えめにし、服そのもののデザイン性を最大限に活かすのがポイントです。',
    'sacai': 'sacaiのコーディネートは、異なる素材やデザインを組み合わせたハイブリッドなスタイルが特徴です。例えば、ニットとナイロンが切り替えられたブルゾンに、プリーツスカートを合わせることで、カジュアルさと上品さが融合した洗練された印象になります。ミリタリー要素のあるアウターに、レースやフリルなどのフェミニンなディテールをプラスするなど、意外性のある組み合わせを楽しむのがsacaiらしい着こなしです。',
    'UNDERCOVER': 'UNDERCOVERのコーディネートは、パンクやロックの要素を取り入れたストリートスタイルが特徴です。グラフィックTシャツにダメージ加工のデニムを合わせ、足元はスニーカーやブーツでまとめると、ブランドらしい反骨精神を表現できます。レザーアイテムやスタッズなどのディテールを取り入れることで、よりエッジの効いた印象になります。全体的にダークトーンでまとめつつ、差し色で個性を出すのも良いでしょう。',
    'AURALEE': 'AURALEEのコーディネートは、上質な素材とミニマルなデザインが特徴です。例えば、カシミヤ混のニットに、上質なウール素材のワイドパンツを合わせるだけで、シンプルながらも素材の良さが際立つ上品なスタイルが完成します。全体的にワントーンでまとめ、素材の質感の違いで奥行きを出すのがおすすめです。足元はクリーンなスニーカーやレザーシューズで、洗練された印象を保ちましょう。',
    'COMOLI': 'COMOLIのコーディネートは、日本の気候や風土に合わせた、ゆったりとしたシルエットと上質な天然素材が特徴です。例えば、リネン素材のシャツに、コットン素材のイージーパンツを合わせることで、リラックス感がありながらも品のある大人のカジュアルスタイルが生まれます。全体的にアースカラーでまとめ、自然な風合いを活かすのがCOMOLIらしい着こなしです。足元はサンダルやスニーカーで、抜け感を出すと良いでしょう。',
    'YAECA': 'YAECAのコーディネートは、「必然的にシンプル」をコンセプトにした、普遍的で長く愛されるデザインが特徴です。例えば、定番のコンフォートシャツに、ストレートシルエットのチノパンを合わせるだけで、清潔感のある上品なカジュアルスタイルが完成します。素材の良さが際立つシンプルなアイテムが多いので、着心地の良さを重視しつつ、長く愛用できるアイテムを選ぶのがおすすめです。足元はスニーカーや革靴で、幅広いスタイルに対応できます。',
    'UNUSED': 'UNUSEDのコーディネートは、古着やヴィンテージの要素を取り入れつつ、現代的な解釈を加えたデザインが特徴です。例えば、オーバーサイズのTシャツに、ダメージ加工のデニムを合わせ、足元はスニーカーでまとめると、こなれたストリートスタイルが完成します。ミリタリージャケットやワークシャツなどのアイテムをミックスすることで、より奥行きのある着こなしになります。レイヤードやサイズ感で遊び心を加えるのがUNUSEDらしいスタイリングです。',
    'YOKE': 'YOKEのコーディネートは、ニットを中心とした、ジェンダーレスでミニマルなデザインが特徴です。例えば、上質なウール素材のニットに、ワイドシルエットのスラックスを合わせることで、洗練された大人のカジュアルスタイルが生まれます。全体的にワントーンでまとめ、素材の質感の違いで奥行きを出すのがおすすめです。ユニセックスなアイテムが多いので、あえて大きめのサイズを選び、リラックス感のある着こなしを楽しむのも良いでしょう。',
    'NEIGHBORHOOD': 'NEIGHBORHOODのコーディネートは、モーターサイクル、ミリタリー、ワークなどの要素を取り入れた、タフで男らしいスタイルが特徴です。例えば、プリントTシャツに、ウォッシュ加工のデニムを合わせ、足元はブーツでまとめると、ブランドらしい無骨な雰囲気を表現できます。レザージャケットやミリタリージャケットなどのアウターを取り入れることで、より重厚感のあるスタイルになります。小物には、バンダナやキャップなどをプラスすると、ストリート感を強調できます。',
    'Hender Scheme': 'Hender Schemeのコーディネートは、レザーシューズや革小物など、経年変化を楽しめる「ヌメ革」を使用したアイテムが人気のブランドです。例えば、シンプルなTシャツに、チノパンやデニムを合わせ、足元にブランドのレザーシューズを取り入れるだけで、コーディネート全体が上品に引き締まります。使い込むほどに色合いや風合いが変化するヌメ革のアイテムは、愛着を持って長く愛用できる、大人のための逸品です。',
    'NEEDLES': 'NEEDLESのコーディネートは、アメリカンカジュアルやヒッピー、ロックなどの要素をミックスした、個性的なスタイルが特徴です。例えば、ブランドのアイコンであるトラックパンツに、シンプルなTシャツやスウェットを合わせるだけで、遊び心のあるリラックススタイルが完成します。パピヨン柄のアイテムや、鮮やかな色彩のアイテムを取り入れることで、より個性的な印象になります。足元はスニーカーやサンダルで、抜け感を出すと良いでしょう。',
    'WTAPS': 'WTAPSのコーディネートは、ミリタリーウェアをバックボーンに持ち、機能的で実用的なデザインを追求するブランドです。例えば、ミリタリージャケットに、カーゴパンツやデニムを合わせ、足元はブーツでまとめると、都会的でありながらもタフなミリタリースタイルが完成します。ブランドロゴの入ったTシャツやスウェットをインナーに取り入れることで、よりストリート感を強調できます。機能的な素材やディテールにこだわり、長く愛用できるアイテムを選ぶのがおすすめです。',
    'JAPAN BLUE JEANS': 'JAPAN BLUE JEANSのコーディネートは、岡山県児島地区で生産される高品質なデニムが特徴です。例えば、シンプルな白Tシャツに、ブランドのストレートデニムを合わせるだけで、デニム本来の風合いや色落ちを最大限に楽しめるスタイルが完成します。トップスには、カジュアルなシャツやスウェットを合わせるのも良いでしょう。足元はスニーカーやブーツで、幅広いスタイルに対応できます。デニムの経年変化を楽しみながら、自分だけのオリジナルな一本を育てていくのが魅力です。',
  };

  void _showBrandPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => SizedBox(
        height: 216,
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 32.0,
          onSelectedItemChanged: (int selectedItem) {
            setState(() {
              selectedBrand = domesticBrands[selectedItem];
              coordinationText = brandCoordinationTexts[selectedBrand]; // Update coordinationText
            });
          },
          children:
              List<Widget>.generate(domesticBrands.length, (int index) {
            return Center(
              child: Text(
                domesticBrands[index],
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Wrap with SafeArea
      child: Column( // New Column
        children: [
          Expanded( // Expanded SingleChildScrollView
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CupertinoButton(
                      onPressed: _showBrandPicker,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: CupertinoColors.lightBackgroundGray, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              selectedBrand ?? 'ブランドで絞り込み',
                              style: const TextStyle(color: CupertinoColors.label),
                            ),
                            const SizedBox(width: 8.0),
                            const Icon(CupertinoIcons.down_arrow, size: 16.0),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (selectedBrand != null)
                      Column(
                        children: [
                          Text(
                            '選択中のブランド: $selectedBrand',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            brandDescriptions[selectedBrand!] ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 20),
                        if (coordinationText != null)
                          Column(
                            children: [
                              const Text(
                                'コーディネート情報',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                coordinationText!,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 20),
                        const Text(
                          'このブランドが好きな方へのおすすめ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (brandRecommendations[selectedBrand!] != null)
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: brandRecommendations[selectedBrand!]!
                                .map((brand) => Chip(label: Text(brand)))
                                .toList(),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
