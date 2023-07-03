import 'package:flutter/material.dart';

import '../../constants/upkeep_constants.dart';

class UpkeepTitle extends StatelessWidget {
  final UpkeepTab upkeepTab;
  const UpkeepTitle({super.key, required this.upkeepTab});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            upkeepTab.name,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          Image.asset(
            upkeepTab.iconImg,
            height: size.width * .08,
            width: size.width * .08,
          )
        ],
      ),
    );
  }
}
