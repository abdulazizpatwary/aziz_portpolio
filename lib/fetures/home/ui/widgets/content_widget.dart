import 'package:flutter/material.dart';
import 'package:flutter_portfolio/fetures/home/data/item_datamodel.dart';

import 'bottom_hover_widget.dart';


class ContentWidget extends StatefulWidget {
  final ItemsDataModel model;

  const ContentWidget({super.key, required this.model, required this.isMobile, required this.isTablet});
  final bool isMobile;
  final bool isTablet;

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (val) {
        isHover = val;
        setState(() {});
      },
      child: SizedBox(
        width: widget.isMobile||widget.isTablet
            ? double.infinity
            : MediaQuery.of(context).size.width / 2.5,
        height: widget.isMobile||widget.isTablet ? 150 : 200,
        child: Stack(
          children: [
            Material(
              elevation: 4,
              shadowColor: Colors.black45,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                  padding: const EdgeInsets.all(20),
                color: const Color(0XFF0F172A),
                  alignment: Alignment.center,
                  child: Image.asset(
                    widget.model.imagePath!,
                  )),
            ),
            BottomHoverWidget(
              isItemHover:
              widget.isMobile ? true : isHover,
              githubUrl: widget.model.githubUrl??'', isMobile: widget.isMobile,

            ),
          ],
        ),
      ),
    );
  }
}