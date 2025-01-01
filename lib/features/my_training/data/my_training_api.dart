import 'my_training_api_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fit_app/core/models/exercise_model.dart';

class _MyTrainingApi extends MyTrainingApiInterface {
  final FirebaseFirestore _db;
  final String collection = "exercises";

  _MyTrainingApi(FirebaseFirestore db) : _db = db;

  @override
  Future<List<ExerciseModel>> getAllTrainingData() async {
    final data = await _db.collection(collection).get();
    final res = data.docs
        .map((res) => ExerciseModel.fromJson(res.data(), res.reference))
        .toList();
    return res;
  }
}

final myTrainingApiProvider = Provider<MyTrainingApiInterface>(
  (Ref ref) => _MyTrainingApi(FirebaseFirestore.instance),
);
