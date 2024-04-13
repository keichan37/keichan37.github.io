import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlurredAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: Color(0x26BB2739),
                blurRadius: 12,
                offset: Offset(0, 0),
                spreadRadius: 0,
              ),
            ]
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.network(
                'https://raw.githubusercontent.com/keichan37/keichan37.github.io/master/assets/images/si.svg',
                height: 24,
                width: 105.84,
              ),
              IconButton(
                onPressed: () {
                },
                icon: Icon(Icons.menu),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(72.0);
}
