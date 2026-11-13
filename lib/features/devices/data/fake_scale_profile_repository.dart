import '../domain/scale_profile_summary.dart';

class FakeScaleProfileRepository implements ScaleProfileRepository {
  const FakeScaleProfileRepository();

  @override
  Future<List<ScaleProfileSummary>> list() async => const [
    ScaleProfileSummary(
      id: 'generic-ascii-kg',
      name: 'Generic ASCII (kg)',
    ),
    ScaleProfileSummary(
      id: 'generic-ascii-lb',
      name: 'Generic ASCII (lb)',
    ),
  ];
}