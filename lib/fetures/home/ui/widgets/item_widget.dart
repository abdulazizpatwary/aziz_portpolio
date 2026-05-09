import 'package:flutter/material.dart';
import 'package:flutter_portfolio/app/app_constants.dart';
import 'package:flutter_portfolio/app/assets_path.dart';
import 'package:flutter_portfolio/fetures/home/data/item_datamodel.dart';

import 'grid_item.dart';


class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key, required this.isMobile, required this.isTablet});

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    List<ItemsDataModel> itemsData = [
      ItemsDataModel(
        title: "Ecommerce",
        imagePath:AssetsPath.ecommerceLogowebp,
        description: "Modern ecommerce app with cart, payment, and authentication features.",
        githubUrl:AppConstants.ecommerce,

      ),
      ItemsDataModel(
        title: "TaskManager",
        imagePath:AssetsPath.tskLogowebp,
        description: "Task management app for organizing daily activities efficiently.",
        githubUrl:AppConstants.taskManger,
      ),
      ItemsDataModel(
        title: "ArtConnects",
        imagePath:AssetsPath.artConnectWebp,
        description: "Social platform for artists to share and discover artwork.",
        githubUrl:AppConstants.artConnect,


      ),
      ItemsDataModel(
        title: "Football LiveScore",
        imagePath:AssetsPath.footballLivewebp,
        description: "Real-time football scores with live updates and stats.",
          githubUrl:AppConstants.footballLiveScore
      ),
    ];
    double cellWidth = ((MediaQuery.of(context).size.width - 0) / 2);
    double desiredCellHeight = isMobile
        ? 200
        : isTablet
        ? 600
        : 800;
    double childAspectRatio = cellWidth / desiredCellHeight;
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemsData.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile
            ? 1
            : isTablet
            ? 2
            : 3,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return GridItem(model: itemsData[index], isMobile: isMobile, isTablet: isTablet,);
      },
    );
  }
}
