import 'package:flutter/material.dart';

enum HarvestingTab {
  harvester(name: 'Harvester Carries', icon: Icons.grass_outlined),
  monitoring(
      name: 'Monitoring Productivity', icon: Icons.desktop_windows_outlined),
  ;

  final String name;
  final IconData icon;
  const HarvestingTab({required this.name, required this.icon});
}

enum HarvestingTypeEvit {
  mtg(name: 'MTG'),
  mechanical(name: 'Mechanical Buffalo');

  final String name;
  const HarvestingTypeEvit({required this.name});
}
