import 'package:flutter/material.dart';

class ItemsDataModel {
  final String title;
  final String? imagePath;
  final String description;
   String? githubUrl;
  IconData? iconData;


  ItemsDataModel({required this.title, this.imagePath, required this.description,this.githubUrl,this.iconData});
}