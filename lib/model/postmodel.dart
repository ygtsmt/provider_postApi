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