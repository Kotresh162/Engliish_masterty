import 'package:json_annotation/json_annotation.dart';
part 'card.g.dart';

@JsonSerializable()
class Card {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'youtubeUrl')
  String? youtubeUrl;

  @JsonKey(name: 'rating')
  double? rating;

  Card({
    this.id,
    this.title,
    this.youtubeUrl,
    this.rating,
  });

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}