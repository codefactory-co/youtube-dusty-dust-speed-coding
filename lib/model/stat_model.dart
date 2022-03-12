class StatModel {
  // 종류 - 미세먼지
  final String type;

  // 상태 - 나쁨
  final String state;
  final String imgPath;
  final String level;

  StatModel({
    required this.type,
    required this.state,
    required this.imgPath,
    required this.level,
  });
}
