import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/home/components/appbar.dart';
import 'package:flutter_chat_app/pages/home/components/drawer.dart';
import 'package:flutter_chat_app/pages/home/components/tabbar.dart';
import 'package:flutter_chat_app/pages/home/components/tabbarview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        drawer: drawer(),
        body: Column(
          children: [
            appBar(scaffoldKey),
            tabbar(),
            tabbarview(),
          ],
        ),
      ),
    );
  }
}
