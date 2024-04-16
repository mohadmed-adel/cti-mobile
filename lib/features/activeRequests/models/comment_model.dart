class CommentModel {
  final int? id;
  final String comment;
  final int requestedServices;

  CommentModel(
      {this.id, required this.comment, required this.requestedServices});
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      comment: json['comment'],
      requestedServices: json['requestedServices'],
    );
  }
  Map<String, dynamic> toJson() {
    return {"comment": comment};
  }
}
