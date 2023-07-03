import 'package:flutter/material.dart';
import 'package:japs/constants/color_constants.dart';
import 'package:japs/constants/upkeep_constants.dart';
import 'package:japs/data/repository/local_db_repo.dart';
import 'package:japs/data/repository/upkeep_model.dart';
import 'package:japs/pages/upkeep/upkeep_title.dart';
import 'package:japs/widgets/custom_snackbar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../widgets/section_container.dart';
import '../home/home_provider.dart';

class UpkeepHome extends StatefulWidget {
  final String? fieldno;
  final UpkeepModel? upkeepModel;
  final bool isEdit;
  const UpkeepHome(
      {super.key, this.fieldno, this.isEdit = false, this.upkeepModel});

  @override
  State<UpkeepHome> createState() => _UpkeepHomeState();
}

class _UpkeepHomeState extends State<UpkeepHome> {
  final upkeepTabs = UpkeepTab.values;
  final mTypeFertilizer = MTypeFerti.values;
  final mMethod = MMethod.values;
  final sTypeChemi = STypeChemi.values;
  final sMethod = SMethod.values;
  final wType = WType.values;
  final pType = PType.values;
  final pMethod = PMethod.values;
  final formDate = 'Date: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}';
  final fieldNoCtrl = TextEditingController();
  //
  final manuFertTypeCtrl = TextEditingController();
  MTypeFerti? manuTypeFert;
  final manuNoWorkersCtrl = TextEditingController();
  final manuNoTracDriverCtrl = TextEditingController();
  final manuPrestMandorCtrl = TextEditingController(text: '0');
  final manuMethodCtrl = TextEditingController();
  MMethod? manuMethod;
  final manuHectCoverTargetCtrl = TextEditingController();
  final manuTotIssueBagCtrl = TextEditingController();
  final manuHectCoverActCtrl = TextEditingController();
  //
  final sprayChecmiTypeCtrl = TextEditingController();
  STypeChemi? sprayChemi;
  final sprayNoWorkersCtrl = TextEditingController();
  final sprayNoTracDriverCtrl = TextEditingController();
  final sprayPrestMandorCtrl = TextEditingController(text: '0');
  final sprayMethodCtrl = TextEditingController();
  SMethod? sprayMethod;
  final sprayHectCoverTargetCtrl = TextEditingController();
  final sprayHectCoverActCtrl = TextEditingController();
  //
  final weedTypeCtrl = TextEditingController();
  WType? weedtype;
  final weedNoWorkersCtrl = TextEditingController();
  final weedNoTracDriverCtrl = TextEditingController();
  final weedPrestMandorCtrl = TextEditingController(text: '0');
  final weedHectCoverTargetCtrl = TextEditingController();
  final weedHectCoverActCtrl = TextEditingController();
  //
  final pndTypeCtrl = TextEditingController();
  PType? pndtype;
  final pndNoWorkersCtrl = TextEditingController();
  final pndNoTracDriverCtrl = TextEditingController();
  final pndPrestMandorCtrl = TextEditingController(text: '0');
  final pndChemiCtrl = TextEditingController();
  PMethod? pndChemi;
  final pndHectCoverTargetCtrl = TextEditingController();
  final pndHectCoverActCtrl = TextEditingController();
  //
  int totalWorkers = 0;
  late HomeProvier homeProvier;
  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      _initializeVariable();
    } else {
      if (widget.fieldno != null) {
        fieldNoCtrl.text = widget.fieldno!;
      }
    }
    homeProvier = Provider.of(context, listen: false);
    _calcTotWorkers();
  }

  int _convertToNum(String num) {
    if (num.isEmpty) {
      return 0;
    }
    return int.parse(num);
  }

  _calcTotWorkers() {
    var manurWorkers = _convertToNum(manuNoWorkersCtrl.text);
    var sprayWorkers = _convertToNum(sprayNoWorkersCtrl.text);
    var weedWorkers = _convertToNum(weedNoWorkersCtrl.text);
    var pndWorkers = _convertToNum(pndNoWorkersCtrl.text);
    setState(() =>
        totalWorkers = manurWorkers + sprayWorkers + weedWorkers + pndWorkers);
  }

  _saveUpkeepData() {
    LocalDBRepo()
        .insertUpkeep(
            upkeepModel: UpkeepModel(
      fieldNo: fieldNoCtrl.text,
      manuFertType: manuFertTypeCtrl.text,
      manuNoWorkers: manuNoWorkersCtrl.text,
      manuNoTracDriver: manuNoTracDriverCtrl.text,
      manuPrestMandor: manuPrestMandorCtrl.text,
      manuMethod: manuMethodCtrl.text,
      manuHectCoverTarget: manuHectCoverTargetCtrl.text,
      manuTotIssueBag: manuTotIssueBagCtrl.text,
      manuHectCoverAct: manuHectCoverActCtrl.text,
      sprayChecmiType: sprayChecmiTypeCtrl.text,
      sprayNoWorkers: sprayNoWorkersCtrl.text,
      sprayNoTracDriver: sprayNoTracDriverCtrl.text,
      sprayPrestMandor: sprayPrestMandorCtrl.text,
      sprayMethod: sprayMethodCtrl.text,
      sprayHectCoverTarget: sprayHectCoverTargetCtrl.text,
      sprayHectCoverAct: sprayHectCoverActCtrl.text,
      weedType: weedTypeCtrl.text,
      weedNoWorkers: weedNoWorkersCtrl.text,
      weedNoTracDriver: weedNoTracDriverCtrl.text,
      weedPrestMandor: weedPrestMandorCtrl.text,
      weedHectCoverTarget: weedHectCoverTargetCtrl.text,
      weedHectCoverAct: weedHectCoverActCtrl.text,
      pndType: pndTypeCtrl.text,
      pndNoWorkers: pndNoWorkersCtrl.text,
      pndNoTracDriver: pndNoTracDriverCtrl.text,
      pndPrestMandor: pndPrestMandorCtrl.text,
      pndChemi: pndChemiCtrl.text,
      pndHectCoverTarget: pndHectCoverTargetCtrl.text,
      pndHectCoverAct: pndHectCoverActCtrl.text,
      date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
      createdDate: DateTime.now().toString(),
      updatedDate: DateTime.now().toString(),
    ))
        .then((value) {
      homeProvier.fetchUpkeepList();
      Navigator.pop(context);
      Navigator.pop(context);
      CustomSnackbar.showSuccess(context, message: 'Successful Save');
    });
  }

  _initializeVariable() {
    UpkeepModel model = widget.upkeepModel!;
    fieldNoCtrl.text = model.fieldNo!;
    manuFertTypeCtrl.text = model.manuFertType!;
    manuTypeFert;
    //
    manuNoWorkersCtrl.text = model.manuNoWorkers!;
    manuNoTracDriverCtrl.text = model.manuNoTracDriver!;
    manuPrestMandorCtrl.text = model.manuPrestMandor!;
    manuMethodCtrl.text = model.manuMethod!;
    manuMethod;
    //
    manuHectCoverTargetCtrl.text = model.manuHectCoverTarget!;
    manuTotIssueBagCtrl.text = model.manuTotIssueBag!;
    manuHectCoverActCtrl.text = model.manuHectCoverAct!;
    //
    sprayChecmiTypeCtrl.text = model.sprayChecmiType!;
    sprayChemi;
    //
    sprayNoWorkersCtrl.text = model.sprayNoTracDriver!;
    sprayNoTracDriverCtrl.text = model.sprayNoTracDriver!;
    sprayPrestMandorCtrl.text = model.sprayPrestMandor!;
    sprayMethodCtrl.text = model.sprayMethod!;
    sprayMethod;
    //
    sprayHectCoverTargetCtrl.text = model.sprayHectCoverTarget!;
    sprayHectCoverActCtrl.text = model.sprayHectCoverAct!;
    //
    weedTypeCtrl.text = model.weedType!;
    weedtype;
    //
    weedNoWorkersCtrl.text = model.weedNoWorkers!;
    weedNoTracDriverCtrl.text = model.weedNoTracDriver!;
    weedPrestMandorCtrl.text = model.weedPrestMandor!;
    weedHectCoverTargetCtrl.text = model.weedHectCoverTarget!;
    weedHectCoverActCtrl.text = model.weedHectCoverAct!;
    //
    pndTypeCtrl.text = model.pndType!;
    pndtype;
    //
    pndNoWorkersCtrl.text = model.pndNoWorkers!;
    pndNoTracDriverCtrl.text = model.pndNoTracDriver!;
    pndPrestMandorCtrl.text = model.pndPrestMandor!;
    pndChemiCtrl.text = model.pndChemi!;
    pndChemi;
    //
    pndHectCoverTargetCtrl.text = model.pndHectCoverTarget!;
    pndHectCoverActCtrl.text = model.pndHectCoverAct!;
    //
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: upkeepTabs.length,
      child: Scaffold(
        backgroundColor: AssetsColor.geryColor,
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Upkeep '),
              const Text('( '),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.3,
                  minWidth: 40,
                ),
                child: IntrinsicWidth(
                  child: TextFormField(
                    controller: fieldNoCtrl,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: 'Field No.'),
                  ),
                ),
              ),
              const Text(' )'),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  if (widget.isEdit) {
                    LocalDBRepo()
                        .updateUpkeep(
                            model: widget.upkeepModel!.copyWith(
                          fieldNo: fieldNoCtrl.text,
                          manuFertType: manuFertTypeCtrl.text,
                          manuNoWorkers: manuNoWorkersCtrl.text,
                          manuNoTracDriver: manuNoTracDriverCtrl.text,
                          manuPrestMandor: manuPrestMandorCtrl.text,
                          manuMethod: manuMethodCtrl.text,
                          manuHectCoverTarget: manuHectCoverTargetCtrl.text,
                          manuTotIssueBag: manuTotIssueBagCtrl.text,
                          manuHectCoverAct: manuHectCoverActCtrl.text,
                          sprayChecmiType: sprayChecmiTypeCtrl.text,
                          sprayNoWorkers: sprayNoWorkersCtrl.text,
                          sprayNoTracDriver: sprayNoTracDriverCtrl.text,
                          sprayPrestMandor: sprayPrestMandorCtrl.text,
                          sprayMethod: sprayMethodCtrl.text,
                          sprayHectCoverTarget: sprayHectCoverTargetCtrl.text,
                          sprayHectCoverAct: sprayHectCoverActCtrl.text,
                          weedType: weedTypeCtrl.text,
                          weedNoWorkers: weedNoWorkersCtrl.text,
                          weedNoTracDriver: weedNoTracDriverCtrl.text,
                          weedPrestMandor: weedPrestMandorCtrl.text,
                          weedHectCoverTarget: weedHectCoverTargetCtrl.text,
                          weedHectCoverAct: weedHectCoverActCtrl.text,
                          pndType: pndTypeCtrl.text,
                          pndNoWorkers: pndNoWorkersCtrl.text,
                          pndNoTracDriver: pndNoTracDriverCtrl.text,
                          pndPrestMandor: pndPrestMandorCtrl.text,
                          pndChemi: pndChemiCtrl.text,
                          pndHectCoverTarget: pndHectCoverTargetCtrl.text,
                          pndHectCoverAct: pndHectCoverActCtrl.text,
                          updatedDate: DateTime.now().toString(),
                        ))
                        .then((value) => homeProvier.fetchUpkeepList());

                    CustomSnackbar.showSuccessUpdate(context,
                        message: 'Successful Update');
                  } else {
                    _saveUpkeepData();
                  }
                },
                icon: const Icon(Icons.save))
          ],
          bottom: TabBar(
              tabs: List.generate(
                  upkeepTabs.length,
                  (index) => Tab(
                          icon: Text(
                        upkeepTabs[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )))),
        ),
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _manuringForm(context),
              _sprayingForm(context),
              _weedingForm(context),
              _pndForm(context),
            ]),
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
                totalWorkers.toString(),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AssetsColor.darkGreen),
              )
            ],
          ),
        ),
      ),
    );
  }

  _manuringForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UpkeepTitle(upkeepTab: UpkeepTab.manuring),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(formDate),
          ),
          SectionContainer(
            title: 'Fertilizer Type',
            child: TextFormField(
              controller: manuFertTypeCtrl,
              readOnly: true,
              decoration: const InputDecoration(hintText: 'Choose type'),
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
                            mTypeFertilizer.length,
                            (index) => RadioListTile(
                              activeColor: Theme.of(context).primaryColor,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(mTypeFertilizer[index].name),
                              value: mTypeFertilizer[index],
                              groupValue: manuTypeFert,
                              onChanged: (value) {
                                Navigator.pop(context);
                                setState(() {
                                  manuTypeFert = value;
                                  manuFertTypeCtrl.text = value!.name;
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
            title: 'No. of Workers',
            child: TextFormField(
              controller: manuNoWorkersCtrl,
              onChanged: (value) => _calcTotWorkers(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10'),
            ),
          ),
          SectionContainer(
            title: 'No. of Tractor Drivers',
            child: TextFormField(
              controller: manuNoTracDriverCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 2'),
            ),
          ),
          SectionContainer(
            title: 'Present of Mandor',
            child: Row(
              children: [
                Row(
                  children: [
                    const Text('No'),
                    Radio<int>(
                      value: 0,
                      groupValue: _convertToNum(manuPrestMandorCtrl.text),
                      onChanged: (int? value) {
                        setState(
                            () => manuPrestMandorCtrl.text = value.toString());
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Yes'),
                    Radio<int>(
                      value: 1,
                      groupValue: _convertToNum(manuPrestMandorCtrl.text),
                      onChanged: (int? value) {
                        setState(
                            () => manuPrestMandorCtrl.text = value.toString());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SectionContainer(
            title: 'Manuring Method',
            child: TextFormField(
              controller: manuMethodCtrl,
              readOnly: true,
              decoration: const InputDecoration(hintText: 'Choose method'),
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
                            mMethod.length,
                            (index) => RadioListTile(
                              activeColor: Theme.of(context).primaryColor,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(mMethod[index].name),
                              value: mMethod[index],
                              groupValue: manuMethod,
                              onChanged: (value) {
                                Navigator.pop(context);
                                setState(() {
                                  manuMethod = value;
                                  manuMethodCtrl.text = value!.name;
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
            title: 'Hectare Coverage Target',
            child: TextFormField(
              controller: manuHectCoverTargetCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10.1'),
            ),
          ),
          SectionContainer(
            title: 'Total Issue Bag',
            child: TextFormField(
              controller: manuTotIssueBagCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10'),
            ),
          ),
          SectionContainer(
            title: 'Hectare Coverage Actual',
            child: TextFormField(
              controller: manuHectCoverActCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10.1'),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  _sprayingForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UpkeepTitle(upkeepTab: UpkeepTab.spraying),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(formDate),
          ),
          SectionContainer(
            title: 'Chemical Type',
            child: TextFormField(
              controller: sprayChecmiTypeCtrl,
              readOnly: true,
              decoration: const InputDecoration(hintText: 'Choose type'),
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
                            sTypeChemi.length,
                            (index) => RadioListTile(
                              activeColor: Theme.of(context).primaryColor,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(sTypeChemi[index].name),
                              value: sTypeChemi[index],
                              groupValue: sprayChemi,
                              onChanged: (value) {
                                Navigator.pop(context);
                                setState(() {
                                  sprayChemi = value!;
                                  sprayChecmiTypeCtrl.text = value.name;
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
            title: 'No. of Workers',
            child: TextFormField(
              controller: sprayNoWorkersCtrl,
              onChanged: (value) => _calcTotWorkers(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10'),
            ),
          ),
          SectionContainer(
            title: 'No. of Tractor Drivers',
            child: TextFormField(
              controller: sprayNoTracDriverCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 2'),
            ),
          ),
          SectionContainer(
            title: 'Present of Mandor',
            child: Row(
              children: [
                Row(
                  children: [
                    const Text('No'),
                    Radio<int>(
                      value: 0,
                      groupValue: _convertToNum(sprayPrestMandorCtrl.text),
                      onChanged: (int? value) {
                        setState(
                            () => sprayPrestMandorCtrl.text = value.toString());
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Yes'),
                    Radio<int>(
                      value: 1,
                      groupValue: _convertToNum(sprayPrestMandorCtrl.text),
                      onChanged: (int? value) {
                        setState(
                            () => sprayPrestMandorCtrl.text = value.toString());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SectionContainer(
            title: 'Spraying Method',
            child: TextFormField(
              controller: sprayMethodCtrl,
              readOnly: true,
              decoration: const InputDecoration(hintText: 'Choose method'),
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
                            sMethod.length,
                            (index) => RadioListTile(
                              activeColor: Theme.of(context).primaryColor,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(sMethod[index].name),
                              value: sMethod[index],
                              groupValue: sprayMethod,
                              onChanged: (value) {
                                Navigator.pop(context);
                                setState(() {
                                  sprayMethod = value;
                                  sprayMethodCtrl.text = value!.name;
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
            title: 'Hectare Coverage Target',
            child: TextFormField(
              controller: sprayHectCoverTargetCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10.1'),
            ),
          ),
          SectionContainer(
            title: 'Hectare Coverage Actual',
            child: TextFormField(
              controller: sprayHectCoverActCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10.1'),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  _weedingForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UpkeepTitle(upkeepTab: UpkeepTab.weeding),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(formDate),
          ),
          SectionContainer(
            title: 'Weeding Type',
            child: TextFormField(
              controller: weedTypeCtrl,
              readOnly: true,
              decoration: const InputDecoration(hintText: 'Choose type'),
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
                            wType.length,
                            (index) => RadioListTile(
                              activeColor: Theme.of(context).primaryColor,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(wType[index].name),
                              value: wType[index],
                              groupValue: weedtype,
                              onChanged: (value) {
                                Navigator.pop(context);
                                setState(() {
                                  weedtype = value;
                                  weedTypeCtrl.text = value!.name;
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
            title: 'No. of Workers',
            child: TextFormField(
              controller: weedNoWorkersCtrl,
              onChanged: (value) => _calcTotWorkers(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10'),
            ),
          ),
          SectionContainer(
            title: 'No. of Tractor Drivers',
            child: TextFormField(
              controller: weedNoTracDriverCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 2'),
            ),
          ),
          SectionContainer(
            title: 'Present of Mandor',
            child: Row(
              children: [
                Row(
                  children: [
                    const Text('No'),
                    Radio<int>(
                      value: 0,
                      groupValue: _convertToNum(weedPrestMandorCtrl.text),
                      onChanged: (int? value) {
                        setState(
                            () => weedPrestMandorCtrl.text = value.toString());
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Yes'),
                    Radio<int>(
                      value: 1,
                      groupValue: _convertToNum(weedPrestMandorCtrl.text),
                      onChanged: (int? value) {
                        setState(
                            () => weedPrestMandorCtrl.text = value.toString());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SectionContainer(
            title: 'Hectare Coverage Target',
            child: TextFormField(
              controller: weedHectCoverTargetCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10.1'),
            ),
          ),
          SectionContainer(
            title: 'Hectare Coverage Actual',
            child: TextFormField(
              controller: weedHectCoverActCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10.1'),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  _pndForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UpkeepTitle(upkeepTab: UpkeepTab.pnd),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(formDate),
          ),
          SectionContainer(
            title: 'PnD Type',
            child: TextFormField(
              controller: pndTypeCtrl,
              readOnly: true,
              decoration: const InputDecoration(hintText: 'Choose type'),
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
                            pType.length,
                            (index) => RadioListTile(
                              activeColor: Theme.of(context).primaryColor,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(pType[index].name),
                              value: pType[index],
                              groupValue: pndtype,
                              onChanged: (value) {
                                Navigator.pop(context);
                                setState(() {
                                  pndtype = value;
                                  pndTypeCtrl.text = value!.name;
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
            title: 'No. of Workers',
            child: TextFormField(
              controller: pndNoWorkersCtrl,
              onChanged: (value) => _calcTotWorkers(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10'),
            ),
          ),
          SectionContainer(
            title: 'No. of Tractor Drivers',
            child: TextFormField(
              controller: pndNoTracDriverCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 2'),
            ),
          ),
          SectionContainer(
            title: 'Present of Mandor',
            child: Row(
              children: [
                Row(
                  children: [
                    const Text('No'),
                    Radio<int>(
                      value: 0,
                      groupValue: _convertToNum(pndPrestMandorCtrl.text),
                      onChanged: (int? value) {
                        setState(
                            () => pndPrestMandorCtrl.text = value!.toString());
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Yes'),
                    Radio<int>(
                      value: 1,
                      groupValue: _convertToNum(pndPrestMandorCtrl.text),
                      onChanged: (int? value) {
                        setState(
                            () => pndPrestMandorCtrl.text = value!.toString());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SectionContainer(
            title: 'Chemical Used',
            child: TextFormField(
              readOnly: true,
              controller: pndChemiCtrl,
              decoration: const InputDecoration(hintText: 'Choose chemical'),
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
                            pMethod.length,
                            (index) => RadioListTile(
                              activeColor: Theme.of(context).primaryColor,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(pMethod[index].name),
                              value: pMethod[index],
                              groupValue: pndChemi,
                              onChanged: (value) {
                                Navigator.pop(context);
                                setState(() {
                                  pndChemi = value;
                                  pndChemiCtrl.text = value!.name;
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
            title: 'Hectare Coverage Target',
            child: TextFormField(
              controller: pndHectCoverTargetCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10.1'),
            ),
          ),
          SectionContainer(
            title: 'Hectare Coverage Actual',
            child: TextFormField(
              controller: pndHectCoverActCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Eg: 10.1'),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
