// import 'package:flutter_samples/Download/download.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/MenuSide/page1.dart';
import 'package:flutter_samples/MenuSwipe/menu_Swipe.dart';
import 'package:flutter_samples/WhatsappClone/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/login/login.dart';
import 'package:flutter_samples/login/provider/service.dart';
import 'package:provider/provider.dart';

import 'MenuSide/Menu.dart';
import 'MenuSide/page2.dart';
import 'MenuSide/page3.dart';
import 'MenuSide/page4.dart';
import 'MenuSide/page5.dart';
import 'MenuSide/page6.dart';
import 'MenuSide/page7.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Service(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Samples',
        // theme: ThemeData(brightness: Brightness.light),
        themeMode: ThemeMode.system,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Builder(
            builder: (context) => ListView(
              padding: const EdgeInsets.all(40.0),
              children: [
                ElevatedButton(
                  child: Text("SideMenu"),
                  onPressed: () => Navigator.pushNamed(context, "menu"),
                ),
                ElevatedButton(
                  child: Text("MenuSwipe"),
                  onPressed: () => Navigator.pushNamed(context, "menuSwipe"),
                ),
                // ElevatedButton(
                //   child: Text("DownLoad"),
                //   onPressed: () => Navigator.pushNamed(context, "download"),
                // ),
                ElevatedButton(
                  child: Text("Whatsapp"),
                  onPressed: () => Navigator.pushNamed(context, "whatsapp"),
                ),
                ElevatedButton(
                  child: Text("lOGIN ANIMATED"),
                  onPressed: () => Navigator.pushNamed(context, "login"),
                ),
              ],
            ),
          ),
        ),
        routes: {
          "menu": (BuildContext context) => MainSideMenu(),
          "menuSwipe": (BuildContext context) => MenuSwipe(),
          // "download": (BuildContext context) => DownloadPage(),
          "whatsapp": (BuildContext context) => WhatsappPage(),
          "login": (BuildContext context) => LoginScreen(),
          "page1": (BuildContext context) => Page1(),
          "page2": (BuildContext context) => Page2(),
          "page3": (BuildContext context) => Page3(),
          "page4": (BuildContext context) => Page4(),
          "page5": (BuildContext context) => Page5(),
          "page6": (BuildContext context) => Page6(),
          "page7": (BuildContext context) => Page7(),
        },
      ),
    );
  }
}
