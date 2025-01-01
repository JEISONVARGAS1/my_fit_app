import 'package:my_fit_app/core/models/exercise_model.dart';

abstract class MyTrainingApiInterface {

  Future<List<ExerciseModel>> getAllTrainingData();
}
