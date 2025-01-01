import 'package:my_fit_app/core/models/exercise_model.dart';

extension ContextExtension on ExerciseType {
  String toName(){
    switch(this){
      case ExerciseType.GYM:
        return "Gimnasio";
      case ExerciseType.CROSSFIT:
        return "Crossfit";
    }
  }
}
