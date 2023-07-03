import 'package:flutter/material.dart';
import 'package:japs/constants/assets_icon.dart';
import 'package:japs/pages/home/home_page.dart';
import 'package:japs/pages/setting/setting_page.dart';
import 'package:japs/pages/upkeep/upkeep_field.dart';

import '../pages/harvesting/harvest_field.dart';

enum HomeConstant {
  home(
      name: 'Home',
      page: HomePage(),
      selectedIcon: Icon(Icons.home_filled),
      icon: Icon(Icons.home)),
  setting(
      name: 'Setting',
      page: SettingPage(),
      selectedIcon: Icon(Icons.settings),
      icon: Icon(Icons.settings_outlined));

  final String name;
  final Widget page;
  final Widget selectedIcon;
  final Widget icon;
  const HomeConstant(
      {required this.name,
      required this.page,
      required this.selectedIcon,
      required this.icon});
}

enum HomeForm {
  upkeep(name: 'Upkeep', iconImg: AssetsIcons.upkeep, homePage: UpkeepField()),
  harvest(
      name: 'Harvesting',
      iconImg: AssetsIcons.harvest,
      homePage: HarvestField());

  final String name;
  final String iconImg;
  final Widget homePage;
  const HomeForm(
      {required this.name, required this.iconImg, required this.homePage});
}
