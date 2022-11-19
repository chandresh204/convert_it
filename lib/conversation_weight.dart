import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_widgets/widget_unit_row.dart';

import 'constants.dart';
import 'dialog_get_value.dart';

class ConversationWeight extends StatefulWidget {
  const ConversationWeight({Key? key}) : super(key: key);

  @override
  State<ConversationWeight> createState() => _ConversationWeightState();
}

class _ConversationWeightState extends State<ConversationWeight>
  with SingleTickerProviderStateMixin {

  late TabController _controller;
  late DialogGetValue _valueDialog;

  List<Tab> tabs = [];
  double unitGram = 0.0;
  double unitOunce = 0.0;
  double unitKg = 0.0;
  double unitPound = 0.0;
  double unitStone = 0.0;
  double unitTonne = 0.0;
  double unitUSTonne = 0.0;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    tabs.clear();
    tabs.add(const Tab(text: 'Small'));
    tabs.add(const Tab(text: 'Normal'));
    tabs.add(const Tab(text: 'Large'));
    _valueDialog = DialogGetValue(updateAllValues, null);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: tabs.length,
        child: Builder(builder: (context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });
          SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent
              )
          );
          return Scaffold(
            body: Column(
              children: [
                _myAppBar(),
                Expanded(
                  /*  child: TabBarView(
                    children: tabs.map((Tab tab) {
                      return Center(child: Text(tab.text.toString()),);
                    }).toList()),  */
                  child: _tabBarView(),
                )
              ],
            ),
          );
        }));
  }

  Widget _myAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: Constants.constAppBarTopPadding,
          bottom: Constants.constAppBarBottomPadding),
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.red)],
          gradient: LinearGradient(colors: [
            Colors.red,
            Colors.redAccent,
          ])),
      child: Column(children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white,)
            ),
            const Text('Weight', style: TextStyle(fontSize: Constants.appBarFontSize, color: Colors.white),)
          ],
        ),
        TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.values.last,
            tabs: tabs),
      ]),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
        children: tabs.map((e) {
          switch (e.text) {
            case 'Small':
              {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UnitRowWidget(
                          result: unitGram,
                          conversationValue: 0.001,
                          color1: Colors.red,
                          color2: Colors.redAccent,
                          isLightColors: false,
                          unitTitle: 'Gram',
                          updateParent: updateAllValues),
                      Container(
                        height: 20,
                      ),
                      UnitRowWidget(
                          result: unitOunce,
                          conversationValue: 0.0283,
                          color1: Colors.red,
                          color2: Colors.redAccent,
                          isLightColors: false,
                          unitTitle: 'Ounce',
                          updateParent: updateAllValues),
                    ],
                  ),
                );
              }
              break;
            case 'Normal':
              {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UnitRowWidget(
                          result: unitKg,
                          conversationValue: 1.0,
                          color1: Colors.red,
                          color2: Colors.redAccent,
                          isLightColors: false,
                          unitTitle: 'Kg',
                          updateParent: updateAllValues),
                      Container(height: 20),
                      UnitRowWidget(
                          result: unitPound,
                          conversationValue: 1 / 2.2046,
                          color1: Colors.red,
                          color2: Colors.redAccent,
                          isLightColors: false,
                          unitTitle: 'Pound',
                          updateParent: updateAllValues),
                      Container(height: 20,),
                      UnitRowWidget(
                          result: unitStone,
                          conversationValue: 6.3503,
                          color1: Colors.red,
                          color2: Colors.redAccent,
                          isLightColors: false,
                          unitTitle: 'Stone',
                          updateParent: updateAllValues),
                    ],
                  ),
                );
              }
              break;
            case 'Large':
              {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UnitRowWidget(
                          result: unitTonne,
                          conversationValue: 1000,
                          color1: Colors.red,
                          color2: Colors.redAccent,
                          isLightColors: false,
                          unitTitle: 'Tonne',
                          updateParent: updateAllValues),
                      Container(height: 20),
                      UnitRowWidget(
                          result: unitUSTonne,
                          conversationValue: 909.090909,
                          color1: Colors.red,
                          color2: Colors.redAccent,
                          isLightColors: false,
                          unitTitle: 'US TON',
                          updateParent: updateAllValues),
                    ],
                  ),
                );
              }
              break;
            default:
              {
                return Text(e.text.toString());
              }
          }
        }).toList());
  }

  updateAllValues(double kg) {
    unitKg = kg;
    unitGram = kg*1000;
    unitOunce = kg *35.274;
    unitPound = kg * 2.2046;
    unitStone = kg / 6.3503;
    unitTonne = kg / 1000;
    unitUSTonne = kg / 907.1858;
    setState(() { });
  }

}
