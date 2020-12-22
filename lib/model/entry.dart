import 'package:json_annotation/json_annotation.dart';

/// This allows the `Entry` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the * denotes the source file name.
part 'entry.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(nullable: false)
class Entry {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String download_url;

  Entry(
      {this.id,
      this.author,
      this.width,
      this.height,
      this.url,
      this.download_url});
  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
  Map<String, dynamic> toJson() => _$EntryToJson(this);
}
