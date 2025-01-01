import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:my_fit_app/core/models/exercise_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_fit_app/features/my_training/provider/model/my_training_state.dart';
import 'package:my_fit_app/features/my_training/repository/my_training_repository.dart';

part 'my_training_controller.g.dart';

@riverpod
class MyTrainingController extends _$MyTrainingController {
  @override
  FutureOr<MyTrainingState> build() {
    ref.onDispose(() {});
    return MyTrainingState.init();
  }

  MyTrainingRepository get repository => ref.read(myTrainingRepositoryProvider);

  Future<void> initPage(BuildContext context) async {
    await _getData();
    _applyFilter();
  }

  void chooseExerciseType(ExerciseType type) {
    bool contain = state.value!.listExerciseTypeFilter.contains(type);
    if (contain) {
      final list = state.value!.listExerciseTypeFilter.toList();
      list.removeWhere((e) => e == type);
      _setState(state.value!.copyWith(listExerciseTypeFilter: list));
    } else {
      final list = state.value!.listExerciseTypeFilter.toList();
      list.add(type);
      _setState(state.value!.copyWith(listExerciseTypeFilter: list));
    }

    _applyFilter();
  }

  void chooseMuscleGroup(MuscleGroupsType type) {
    bool contain = state.value!.listMuscleGroupsType.contains(type);
    if (contain) {
      final list = state.value!.listMuscleGroupsType.toList();
      list.removeWhere((e) => e == type);
      _setState(state.value!.copyWith(listMuscleGroupsType: list));
    } else {
      final list = state.value!.listMuscleGroupsType.toList();
      list.add(type);
      _setState(state.value!.copyWith(listMuscleGroupsType: list));
    }

    _applyFilter();
  }

  bool validateMuscleGroupsType(MuscleGroupsType item) {
    final validate = state.value!.listMuscleGroupsType.contains(item);
    return validate;
  }

  bool validateExerciseType(ExerciseType item) {
    final validate = state.value!.listExerciseTypeFilter.contains(item);
    return validate;
  }

  void _applyFilter() {
    List<ExerciseModel> list = state.value!.exercises.toList();

    final listMuscleGroupsTypeNotEmpty = state.value!.listMuscleGroupsType.isNotEmpty;
    final listExerciseTypeFilterNotEmpty = state.value!.listExerciseTypeFilter.isNotEmpty;

    if (listMuscleGroupsTypeNotEmpty) {
      list = list.where((exercise) => state.value!.listMuscleGroupsType.any((element) => exercise.muscleGroups.contains(element))).toList();
    }
    if(listExerciseTypeFilterNotEmpty){
      list = list.where((exercise)=> state.value!.listExerciseTypeFilter.contains(exercise.type)).toList();
    }

    _setState(state.value!.copyWith(exercisesFilter: list));
  }

  Future<void> _getData() async {
    final res = await repository.getAllTrainingData();

    if (res.isSuccessful) {
      res.data!.sort((a, b) => a.name.compareTo(b.name));
      _setState(state.value!.copyWith(exercises: res.data!));
    }
  }

  _setState(MyTrainingState newState) => state = AsyncValue.data(newState);
}
