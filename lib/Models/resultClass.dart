class ResultClass {
  ResultClass({
    this.result,
  });

  List<Result> result;

  factory ResultClass.fromJson(Map<String, dynamic> json) => ResultClass(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.name,
    this.desc,
  });

  String id;
  String name;
  String desc;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
  };
}