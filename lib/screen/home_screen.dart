import 'package:dusty_dust/component/horizontal_data_card.dart';
import 'package:dusty_dust/component/main_app_bar.dart';
import 'package:dusty_dust/component/main_drawer.dart';
import 'package:dusty_dust/component/vertical_data_card.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController controller = ScrollController();
  final double expandedHeight = 500;
  final DateTime date = DateTime(2022, 3, 12, 18, 00);
  String region = '서울';
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();

    controller.addListener(scrollListener);
  }

  void scrollListener() {
    bool isExpanded = controller.hasClients &&
        controller.offset < expandedHeight - kToolbarHeight;

    if(isExpanded != this.isExpanded){
      setState(() {
        this.isExpanded = isExpanded;
      });
    }
  }

  @override
  void dispose() {
    controller.removeListener(scrollListener);
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MainDrawer(
        selectedRegion: region,
        onRegionSelected: onRegionSelected,
      ),
      body: CustomScrollView(
        controller: controller,
        slivers: [
          MainAppBar(
            expandedHeight: expandedHeight,
            isExpanded: isExpanded,
            region: region,
            dateTime: date,
            state: '나쁨',
            comment: '공기가 안좋아요...',
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                HorizontalDataCard(
                  title: '종류별 통계',
                ),
                const SizedBox(height: 16.0),
                VerticalDataCard(
                  title: '시간별 미세먼지',
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onRegionSelected(String selectedRegion){
    if(selectedRegion != region){
      setState(() {
        region = selectedRegion;
      });
    }

    Navigator.of(context).pop();
  }
}
