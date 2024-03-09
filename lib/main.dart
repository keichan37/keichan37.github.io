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
      ),
      home:
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 95),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'おすすめ製品',
              textAlign: TextAlign.center,
              style: GoogleFonts.shipporiMincho(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Color(0xFF231e1e),
                fontSize: 40.0,
                letterSpacing: 8,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              child: Text(
                'Recommendation',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSans(
                  color: Color(0xFF231e1e),
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
