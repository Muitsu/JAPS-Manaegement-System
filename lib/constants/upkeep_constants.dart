import 'package:flutter/material.dart';
import 'assets_icon.dart';

enum UpkeepTab {
  manuring(
      name: 'Manuring', icon: Icon(Icons.grass), iconImg: AssetsIcons.manuring),
  spraying(
      name: 'Spraying', icon: Icon(Icons.grass), iconImg: AssetsIcons.spraying),
  weeding(
      name: 'Weeding', icon: Icon(Icons.grass), iconImg: AssetsIcons.weeding),
  pnd(name: 'PnD', icon: Icon(Icons.pest_control), iconImg: AssetsIcons.pnd);

  final String name;
  final Widget icon;
  final String iconImg;
  const UpkeepTab(
      {required this.name, required this.icon, required this.iconImg});
}

enum MTypeFerti {
  nkc(name: 'NKC'),
  rp(name: 'RP'),
  borate(name: 'Borate'),
  mcp(name: 'MCP');

  final String name;
  const MTypeFerti({required this.name});
}

enum MMethod {
  vicon(name: 'Vicon Spreader'),
  mtfa(name: 'MTFA'),
  manual(name: 'Manual'),
  ;

  final String name;
  const MMethod({required this.name});
}

enum STypeChemi {
  gluto(name: 'Glutosinate'),
  glyph(name: 'Glyphosinate'),
  met(name: 'Metsulfuron'),
  ;

  final String name;
  const STypeChemi({required this.name});
}

enum SMethod {
  inter(name: 'Interpalm'),
  stGeo(name: 'ST Geo 101'),
  st102(name: 'ST 102'),
  ;

  final String name;
  const SMethod({required this.name});
}

enum WType {
  decreeping(name: 'Decreeping'),
  grass(name: 'Grass Cutting');

  final String name;
  const WType({required this.name});
}

enum PType {
  spray(name: 'Spraying'),
  rat(name: 'Rat Baiting'),
  trunk(name: 'Trunk Injection');

  final String name;
  const PType({required this.name});
}

enum PMethod {
  cyper(name: 'Cypermethrin'),
  racumin(name: 'Racumin'),
  ace(name: 'Acephate');

  final String name;
  const PMethod({required this.name});
}
