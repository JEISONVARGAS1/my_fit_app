import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:my_fit_app/core/models/exercise_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_training_state.freezed.dart';

@freezed
sealed class MyTrainingState with _$MyTrainingState {
  const factory MyTrainingState({
    required PanelController controller,
    required List<ExerciseModel> exercises,
    required PanelController controllerOptions,
    required List<ExerciseModel> exercisesFilter,
    required List<ExerciseType> listExerciseTypeFilter,
    required List<MuscleGroupsType> listMuscleGroupsType,
  }) = MyTrainingStateData;

  factory MyTrainingState.init() => MyTrainingState(
        exercises: [],
        exercisesFilter: [],
        listMuscleGroupsType: [],
        listExerciseTypeFilter: [],
        controller: PanelController(),
        controllerOptions: PanelController(),
      );
}
