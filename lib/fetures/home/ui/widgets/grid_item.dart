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
        gradient: LinearGradient(colors: [
          Color(0xFF020617),
          Color(0xFF0B1120)
        ]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //const Spacer(),



          ContentWidget(
            model: model, isMobile: isMobile, isTablet: isTablet,
          ),
          //const Spacer(),
          SizedBox(height: 16,),
          Text(
            model.title,
            textAlign: TextAlign.center,
            maxLines: 1,

            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: isMobile ? 20 : 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16,),
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