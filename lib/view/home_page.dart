import 'package:flutter/material.dart';
import 'package:trademobile/view/category/oppo_widget.dart';
import 'package:trademobile/view/category/samsung_widget.dart';
import 'package:trademobile/view/category/vivo_widget.dart';
import 'package:trademobile/view/category/xiomi_page.dart';
import 'category/apple_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions:const [ Icon(Icons.search,color: Colors.black,),SizedBox(width: 10,)],
        leading: const Icon(Icons.arrow_back,color: Colors.black,),
        title:const Center(child:  Text("Smartphones",style: TextStyle(color: Color(0xff323232)),)),
        bottom: TabBar(
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          isScrollable: true,
          controller: _tabController, tabs: const [
          Tab(
            text: 'Apple',
          ),
          Tab(
            text: 'Samsung',
          ),
          Tab(
            text: "Oppo",
          ),
          Tab(
            text: "Xiomi",
          ),
          Tab(
            text: "Vivo",
          )
        ]),
      ),
      body: TabBarView(
        
        controller: _tabController,
        children:_widgets),
    );
  }

  // ignore: prefer_final_fields
  List<Widget> _widgets =const [ApplePage(),
SamsungPage(),
OppoPage(),
XiomiPage(),
VivoPage()  ];
}
