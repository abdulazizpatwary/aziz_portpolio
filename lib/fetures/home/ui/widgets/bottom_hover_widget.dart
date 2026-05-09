import 'package:flutter/material.dart';
import 'package:flutter_portfolio/app/assets_path.dart';
import 'package:flutter_portfolio/fetures/home/ui/widgets/social_icon.dart';

class BottomHoverWidget extends StatelessWidget {
  final bool isItemHover;
  final String githubUrl;


  const BottomHoverWidget(
      {super.key,
        required this.isItemHover,
        required this.githubUrl,
       required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isItemHover ? 35 : 0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16)),
            boxShadow: [
              if(isItemHover)const BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 2,
                color: Colors.black26,
              ),
            ],
          ),
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FittedBox(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  if(githubUrl.isNotEmpty)
                    SocialIcon(
                      path: AssetsPath.githubWebpUrl,
                      url: githubUrl,
                      decorateIcon: false, isMobile: isMobile,
                    ),


                ],
              ),
            ),
          )),
    );
  }
}