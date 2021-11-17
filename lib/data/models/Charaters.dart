class Characters_model {
  late int charId;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String statusIfDeadOrAlive;
  late List<dynamic> appearanceOfSeason;
  late String actorName;
  late String actegoryForTwoSeries;
  late List<dynamic> betterCallSaulApperance;

  Characters_model.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    nickName = json["nickname"];
    image = json["img"];
    jobs = json["occupation"];
    statusIfDeadOrAlive = json["status"];
    appearanceOfSeason = json["appearance"];
    actorName = json["portrayed"];
    actegoryForTwoSeries = json["category"];
    betterCallSaulApperance = json["better_call_saul_appearance"];
  }
}
