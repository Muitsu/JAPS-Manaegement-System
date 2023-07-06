import 'package:flutter/material.dart';
import 'package:japs/pages/harvesting/harvest_add_gang.dart';
import 'package:japs/pages/harvesting/harvest_provider.dart';
import 'package:japs/widgets/custom_transition.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../data/repository/local_db_repo.dart';
import '../../widgets/custom_snackbar.dart';
import '../home/home_provider.dart';

class HarvestHome extends StatefulWidget {
  final String? fieldno;
  final int? id;
  const HarvestHome({super.key, this.fieldno, this.id});

  @override
  State<HarvestHome> createState() => _HarvestHomeState();
}

class _HarvestHomeState extends State<HarvestHome> {
  TextEditingController dialogCtrl = TextEditingController();
  TextEditingController fieldNoCtrl = TextEditingController();
  late HarvestProvider harvestProvider;
  late HomeProvier homeProvier;
  @override
  void initState() {
    super.initState();
    harvestProvider = Provider.of<HarvestProvider>(context, listen: false);
    homeProvier = Provider.of<HomeProvier>(context, listen: false);
    harvestProvider.fetchGangList(id: widget.id!);
    fieldNoCtrl.text = widget.fieldno!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AssetsColor.geryColor,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Harvesting ',
              style: TextStyle(fontSize: 16),
            ),
            const Text('( '),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.3,
                minWidth: 40,
              ),
              child: IntrinsicWidth(
                child: TextFormField(
                  // readOnly: true,
                  textAlign: TextAlign.center,
                  controller: fieldNoCtrl,
                  decoration: const InputDecoration(hintText: 'Field No.'),
                ),
              ),
            ),
            const Text(' )'),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                LocalDBRepo().deleteHarvester(id: widget.id!).then((value) {
                  homeProvier.fetchUpkeepList();
                  homeProvier.fetchHarvesterList();
                  Navigator.pop(context);
                });
              },
              icon: const Icon(Icons.delete)),
          IconButton(
              onPressed: () {
                LocalDBRepo()
                    .updateHarvester(id: widget.id!, fieldNo: fieldNoCtrl.text)
                    .then((value) {
                  homeProvier.fetchHarvesterList();
                  CustomSnackbar.showSuccessUpdate(context,
                      message: 'Successful Update');
                });
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: context.watch<HarvestProvider>().gangList.isEmpty
          ? Column(
              children: [_addGang()],
            )
          : ListView.builder(
              itemCount: context.watch<HarvestProvider>().gangList.length + 1,
              itemBuilder: (context, index) {
                if (index == context.watch<HarvestProvider>().gangList.length) {
                  return _addGang();
                } else {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              CustomPageTransition.slideToPage(
                                  page: HarvestAddgang(
                                    fieldNo: widget.fieldno,
                                    model: context
                                        .read<HarvestProvider>()
                                        .gangList[index],
                                    gangNo: context
                                        .read<HarvestProvider>()
                                        .gangList[index]
                                        .gangNo,
                                    id: widget.id!,
                                    isEdit: true,
                                  ),
                                  slide: SlideFrom.bottom));
                        },
                        title: Text(
                            'Gang No: ${context.watch<HarvestProvider>().gangList[index].gangNo}'),
                      ),
                      const Divider(
                        height: 0,
                        indent: 16,
                        endIndent: 16,
                      )
                    ],
                  );
                }
              }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black87)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total Workers',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              context.watch<HarvestProvider>().gangList.isEmpty
                  ? '0'
                  : _countTotal(context),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AssetsColor.darkGreen),
            )
          ],
        ),
      ),
    );
  }

  _countTotal(BuildContext context) {
    int result = 0;
    for (var model in context.watch<HarvestProvider>().gangList) {
      int cutter = _convertToNum(model.noCutter!);
      int harv = _convertToNum(model.noHarvester!);
      result = result + cutter + harv;
    }
    return result.toString();
  }

  _convertToNum(String num) {
    return num.trim().replaceAll(' ', '').isEmpty
        ? 0
        : int.parse(num.trim().replaceAll(' ', ''));
  }

  _addGang() {
    return Column(
      children: [
        ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Which Gang you wanted to manage?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.3,
                                  minWidth: 100,
                                ),
                                child: IntrinsicWidth(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    controller: dialogCtrl,
                                    decoration: const InputDecoration(
                                        hintText: 'Gang No.'),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              FloatingActionButton.extended(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      CustomPageTransition.slideToPage(
                                          page: HarvestAddgang(
                                            fieldNo: widget.fieldno,
                                            gangNo: dialogCtrl.text,
                                            id: widget.id!,
                                            isEdit: false,
                                          ),
                                          slide: SlideFrom.bottom));
                                  dialogCtrl.clear();
                                },
                                elevation: 0.6,
                                label: const Icon(Icons.arrow_forward),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
                });
          },
          title: const Text('Add Gang'),
          trailing: const Icon(Icons.add),
        ),
        const Divider(
          height: 0,
          indent: 16,
          endIndent: 16,
        )
      ],
    );
  }
}
