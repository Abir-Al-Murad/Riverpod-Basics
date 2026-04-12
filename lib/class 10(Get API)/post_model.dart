class Post_Model {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post_Model({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post_Model.fromJson({required Map<String, dynamic> json}) {
    return Post_Model(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'userId':userId,
      'id':id,
      'title':title,
      'body':body,
    };
  }
}
