import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'custom_widgets/widget_unit_row.dart';

class ConversionLength extends StatefulWidget {
  const ConversionLength({Key? key}) : super(key: key);

  @override
  State<ConversionLength> createState() => _ConversionLengthState();
}

class _ConversionLengthState extends State<ConversionLength>
    with TickerProviderStateMixin {

  List<Tab> tabs = [];
  double unitCm = 0.0;
  double unitIn = 0.0;
  double unitMeter = 0.0;
  double unitFoot = 0.0;
  double unitYard = 0.0;
  double unitKm = 0.0;
  double unitMile = 0.0;
  double unitNMile = 0.0;

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
    return DefaultTabController(
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
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.blue)],
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.lightBlueAccent,
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
            const Text('Length', style: TextStyle(fontSize: Constants.appBarFontSize, color: Colors.white),)
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
                          result: unitCm,
                          conversationValue: 0.01,
                          color1: Colors.blue,
                          color2: Colors.blueAccent,
                          isLightColors: false,
                          unitTitle: 'cm',
                          updateParent: updateAllValues),
                      Container(
                        height: 20,
                      ),
                      UnitRowWidget(
                          result: unitIn,
                          conversationValue: 0.0254,
                          color1: Colors.blue,
                          color2: Colors.blueAccent,
                          isLightColors: false,
                          unitTitle: 'inch',
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
                          result: unitMeter,
                          conversationValue: 1.0,
                          color1: Colors.blue,
                          color2: Colors.blueAccent,
                          isLightColors: false,
                          unitTitle: 'Meter',
                          updateParent: updateAllValues),
                      Container(height: 20),
                      UnitRowWidget(
                          result: unitFoot,
                          conversationValue: 0.3048,
                          color1: Colors.blue,
                          color2: Colors.blueAccent,
                          isLightColors: false,
                          unitTitle: 'Foot',
                          updateParent: updateAllValues),
                      Container(height: 20,),
                      UnitRowWidget(
                          result: unitYard,
                          conversationValue: 0.9144111,
                          color1: Colors.blue,
                          color2: Colors.blueAccent,
                          isLightColors: false,
                          unitTitle: 'Yard',
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
                          result: unitKm,
                          conversationValue: 1000,
                          color1: Colors.blue,
                          color2: Colors.blueAccent,
                          isLightColors: false,
                          unitTitle: 'Km',
                          updateParent: updateAllValues),
                      Container(height: 20),
                      UnitRowWidget(
                          result: unitMile,
                          conversationValue: 1609.34,
                          color1: Colors.blue,
                          color2: Colors.blueAccent,
                          isLightColors: false,
                          unitTitle: 'Mile',
                          updateParent: updateAllValues),
                      Container(height: 20,),
                      UnitRowWidget(
                          result: unitNMile,
                          conversationValue: 1852,
                          color1: Colors.blue,
                          color2: Colors.blueAccent,
                          isLightColors: false,
                          unitTitle: 'N.Mile',
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

  updateAllValues(double meter) {
    unitMeter = meter;
    unitCm = meter*100;
    unitIn = unitCm / 2.54;
    unitFoot = meter * 3.2808;
    unitYard = meter * 1.0936;
    unitKm = meter /1000;
    unitMile = meter / 1609.34;
    unitNMile = meter / 1852;
    setState(() { });
  }
}