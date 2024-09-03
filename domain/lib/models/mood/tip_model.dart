class TipModel {
  final String title;
  final String description;

  const TipModel({
    required this.title,
    required this.description,
  });

  const TipModel.empty()
      : title = '',
        description = '';
}
