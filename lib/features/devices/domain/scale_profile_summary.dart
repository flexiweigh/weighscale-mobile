class ScaleProfileSummary {
  const ScaleProfileSummary({required this.id, required this.name});

  final String id;
  final String name;
}

abstract class ScaleProfileRepository {
  Future<List<ScaleProfileSummary>> list();
}