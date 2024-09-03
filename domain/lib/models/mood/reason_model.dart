class ReasonModel {
  final int id;
  final String name;

  const ReasonModel({
    required this.id,
    required this.name,
  });

  const ReasonModel.empty()
      : id = 0,
        name = '';
}
