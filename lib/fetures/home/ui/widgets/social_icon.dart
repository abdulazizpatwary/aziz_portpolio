import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatefulWidget {

  const SocialIcon(
      {super.key,
        required this.path,
        required this.url,
        this.decorateIcon,
        required this.isMobile,
        this.isEmail});
  final String path;
  final String url;
  final bool isMobile;
  final bool? isEmail;
  final bool? decorateIcon;


  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool isHover = false;

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(widget.url))) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  Future<void> _emailLauncher() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

// ···
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: widget.url,
      query: encodeQueryParameters(<String, String>{
        'subject': '',
      }),
    );

    launchUrl(emailLaunchUri);
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
        onTap: widget.isEmail != null && widget.isEmail!
            ? _emailLauncher
            : _launchUrl,
        child: widget.decorateIcon!=null&&!widget.decorateIcon!?iconImage():Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(8)
            ),
            child: iconImage()
        ),
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