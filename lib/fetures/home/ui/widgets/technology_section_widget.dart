import 'package:flutter/material.dart';
import 'package:flutter_portfolio/fetures/home/data/item_datamodel.dart';
import 'package:flutter_portfolio/fetures/home/ui/widgets/technology_grid_item.dart';



class TechnologyServicesItemWidget extends StatelessWidget {
  const TechnologyServicesItemWidget({super.key, required this.isMobile, required this.isTablet});

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    List<ItemsDataModel> itemsData = [
      ItemsDataModel(
        title: "Flutter Development",
        iconData: Icons.phone_android_rounded,
        description: "Developing scalable cross-platform applications with Flutter, advanced state management, API integration, Firebase services, and responsive UI design.",


      ),
      ItemsDataModel(
        title: "RESTful API Integration",
        description: "Integrating RESTful APIs for dynamic data handling, authentication systems, and real-time application features.",
        iconData: Icons.api
      ),
      ItemsDataModel(
        title:"Firebase & Cloud Services",
        description: "Using Firebase for authentication, cloud database, storage, notifications, and backend-driven mobile applications.",
        iconData: Icons.local_fire_department
      ),
      ItemsDataModel(
          title: "Payment Gateway Integration",
          description: "Implementing secure payment systems and online transaction workflows for ecommerce applications.",
        iconData: Icons.payment

      ),
      ItemsDataModel(
        title: "Real Time Communication",
        description: "Building real-time communication features including live updates, messaging systems, and interactive user experiences.",
        iconData: Icons.connect_without_contact

      ),
      ItemsDataModel(
        title: "Google Maps & Locations Services",
        description: "Integrating maps, geolocation, and location-based services for navigation and live tracking features.",
        iconData: Icons.map

      ),
    ];
    double cellWidth = ((MediaQuery.of(context).size.width - 0) / 2);
    double desiredCellHeight = isMobile
        ? 140
        : isTablet
        ? 465
        : 620;
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
