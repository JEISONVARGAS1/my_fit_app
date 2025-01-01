import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_fit_app/core/extension/string_extension.dart';

enum MuscleGroupsType { ARM, LEG, CORE, BALANCE }

enum ExerciseType { GYM, CROSSFIT }

class ExerciseModel {
  final String name;
  final ExerciseType type;
  final String description;
  final DocumentReference? id;
  final List<MuscleGroupsType> muscleGroups;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.muscleGroups,
  });

  ExerciseModel copyWith({
    String? name,
    ExerciseType? type,
    String? description,
    List<MuscleGroupsType>? muscleGroups,
  }) =>
      ExerciseModel(
        id: id,
        name: name ?? this.name,
        type: type ?? this.type,
        description: description ?? this.description,
        muscleGroups: muscleGroups ?? this.muscleGroups,
      );

  factory ExerciseModel.fromJson(json, DocumentReference ref) {
    final String type = json["type"] as String;

    return ExerciseModel(
      id: ref,
      name: json["name"],
      description: json["description"],
      type: type.toExerciseType(),
      muscleGroups: List<MuscleGroupsType>.from(
        json["muscle_groups"].map(
          (x) {
            String item = x as String;
            return item.toMuscleGroupsType();
          },
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "description": description,
        "muscle_groups": List<String>.from(muscleGroups.map((x) => x.name)),
      };
}
