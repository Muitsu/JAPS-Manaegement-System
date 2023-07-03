import 'package:flutter/material.dart';
import 'package:japs/constants/home_constant.dart';
import 'package:japs/pages/harvesting/harvest_home.dart';
import 'package:japs/pages/home/home_provider.dart';
import 'package:japs/pages/upkeep/upkeep_home.dart';
import 'package:japs/widgets/custom_transition.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formtype = HomeForm.values;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AssetsColor.primaryColor,
          automaticallyImplyLeading: false,
          title: const Text(
            'JAPS.',
            style: TextStyle(color: AssetsColor.darkGreen),
          ),
        ),
        body: context.watch<HomeProvier>().upkeepList.isEmpty &&
                context.watch<HomeProvier>().harvesterList.isEmpty
            ? _noDataView(context)
            : ListView(
                children: [
                  Visibility(
                    visible: context.watch<HomeProvier>().upkeepList.isNotEmpty,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 14, top: 22, bottom: 10),
                      child: Text(
                        'Upkeep',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  ...List.generate(
                    context.watch<HomeProvier>().upkeepList.length,
                    (index) => Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                CustomPageTransition.slideToPage(
                                    page: UpkeepHome(
                                      isEdit: true,
                                      upkeepModel: context
                                          .read<HomeProvier>()
                                          .upkeepList[index],
                                    ),
                                    slide: SlideFrom.right));
                          },
                          leading: Text(
                            '${index + 1}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          title: Text(
                              'Upkeep Field: ${context.watch<HomeProvier>().upkeepList[index].fieldNo!}'),
                          subtitle: Text(context
                              .watch<HomeProvier>()
                              .upkeepList[index]
                              .date!),
                        ),
                        const Divider(
                          height: 0,
                          indent: 40,
                          endIndent: 20,
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible:
                        context.watch<HomeProvier>().harvesterList.isNotEmpty,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 14, top: 30, bottom: 10),
                      child: Text(
                        'Harvesting',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  ...List.generate(
                    context.watch<HomeProvier>().harvesterList.length,
                    (index) => Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                CustomPageTransition.slideToPage(
                                    page: HarvestHome(
                                      id: context
                                          .read<HomeProvier>()
                                          .harvesterList[index]
                                          .id,
                                      fieldno: context
                                          .read<HomeProvier>()
                                          .harvesterList[index]
                                          .fieldNo,
                                    ),
                                    slide: SlideFrom.right));
                          },
                          leading: Text(
                            // '${context.read<HomeProvier>().upkeepList.length + index + 1}',
                            '${index + 1}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          title: Text(
                              'Harvester Field: ${context.watch<HomeProvier>().harvesterList[index].fieldNo!}'),
                          subtitle: Text(context
                              .watch<HomeProvier>()
                              .harvesterList[index]
                              .date!),
                        ),
                        const Divider(
                          height: 0,
                          indent: 40,
                          endIndent: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showFormSheet(context);
          },
          icon: const Icon(Icons.add),
          label: const Text('Add MC'),
          elevation: 0.5,
          backgroundColor: AssetsColor.primaryColor,
        ));
  }

  _noDataView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("No Master Chit found"),
          ElevatedButton(
              onPressed: () {
                _showFormSheet(context);
              },
              child: const Text('Create Now !'))
        ],
      ),
    );
  }

  _showFormSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: AssetsColor.geryColor,
        builder: (context) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(16), right: Radius.circular(16)),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: const Center(
                        child: Text(
                      'Select Form',
                      style: TextStyle(fontSize: 16),
                    )),
                  ),
                ),
                const Divider(height: 0, indent: 20, endIndent: 20),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          formtype.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CustomPageTransition.slideToPage(
                                          page: formtype[index].homePage,
                                          slide: SlideFrom.bottom));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.25,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                          child: Image.asset(
                                              formtype[index].iconImg)),
                                    ),
                                    Text(formtype[index].name)
                                  ],
                                ),
                              ))),
                )
              ],
            ),
          );
        });
  }
}
