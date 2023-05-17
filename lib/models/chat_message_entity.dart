class ChatMessageEntity {
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  ChatMessageAuthor author;

  ChatMessageEntity(
      {required this.text,
        required this.id,
        required this.createdAt,
        required this.author,
        this.imageUrl});

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
        text: json['text'],
        id: json['id'],
        createdAt: json['createdAt'],
        imageUrl: json['image'],
        author: ChatMessageAuthor.fromJson(json['author']));
  }
}

class ChatMessageAuthor {
  String userName;

  ChatMessageAuthor({required this.userName});

  factory ChatMessageAuthor.fromJson(Map<String, dynamic> json) {
    return ChatMessageAuthor(userName: json['username']);
  }
}