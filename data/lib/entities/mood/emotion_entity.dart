import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

@JsonSerializable(explicitToJson: true)
class EmotionEntity {
  final int id;
  final String name;
  final AppIcon icon;

  const EmotionEntity({
    required this.id,
    required this.name,
    required this.icon,
  });

  const EmotionEntity.empty()
      : id = 0,
        name = '',
        icon = const AppIcon('');
}
