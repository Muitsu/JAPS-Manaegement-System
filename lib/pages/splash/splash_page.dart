import 'dart:async';

import 'package:flutter/material.dart';
import 'package:japs/data/repository/local_db_repo.dart';

import 'package:japs/pages/login/login_page.dart';
import 'package:provider/provider.dart';

import '../../constants/assets_bg.dart';
import '../../widgets/custom_transition.dart';
import '../home/home_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;
  late HomeProvier homeProvier;
  @override
  void initState() {
    super.initState();
    homeProvier = Provider.of(context, listen: false);
    _fetchData();
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, CustomPageTransition.fadeToPage(page: const LoginPage()));
    });
  }

  _fetchData() async {
    bool uHasData = await LocalDBRepo().upkeepHasData();
    bool hHasData = await LocalDBRepo().harvesterHasData();
    if (uHasData) {
      homeProvier.fetchUpkeepList();
    }
    if (hHasData) {
      homeProvier.fetchHarvesterList();
    }
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsBg.splash,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black12,
          ),
          const Center(
            child: Text(
              'JAPS.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
