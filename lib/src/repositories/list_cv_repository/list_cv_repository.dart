import 'package:cvideo_employer_mobile/src/models/models.dart';
import 'package:cvideo_employer_mobile/src/repositories/repositories.dart';

class ListCvRepository {
  final ListCvProvider _cvProvider;

  ListCvRepository(this._cvProvider);

  Future<List<Application>> fetchListCvDetail() =>
      _cvProvider.fetchListApplication();
}
