import 'package:flutter/material.dart';
import 'package:flutter_portfolio/fetures/home/data/item_datamodel.dart';
import 'package:flutter_portfolio/fetures/home/ui/widgets/technology_grid_item.dart';



class SkillSectionItemWidget extends StatelessWidget {
  const SkillSectionItemWidget({super.key, required this.isMobile, required this.isTablet});

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    List<ItemsDataModel> itemsData = [
      ItemsDataModel(
        title: "Mobile Development",
        iconData: Icons.phone_android_rounded,
        description: "Building responsive and high-performance mobile applications using Flutter with clean architecture and modern UI principles.",


      ),
      ItemsDataModel(
          title: "Tools and Platform",
          description: "Experienced with Git, GitHub, Android Studio, Firebase, and REST API tools for efficient development workflow.",
          iconData: Icons.handyman
      ),
      ItemsDataModel(
          title:"Soft Skill",
          description: "Strong problem-solving, communication, teamwork, and adaptability skills for effective collaboration and project delivery.",
          iconData: Icons.psychology
      ),

    ];
    double cellWidth = ((MediaQuery.of(context).size.width - 0) / 2);
    double desiredCellHeight = isMobile
        ? 140
        : isTablet
        ? 480
        : 600;
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
        return TechnologyGridItem(model: itemsData[index], isMobile: isMobile, isTablet: isTablet,);
      },
    );
  }
}
