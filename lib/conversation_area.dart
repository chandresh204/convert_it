import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_widgets/widget_unit_row.dart';

import 'constants.dart';

class ConversationArea extends StatefulWidget {
  const ConversationArea({Key? key}) : super(key: key);

  @override
  State<ConversationArea> createState() => _ConversationAreaState();
}

class _ConversationAreaState extends State<ConversationArea>
  with SingleTickerProviderStateMixin {

  List<Tab> tabs = [];
  double unitSqCm = 0.0;
  double unitSqIn = 0.0;
  double unitSqMeter = 0.0;
  double unitSqFoot = 0.0;
  double unitSqYard = 0.0;
  double unitSqKm = 0.0;
  double unitSqMile = 0.0;
  double unitHectare = 0.0;
  double unitAcre = 0.0;

  @override
  void initState() {
    tabs.clear();
    tabs.add(const Tab(text: 'Small'));
    tabs.add(const Tab(text: 'Normal'));
    tabs.add(const Tab(text: 'Large'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: Builder(builder: (context) {
            SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              )
            );
            return Column(
              children: [
                _myAppBar(),
                Expanded(child: _tabBarView())
              ],
            );
          },
        )
      ),
    );
  }

  Widget _myAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: Constants.constAppBarTopPadding,
          bottom: Constants.constAppBarBottomPadding),
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.green)],
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.greenAccent,
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
            const Text('Area', style: TextStyle(fontSize: Constants.appBarFontSize, color: Colors.white),)
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
          switch(e.text) {
            case 'Small' : {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UnitRowWidget(
                        result: unitSqCm,
                        conversationValue: 0.0001,
                        color1: Colors.green,
                        color2: Colors.greenAccent,
                        isLightColors: false,
                        unitTitle: 'Sq.Cm',
                        updateParent: updateAllValues),
                    Container(
                      height: 20,
                    ),
                    UnitRowWidget(
                        result: unitSqIn,
                        conversationValue: 0.00064516,
                        color1: Colors.green,
                        color2: Colors.greenAccent,
                        isLightColors: false,
                        unitTitle: 'Sq.In',
                        updateParent: updateAllValues),
                  ],
                ),
              );
            }
            case 'Normal': {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UnitRowWidget(
                        result: unitSqMeter,
                        conversationValue: 1,
                        color1: Colors.green,
                        color2: Colors.greenAccent,
                        isLightColors: false,
                        unitTitle: 'Sq.Meter',
                        updateParent: updateAllValues),
                    Container(
                      height: 20,
                    ),
                    UnitRowWidget(
                        result: unitSqFoot,
                        conversationValue: 0.092903,
                        color1: Colors.green,
                        color2: Colors.greenAccent,
                        isLightColors: false,
                        unitTitle: 'Sq.Foot',
                        updateParent: updateAllValues),
                    Container(
                      height: 20,
                    ),
                    UnitRowWidget(
                        result: unitSqYard,
                        conversationValue: 0.8361,
                        color1: Colors.green,
                        color2: Colors.greenAccent,
                        isLightColors: false,
                        unitTitle: 'Sq.Yard',
                        updateParent: updateAllValues)
                  ],
                ),
              );
            }
            case 'Large' : {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UnitRowWidget(
                        result: unitSqKm,
                        conversationValue: 1000000,
                        color1: Colors.green,
                        color2: Colors.greenAccent,
                        isLightColors: false,
                        unitTitle: 'Sq.Km',
                        updateParent: updateAllValues),
                    Container(
                      height: 20,
                    ),
                    UnitRowWidget(
                        result: unitSqMile,
                        conversationValue: 2589988,
                        color1: Colors.green,
                        color2: Colors.greenAccent,
                        isLightColors: false,
                        unitTitle: 'Sq.Mile',
                        updateParent: updateAllValues),
                    Container(
                      height: 20,
                    ),
                    UnitRowWidget(
                        result: unitHectare,
                        conversationValue: 10000,
                        color1: Colors.green,
                        color2: Colors.greenAccent,
                        isLightColors: false,
                        unitTitle: 'Hectare',
                        updateParent: updateAllValues),
                    Container(
                      height: 20,
                    ),
                    UnitRowWidget(
                        result: unitAcre,
                        conversationValue: 4046.8564,
                        color1: Colors.green,
                        color2: Colors.greenAccent,
                        isLightColors: false,
                        unitTitle: 'Acre',
                        updateParent: updateAllValues)
                  ],
                ),
              );
            }
            default: {
              return Container();
            }
          }
        }).toList());
  }

  updateAllValues(double sqMeter) {
    unitSqMeter = sqMeter;
    unitSqCm = sqMeter * 10000;
    unitSqIn = sqMeter * 1550.003;
    unitSqFoot = sqMeter * 10.7639;
    unitSqYard = sqMeter * 1.196;
    unitSqKm = sqMeter / 1000000;
    unitSqMile = sqMeter / 2589988;
    unitHectare = sqMeter / 10000;
    unitAcre = sqMeter / 4046.8564;
    setState(() { });
  }
}
