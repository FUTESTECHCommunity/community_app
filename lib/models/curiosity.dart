import 'package:json_annotation/json_annotation.dart';
part 'curiosity.g.dart';

//好奇心提问
@JsonSerializable()
class Questioning {
  final int id;
  final String content;
  final String mdContent;
  final String summary;
  final List<String> images;
  final List<String> tags;
  final String created;
  final VoteSummarizing vote;
  final Author author;
  final List<Comment> comments;

  Questioning({this.id, this.content, this.mdContent, this.summary, this.images, this.tags, this.created, this.vote, this.author, this.comments});

  factory Questioning.fromJson(Map<String, dynamic> json) => _$QuestioningFromJson(json);

  Map<String, dynamic> toJson() => _$QuestioningToJson(this);
}

//作者
@JsonSerializable()
class Author {
  final String name;
  final int userId;
  final String pubKey;
  final String avatar;

  Author({this.name, this.userId, this.pubKey, this.avatar});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

//投票汇总
@JsonSerializable()
class VoteSummarizing {
  final int percent191;
  final int percent382;
  final int percent500;
  final int percent618;
  final int percent809;
  final int excellent;

  VoteSummarizing({this.percent191, this.percent382, this.percent500, this.percent618, this.percent809, this.excellent});

  factory VoteSummarizing.fromJson(Map<String, dynamic> json) => _$VoteSummarizingFromJson(json);

  Map<String, dynamic> toJson() => _$VoteSummarizingToJson(this);
}

//评论(可嵌套)
@JsonSerializable()
class Comment {
  final int id;
  final Author author;
  final String content;
  final String mdContent;
  final int up;
  final int down;
  final List<Comment> subs;
  Comment({this.id, this.author, this.content, this.mdContent, this.subs, this.up, this.down});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}


