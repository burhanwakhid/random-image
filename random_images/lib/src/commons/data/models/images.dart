import 'package:json_annotation/json_annotation.dart';

part 'images.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class Images {
  final String url;

  Images({required this.url});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}
