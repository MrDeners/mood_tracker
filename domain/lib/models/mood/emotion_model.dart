import 'package:core_ui/core_ui.dart';

class EmotionModel {
  final int id;
  final String name;
  final AppIcon icon;

  const EmotionModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  const EmotionModel.empty()
      : id = 0,
        name = '',
        icon = const AppIcon('');
}
