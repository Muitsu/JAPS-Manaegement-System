import 'package:flutter/material.dart';
import 'package:japs/constants/home_constant.dart';
import 'package:japs/data/repository/local_db_repo.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController pc = PageController();
  final screens = HomeConstant.values;
  int currPage = 0;
  @override
  void initState() {
    super.initState();
    LocalDBRepo().upkeepHasData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pc,
        children: List.generate(screens.length, (index) => screens[index].page),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          pc.jumpToPage(index);
          setState(() => currPage = index);
        },
        selectedIndex: currPage,
        destinations: <NavigationDestination>[
          ...List.generate(
            screens.length,
            (index) => NavigationDestination(
              selectedIcon: screens[index].selectedIcon,
              icon: screens[index].icon,
              label: screens[index].name,
            ),
          ),
        ],
      ),
    );
  }
}
