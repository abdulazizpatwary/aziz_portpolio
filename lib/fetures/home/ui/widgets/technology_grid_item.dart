import 'package:flutter/material.dart';
import 'package:flutter_portfolio/app/app_colors.dart';
import 'package:flutter_portfolio/fetures/home/data/item_datamodel.dart';

class TechnologyGridItem extends StatelessWidget {


  const TechnologyGridItem({super.key, required this.model, required this.isMobile, required this.isTablet, });
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
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: AppColors.blueWhiteGradient,begin: Alignment.topLeft,end: Alignment.bottomRight),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(model.iconData,size: 20,color: Colors.white,),
              )),
          SizedBox(height: 16,),
          Center(
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 20 : 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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