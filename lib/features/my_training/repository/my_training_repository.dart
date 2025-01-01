import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fit_app/core/models/exercise_model.dart';
import 'package:my_fit_app/core/models/query_response_model.dart';
import 'package:my_fit_app/features/my_training/data/my_training_api.dart';
import 'package:my_fit_app/features/my_training/data/my_training_api_interface.dart';

abstract class MyTrainingRepository {
  Future<QueryResponseModel<List<ExerciseModel>>> getAllTrainingData();
}

class _MyTrainingRepository implements MyTrainingRepository {
  final MyTrainingApiInterface _myTrainingApi;

  _MyTrainingRepository(MyTrainingApiInterface myTrainingApi)
      : _myTrainingApi = myTrainingApi;

  @override
  Future<QueryResponseModel<List<ExerciseModel>>> getAllTrainingData() async {
    try {
      final res = await _myTrainingApi.getAllTrainingData();
      return QueryResponseModel(data: res);
    } catch (e) {
      return QueryResponseModel(isSuccessful: false, message: e.toString());
    }
  }
}

final myTrainingRepositoryProvider = Provider<MyTrainingRepository>(
  (Ref ref) => _MyTrainingRepository(ref.read(myTrainingApiProvider)),
);
