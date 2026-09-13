import 'package:flutter/material.dart';
import 'package:flutter_portfolio/app/app_colors.dart';
import 'package:flutter_portfolio/fetures/home/data/item_datamodel.dart';

class TechnologyGridItem extends StatelessWidget {
  const TechnologyGridItem({
    super.key,
    required this.model,
    required this.isMobile,
    required this.isTablet,
  });

  final ItemsDataModel model;
  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(isMobile ? 2 : 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.blueWhiteGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 10 : 16),
              child: Icon(
                model.iconData,
                size: isMobile ? 16 : 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 8 : 16),
          Text(
            model.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: isMobile ? 15 : 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isMobile ? 10 : 20),
          Text(
            model.description,
            maxLines: isMobile ? 4 : 6,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: isMobile ? 12 : 16,
              color: Colors.white70,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}