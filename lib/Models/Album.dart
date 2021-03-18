class Album {
  int userId;
  int id;
  String title;
  Album({this.userId,this.id,this.title});


  factory Album.fromjson(Map<String,dynamic> json){
    return Album(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
    );
  }

}