import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:japs/data/repository/harvester_model.dart';
import 'package:japs/data/repository/local_db_repo.dart';
import 'package:japs/pages/harvesting/harvest_home.dart';
import 'package:provider/provider.dart';

import '../home/home_provider.dart';

class HarvestField extends StatefulWidget {
  const HarvestField({super.key});

  @override
  State<HarvestField> createState() => _HarvestFieldState();
}

class _HarvestFieldState extends State<HarvestField> {
  TextEditingController ctrl = TextEditingController();
  DateTime currDate = DateTime.now();
  late HomeProvier homeProvier;

  @override
  void initState() {
    super.initState();
    homeProvier = Provider.of(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harvesting'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close)),
      ),
      body: Column(
        children: [
          const Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16, top: 20, bottom: 30),
            child: Text(
              'Which Field you wanted to manage?',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.3,
                    minWidth: 60,
                  ),
                  child: IntrinsicWidth(
                    child: TextFormField(
                      controller: ctrl,
                      decoration:
                          const InputDecoration(hintText: 'Enter field No.'),
                    ),
                  ),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    LocalDBRepo()
                        .insertHarvester(
                            model: HarvesterModel(
                      fieldNo: ctrl.text,
                      date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
                      createdDate: currDate.toString(),
                      updatedDate: currDate.toString(),
                    ))
                        .then((value) {
                      homeProvier.fetchHarvesterList();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HarvestHome(
                                    id: value,
                                    fieldno: ctrl.text,
                                  )));
                    });
                  },
                  elevation: 0.6,
                  label: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
