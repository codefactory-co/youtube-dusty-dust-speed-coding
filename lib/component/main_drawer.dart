import 'package:dusty_dust/const/colors.dart';
import 'package:flutter/material.dart';

const regionsList = [
  '서울',
  '경기',
  '대구',
  '충남',
  '인천',
  '대전',
  '경북',
  '세종',
  '광주',
  '전북',
  '강원',
  '울산',
  '전남',
];

typedef OnRegionSelected = void Function(String selectedRegion);

class MainDrawer extends StatelessWidget {
  final String selectedRegion;
  final OnRegionSelected onRegionSelected;

  const MainDrawer(
      {required this.selectedRegion, required this.onRegionSelected, Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        children: [
          DrawerHeader(
            child: Text(
              '지역 선택',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          ...regionsList
              .map(
                (e) =>
                ListTile(
                  tileColor: Colors.white,
                  selectedColor: Colors.black,
                  selectedTileColor: lightColor,
                  dense: true,
                  selected: selectedRegion == e,
                  onTap: (){
                    onRegionSelected(e);
                  },
                  title: Text(e),
                ),
          )
              .toList(),
        ],
      ),
    );
  }
}
