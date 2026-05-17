import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatefulWidget {

  const SocialIcon(
      {super.key,
        required this.path,
        required this.url,
        this.decorateIcon=false,
        required this.isMobile,
        this.isEmail=false});
  final String path;
  final String url;
  final bool isMobile;
  final bool isEmail;
  final bool decorateIcon;


  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool isHover = false;

  Future<void> _launchUrl() async {
    final uri = Uri.parse(widget.url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _emailLauncher() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: widget.url,
      queryParameters: {
        'subject': '',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: widget.isMobile?35:50,
      height: widget.isMobile?35:50,
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.all( isHover ? 0 : 4.0),
      child: InkWell(
        onHover: (action) {
          setState(() {
            isHover = action;
          });
        },
        onTap: widget.isEmail == true ? _emailLauncher : _launchUrl,
        child:(widget.decorateIcon ?? false)
            ? Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(8),
          ),
          child: iconImage(),
        )
            : iconImage()
      ),
    );
  }
  Widget iconImage(){
    return Image.asset(
      widget.path,
      width: widget.isMobile ? 30 : 40,
      height: widget.isMobile?30 : 40,
      fit: BoxFit.contain,
    );
  }
}