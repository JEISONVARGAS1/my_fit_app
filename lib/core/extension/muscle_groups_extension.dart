import 'package:my_fit_app/core/models/exercise_model.dart';

extension ContextExtension on MuscleGroupsType {
  String toName(){
    switch(this){
      case MuscleGroupsType.ARM:
        return "Brazos";
      case MuscleGroupsType.LEG:
        return "Piernas";
      case MuscleGroupsType.CORE:
        return "Cuerpo";
      case MuscleGroupsType.BALANCE:
        return "Balance";
    }
  }
}
