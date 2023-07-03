import 'package:flutter/material.dart';
import 'package:japs/constants/harvesting_constants.dart';

class HarvestTitle extends StatelessWidget {
  final HarvestingTab harvestTab;
  const HarvestTitle({super.key, required this.harvestTab});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            harvestTab.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Icon(
            harvestTab.icon,
            size: size.width * .08,
          )
        ],
      ),
    );
  }
}
