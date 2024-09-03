class ReasonEntity {
  final int id;
  final String name;

  const ReasonEntity({
    required this.id,
    required this.name,
  });

  const ReasonEntity.empty()
      : id = 0,
        name = '';
}
