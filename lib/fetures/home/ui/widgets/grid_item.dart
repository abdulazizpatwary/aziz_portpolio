import 'package:flutter/material.dart';
import 'package:flutter_portfolio/fetures/home/data/item_datamodel.dart';

import 'content_widget.dart';

class GridItem extends StatelessWidget {


  const GridItem({super.key, required this.model, required this.isMobile, required this.isTablet, });
  final ItemsDataModel model;
  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      decoration:
      BoxDecoration(
        color: const Color(0XFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 20 : 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ContentWidget(
            model: model, isMobile: isMobile, isTablet: isTablet,
          ),
          const Spacer(),
          Expanded(
            child: Text(
              model.description,
              style:
              TextStyle(
                fontSize: isMobile ? 13 : 16,
                color: Colors.white70,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}