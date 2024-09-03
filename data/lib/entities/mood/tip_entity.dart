import 'package:core/core.dart';

@JsonSerializable()
class TipEntity {
  final String title;
  final String description;

  const TipEntity({
    required this.title,
    required this.description,
  });

  const TipEntity.empty()
      : title = '',
        description = '';
}
