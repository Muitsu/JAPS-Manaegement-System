import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:japs/data/repository/gang_model.dart';
import 'package:japs/data/repository/local_db_repo.dart';
import 'package:japs/pages/harvesting/harvest_provider.dart';
import 'package:japs/pages/harvesting/harvest_title.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../constants/harvesting_constants.dart';
import '../../widgets/custom_snackbar.dart';
import '../../widgets/section_container.dart';

class HarvestAddgang extends StatefulWidget {
  final String? gangNo;
  final int id;
  final bool isEdit;
  final GangModel? model;
  final String? fieldNo;
  const HarvestAddgang(
      {super.key,
      this.gangNo,
      this.fieldNo,
      this.model,
      required this.id,
      required this.isEdit});

  @override
  State<HarvestAddgang> createState() => _HarvestAddgangState();
}

class _HarvestAddgangState extends State<HarvestAddgang> {
  final noHvstrCtrl = TextEditingController();
  final noCutterCtrl = TextEditingController();
  final evitMethodCtrl = TextEditingController();
  final targetMtCtrl = TextEditingController();
  final balMtTodayCtrl = TextEditingController();
  final balMtPrevCtrl = TextEditingController();
  final totBinCtrl = TextEditingController();
  final cutTotHectCtrl = TextEditingController();
  final cutTotDisptCtrl = TextEditingController();
  final cutProdtCtrl = TextEditingController();
  final harvTotHectCtrl = TextEditingController();
  final harvTotDisptCtrl = TextEditingController();
  final harvProdtCtrl = TextEditingController();
  final harvestTab = HarvestingTab.values;
  final typeEvit = HarvestingTypeEvit.values;
  var currEvit = HarvestingTypeEvit.values[0];
  final formDate = 'Date: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}';

  _calcProd() {
    //(Tonnage dispatch + balance today - balance previous day) ÷ cutter/ harvester
    _cutterProd();
    _harvestProd();
  }

  _cutterProd() {
    var tonDisp = _convertToNum(cutTotDisptCtrl.text);
    var balToday = _convertToNum(balMtTodayCtrl.text);
    var balPrev = _convertToNum(balMtPrevCtrl.text);
    var noCutter = _convertToNum(noCutterCtrl.text);
    var noHarvest = _convertToNum(noHvstrCtrl.text);
    double calc = (tonDisp + balToday - balPrev) / (noCutter / noHarvest);

    setState(() => cutProdtCtrl.text = calc.toString());
  }

  _harvestProd() {
    var tonDisp = _convertToNum(harvTotDisptCtrl.text);
    var balToday = _convertToNum(balMtTodayCtrl.text);
    var balPrev = _convertToNum(balMtPrevCtrl.text);
    var noCutter = _convertToNum(noCutterCtrl.text);
    var noHarvest = _convertToNum(noHvstrCtrl.text);
    double calc = (tonDisp + balToday - balPrev) / (noCutter / noHarvest);

    setState(() => harvProdtCtrl.text = calc.toString());
  }

  double _convertToNum(String num) {
    String before = num.trim().replaceAll(' ', '');
    double result = 0;
    if (before.isEmpty) {
      result = 0;
    } else {
      try {
        result = double.parse(before);
      } catch (e) {
        result = double.parse(before);
      }
    }
    return result;
  }

  _saveData() {
    LocalDBRepo()
        .insertGang(
            model: GangModel(
                harvesterId: widget.id,
                gangNo: widget.gangNo,
                noHarvester: noHvstrCtrl.text,
                noCutter: noCutterCtrl.text,
                evitMethod: evitMethodCtrl.text,
                targetMt: targetMtCtrl.text,
                balanceMtToday: balMtTodayCtrl.text,
                balanceMtPrev: balMtPrevCtrl.text,
                totalBin: totBinCtrl.text,
                cutTotHect: cutTotHectCtrl.text,
                cutTotDispt: cutTotDisptCtrl.text,
                harvTotHect: harvTotHectCtrl.text,
                harvTotDispt: harvTotDisptCtrl.text))
        .then((value) {
      harvestProvider.fetchGangList(id: widget.id);
      Navigator.pop(context);
      CustomSnackbar.showSuccess(context, message: 'Successful Save');
    });
  }

  late HarvestProvider harvestProvider;
  @override
  void initState() {
    super.initState();
    harvestProvider = Provider.of<HarvestProvider>(context, listen: false);
    if (widget.isEdit) {
      GangModel model = widget.model!;
      noHvstrCtrl.text = model.noHarvester!;
      noCutterCtrl.text = model.noCutter!;
      evitMethodCtrl.text = model.evitMethod!;
      targetMtCtrl.text = model.targetMt!;
      balMtTodayCtrl.text = model.balanceMtToday!;
      balMtPrevCtrl.text = model.balanceMtPrev!;
      totBinCtrl.text = model.totalBin!;
      cutTotHectCtrl.text = model.cutTotHect!;
      cutTotDisptCtrl.text = model.cutTotDispt!;
      harvTotHectCtrl.text = model.harvTotHect!;
      harvTotDisptCtrl.text = model.harvTotDispt!;
      _calcProd();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: harvestTab.length,
      child: Scaffold(
        backgroundColor: AssetsColor.geryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close)),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Gang No. '),
              const Text('( '),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.3,
                  minWidth: 40,
                ),
                child: IntrinsicWidth(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: 'Gang No.'),
                    initialValue: widget.gangNo,
                  ),
                ),
              ),
              const Text(' )'),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  if (widget.isEdit) {
                    LocalDBRepo()
                        .updateGang(
                            model: widget.model!.copyWith(
                                harvesterId: widget.id,
                                gangNo: widget.gangNo,
                                noHarvester: noHvstrCtrl.text,
                                noCutter: noCutterCtrl.text,
                                evitMethod: evitMethodCtrl.text,
                                targetMt: targetMtCtrl.text,
                                balanceMtToday: balMtTodayCtrl.text,
                                balanceMtPrev: balMtPrevCtrl.text,
                                totalBin: totBinCtrl.text,
                                cutTotHect: cutTotHectCtrl.text,
                                cutTotDispt: cutTotDisptCtrl.text,
                                harvTotHect: harvTotHectCtrl.text,
                                harvTotDispt: harvTotDisptCtrl.text))
                        .then((value) {
                      harvestProvider.fetchGangList(id: widget.id);
                      CustomSnackbar.showSuccessUpdate(context,
                          message: 'Successful Update');
                    });
                  } else {
                    _saveData();
                  }
                },
                icon: const Icon(Icons.save))
          ],
          bottom: TabBar(
              tabs: List.generate(
                  harvestTab.length,
                  (index) => Tab(
                          icon: Text(
                        harvestTab[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )))),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HarvestTitle(harvestTab: HarvestingTab.harvester),
                // const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(formDate),
                ),
                SectionContainer(
                  title: 'No. of Harvester',
                  child: TextFormField(
                    controller: noHvstrCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Eg: 10'),
                    onChanged: (text) => _calcProd(),
                  ),
                ),
                SectionContainer(
                  title: 'No. of Cutter',
                  child: TextFormField(
                    controller: noCutterCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Eg: 10'),
                    onChanged: (text) => _calcProd(),
                  ),
                ),
                SectionContainer(
                  title: 'Evit Method',
                  child: TextFormField(
                    readOnly: true,
                    controller: evitMethodCtrl,
                    decoration:
                        const InputDecoration(hintText: 'Choose method'),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...List.generate(
                                  typeEvit.length,
                                  (index) => RadioListTile<HarvestingTypeEvit>(
                                    activeColor: Theme.of(context).primaryColor,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    title: Text(typeEvit[index].name),
                                    value: typeEvit[index],
                                    groupValue: currEvit,
                                    onChanged: (value) {
                                      Navigator.pop(context);
                                      setState(() {
                                        currEvit = value!;
                                        evitMethodCtrl.text = value.name;
                                      });
                                    },
                                  ),
                                )
                              ],
                            );
                          });
                    },
                  ),
                ),
                SectionContainer(
                  title: 'Target mt',
                  child: TextFormField(
                    controller: targetMtCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Eg: 10'),
                  ),
                ),
                SectionContainer(
                  title: 'Balance mt today',
                  child: TextFormField(
                    controller: balMtTodayCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Eg: 10'),
                  ),
                ),
                SectionContainer(
                  title: 'Balance mt previous day',
                  child: TextFormField(
                    controller: balMtPrevCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Eg: 10'),
                  ),
                ),
                SectionContainer(
                  title: 'Total bin',
                  child: TextFormField(
                    controller: totBinCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Eg: 10'),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HarvestTitle(harvestTab: HarvestingTab.monitoring),
                // const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(formDate),
                ),
                SectionContainer(
                    title: 'CUTTER',
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Hectare',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: cutTotHectCtrl,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: AssetsColor.geryColor,
                                    hintText: '0',
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Tonnage Dispatch',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: cutTotDisptCtrl,
                                onChanged: (text) => _calcProd(),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: AssetsColor.geryColor,
                                    hintText: '0',
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Productivity',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: cutProdtCtrl,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                readOnly: true,
                                decoration: const InputDecoration(
                                    hintText: '0', border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                SectionContainer(
                    title: 'HARVESTER',
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Hectare',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: harvTotHectCtrl,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: AssetsColor.geryColor,
                                    hintText: '0',
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Tonnage Dispatch',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: harvTotDisptCtrl,
                                onChanged: (text) => _calcProd(),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: AssetsColor.geryColor,
                                    hintText: '0',
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Productivity',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: harvProdtCtrl,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                readOnly: true,
                                decoration: const InputDecoration(
                                    hintText: '0', border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
