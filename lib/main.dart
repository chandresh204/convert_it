import 'package:convert_it/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'conversation_angle.dart';
import 'conversation_area.dart';
import 'conversation_energy.dart';
import 'conversation_length.dart';
import 'conversation_numbers.dart';
import 'conversation_speed.dart';
import 'conversation_temperature.dart';
import 'conversation_weight.dart';
import 'package:in_app_update/in_app_update.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    checkForUpdate();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        )
    );
    return const MaterialApp(
      themeMode: ThemeMode.dark,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            _appBar(context),
            Flexible(child: _layoutGrid(context))
          ],
        )
    );
  }
}

Widget _appBar(context) {
  return Container(
    padding: const EdgeInsets.only(top: 20.0, left: 16.0),
    height: 80,
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(color: Colors.purpleAccent, blurRadius: 10.0)
      ],
      gradient: LinearGradient(
        colors: [
          Colors.red,
          Colors.purple
        ]
      ),
    ),
    child: Row(
      children: [
        const Expanded(child: Text('Convert.It', style: TextStyle(fontSize: 22, color: Colors.white),)),
        IconButton(
            color: Colors.white,
            onPressed: () {
              shareThisApp(context);
            },
            icon: const Icon(Icons.share)),
        IconButton(
            color: Colors.white,
            onPressed: () {
              rateApp(context);
            },
            icon: const Icon(Icons.star)),
        Container(width: 10)
      ],
    ),
  );
}

Widget _layoutGrid(BuildContext context) {
  ScrollController controller = ScrollController();
  return GridView(
    controller: controller,
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    children: [
      _itemInLayout(context,Colors.blue, Colors.lightBlueAccent, Icons.elderly, 'Length', 'assets/length_icon.png'),
      _itemInLayout(context, Colors.red, Colors.redAccent, Icons.animation, 'Weight', 'assets/weight_icon.png'),
      _itemInLayout(context, Colors.purple, Colors.purpleAccent, Icons.device_thermostat, 'Temperature', null),
      _itemInLayout(context, Colors.green, Colors.greenAccent, Icons.area_chart, 'Area', 'assets/area_icon.png'),
      _itemInLayout(context, Colors.pink, Colors.pinkAccent, Icons.text_rotation_angleup, 'Angle', null),
      _itemInLayout(context, Colors.orange, Colors.orangeAccent, Icons.battery_4_bar, 'Energy', null),
      _itemInLayout(context, Colors.amber, Colors.amberAccent, Icons.speed, 'Speed', null),
      _itemInLayout(context, Colors.cyan, Colors.cyanAccent, Icons.numbers, 'Numbers', null)
    ],
  );
}

Widget _itemInLayout(BuildContext context, Color color1, Color color2, IconData icon, String title, String? iconImagePath) {
  return GestureDetector(
    onTap: () {
      switch(title) {
        case 'Length' : {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConversionLength()));
        }
        break;
        case 'Weight' : {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConversationWeight()));
        }
        break;
        case 'Temperature' : {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConversationTemperature()));
        }
        break;
        case 'Area' : {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConversationArea()));
        }
        break;
        case 'Angle': {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConversationAngle()));
        }
        break;
        case 'Energy': {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConversationEnergy()));
        }
        break;
        case 'Speed' :  {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConversationSpeed()));
        }
        break;
        case 'Numbers' : {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConversationNumbers()));
        }
        break;
        default: {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConversionLength()));
        }
      }
    },
    child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 10.0, color: color1)
          ],
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                color1,
                color2
              ]
          ),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (iconImagePath==null) ? Icon(icon, size: 100, color: Colors.white,) : SizedBox( height: 100,
                 child: Image.asset(iconImagePath)),
              Text(title, style: const TextStyle(fontSize: 18, color: Colors.white),)
            ]
        )
    ),
  );
}

void shareThisApp(context) {
  showModalBottomSheet(context: context, builder: (ctx) {
    return Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/convert_it_icon.png', width: 150),
          const Text('Having good experience with Convert.it?  '
              'Want to share this app with your friends? '
              'just click the share button below',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22),),
          Container(height: 22,),
          ElevatedButton(onPressed: () {
            // sharing URL
            Share.share('Hello, Im using Convert.It for Unit conversation. You can also try this '
                '${Constants.playStoreUrl}');
          }, child: const Text('SHARE',
            style: TextStyle(fontSize: 22),))
        ],
      ),
    );
  });
}

void rateApp(context) {
  showModalBottomSheet(context: context, builder: (ctx) {
    return Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/convert_it_icon.png', width: 150),
          const Text('Please send your valuable feedback, '
              'Rate Convert.It and write a review',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22),),
          Container(height: 22,),
          ElevatedButton(onPressed: () {
            launchUrl(Uri.parse(Constants.playStoreUrl), mode : LaunchMode.externalNonBrowserApplication);
          }, child: const Text('Go to PlayStore',
            style: TextStyle(fontSize: 22),))
        ],
      ),
    );
  });
}

void checkForUpdate() {
  InAppUpdate.checkForUpdate().then((updateInfo) {
 //   print("Looking for update : ${updateInfo}");
    if(updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
   //   print("update available");
      InAppUpdate.startFlexibleUpdate();
    }
  });
}