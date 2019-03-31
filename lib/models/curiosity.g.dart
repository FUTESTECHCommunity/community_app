// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curiosity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questioning _$QuestioningFromJson(Map<String, dynamic> json) {
  return Questioning(
      id: json['id'] as int,
      content: json['content'] as String,
      mdContent: json['mdContent'] as String,
      summary: json['summary'] as String,
      images: (json['images'] as List)?.map((e) => e as String)?.toList(),
      tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
      created: json['created'] as String,
      vote: json['vote'] == null
          ? null
          : VoteSummarizing.fromJson(json['vote'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      comments: (json['comments'] as List)
          ?.map((e) =>
              e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$QuestioningToJson(Questioning instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'mdContent': instance.mdContent,
      'summary': instance.summary,
      'images': instance.images,
      'tags': instance.tags,
      'created': instance.created,
      'vote': instance.vote,
      'author': instance.author,
      'comments': instance.comments
    };

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
      name: json['name'] as String,
      userId: json['userId'] as int,
      pubKey: json['pubKey'] as String,
      avatar: json['avatar'] as String);
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'name': instance.name,
      'userId': instance.userId,
      'pubKey': instance.pubKey,
      'avatar': instance.avatar
    };

VoteSummarizing _$VoteSummarizingFromJson(Map<String, dynamic> json) {
  return VoteSummarizing(
      percent191: json['percent191'] as int,
      percent382: json['percent382'] as int,
      percent500: json['percent500'] as int,
      percent618: json['percent618'] as int,
      percent809: json['percent809'] as int,
      excellent: json['excellent'] as int);
}

Map<String, dynamic> _$VoteSummarizingToJson(VoteSummarizing instance) =>
    <String, dynamic>{
      'percent191': instance.percent191,
      'percent382': instance.percent382,
      'percent500': instance.percent500,
      'percent618': instance.percent618,
      'percent809': instance.percent809,
      'excellent': instance.excellent
    };

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
      id: json['id'] as int,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      content: json['content'] as String,
      mdContent: json['mdContent'] as String,
      subs: (json['subs'] as List)
          ?.map((e) =>
              e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      up: json['up'] as int,
      down: json['down'] as int);
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'mdContent': instance.mdContent,
      'up': instance.up,
      'down': instance.down,
      'subs': instance.subs
    };
