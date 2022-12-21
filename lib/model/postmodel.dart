class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
}

/*   PostModel.fromMap({required Map json})
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body']; */

  // other options
  /*   PostModel(Map json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body']; */