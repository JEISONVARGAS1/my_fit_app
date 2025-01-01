import 'package:my_fit_app/core/models/exercise_model.dart';

extension ContextExtension on String {
  String getMessageFromCode() {
    switch (this) {
      case "invalid-credential":
        return "El usuario o contraseña son incorrectos";
      case "email-already-in-use":
        return "Este correo ya fue registrado anteriormente";
      default:
        return "Error no controlado";
    }
  }

  getFirstItem() => split(" ").first;

  bool validateEmail() {
    RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regExp.hasMatch(this);
  }

  MuscleGroupsType toMuscleGroupsType() {
    if (this == MuscleGroupsType.ARM.name) return MuscleGroupsType.ARM;
    if (this == MuscleGroupsType.BALANCE.name) return MuscleGroupsType.BALANCE;
    if (this == MuscleGroupsType.CORE.name) return MuscleGroupsType.CORE;
    return MuscleGroupsType.LEG;
  }

  ExerciseType toExerciseType() {
    if (this == ExerciseType.GYM.name) return ExerciseType.GYM;
    return ExerciseType.CROSSFIT;
  }
}
