import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Option {
  String value;
  String detail;
  bool correct;
  Option({this.value = '', this.detail = '', this.correct = false});
  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}

@JsonSerializable()
class Question {
  String text;
  List<Option> options;
  Question({this.options = const [], this.text = ''});
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Quiz {
  String id;
  String title;
  String description;
  String video;
  String topic;
  List<Question> questions;

  Quiz(
      {this.title = '',
      this.video = '',
      this.description = '',
      this.id = '',
      this.topic = '',
      this.questions = const []});
  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable()
class Topic {
  late final String id;
  final String title;
  final String description;
  final String img;
  final List<Quiz> quizzes;

  Topic(
      {this.id = '',
      this.title = '',
      this.description = '',
      this.img = 'default.png',
      this.quizzes = const []});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}

@JsonSerializable()
class Report {
  String uid;
  int total;
  Map topics;
  List favorites;

  Report(
      {this.uid = '',
      this.topics = const {},
      this.total = 0,
      this.favorites = const []});
  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

class ItemModel {
  late int id;
  late String title;
  // late String description;
  // late String details;
  // List<String> audios;
  // List<String> images;
  // List examples;
  // List tags;
  // List related;

  ItemModel(
    this.id,
    this.title,
    // this.description,
    // this.details
  );

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    // description = parsedJson['attributes']['description'];
    // details = parsedJson['attributes']['details'];
  }
}
