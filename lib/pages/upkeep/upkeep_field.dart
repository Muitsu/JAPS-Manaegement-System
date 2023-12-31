import 'package:flutter/material.dart';
import 'package:japs/pages/upkeep/upkeep_home.dart';

class UpkeepField extends StatefulWidget {
  const UpkeepField({super.key});

  @override
  State<UpkeepField> createState() => _UpkeepFieldState();
}

class _UpkeepFieldState extends State<UpkeepField> {
  TextEditingController ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upkeep'),
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpkeepHome(
                                  fieldno: ctrl.text,
                                )));
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
