import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:my_fit_ui_kit/models/button_model.dart';
import 'package:my_fit_app/core/models/exercise_model.dart';
import 'package:my_fit_app/core/extension/string_extension.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';
import 'package:my_fit_app/core/extension/exercise_type_extension.dart';
import 'package:my_fit_app/core/extension/muscle_groups_extension.dart';

class FilterOption extends StatelessWidget {
  final Function() closePanel;
  final Function(ExerciseType) exerciseTypeOption;
  final Function(MuscleGroupsType) muscleGroupOption;
  final bool Function(ExerciseType) validateExerciseType;
  final bool Function(MuscleGroupsType) validateMuscleGroupsType;

  const FilterOption({
    super.key,
    required this.closePanel,
    required this.muscleGroupOption,
    required this.exerciseTypeOption,
    required this.validateExerciseType,
    required this.validateMuscleGroupsType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: MyFitUiKit.util.color.menu,
      ),
      height: context.sizeHeight(0.7),
      width: context.sizeWidth(0.8),
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sizeWidth(0.05),
          vertical: context.sizeHeight(0.02),
        ),
        children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              height: context.sizeHeight(0.005),
              width: context.sizeWidth(0.3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyFitUiKit.util.color.white,
              ),
            ),
          ),
          SizedBox(height: context.sizeHeight(0.05)),
          _generateExpandableWidget<MuscleGroupsType>(
            title: "Area Muscular",
            onTap: muscleGroupOption,
            validate: validateMuscleGroupsType,
            generateName: (value) => value.toName(),
            description: "Filtra por el área muscular que deseas trabajar",
            items: [
              MuscleGroupsType.ARM,
              MuscleGroupsType.LEG,
              MuscleGroupsType.CORE,
              MuscleGroupsType.BALANCE,
            ],
          ),
          _generateExpandableWidget<ExerciseType>(
            onTap: exerciseTypeOption,
            title: "Tipo de ejercicio",
           validate: validateExerciseType,
            generateName: (value) => value.toName(),
            description: "Filtra por el tipo de ejercicio",
            items: [ExerciseType.GYM, ExerciseType.CROSSFIT],
          ),
          SizedBox(height: context.sizeHeight(0.3)),
          MyFitUiKit.widget.button.formButton(
            ButtonModel(
              label: "cerrar",
              onTap: closePanel,
            ),
          )
        ],
      ),
    );
  }

  _generateExpandableWidget<T>({
    required String title,
    required List<T> items,
    required String description,
    required Function(T) onTap,
    required bool Function(T) validate,
    required String Function(T) generateName,
  }) {
    return Column(
      children: [
        ExpandablePanel(
          header: Text(
            title,
            style: MyFitUiKit.util.cafeTextStyle.title,
          ),
          collapsed: Text(
            description,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          theme: ExpandableThemeData(iconColor: MyFitUiKit.util.color.white),
          expanded: Wrap(
            spacing: 10,
            runSpacing: 5,
            children: List.generate(
              items.length,
              (int index) {
                T item = items[index];
                bool isSelected = validate(item);
                return Material(
                  color: isSelected
                      ? MyFitUiKit.util.color.primary
                      : MyFitUiKit.util.color.card,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => onTap(item),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        generateName(item),
                        style: MyFitUiKit.util.cafeTextStyle.text.copyWith(
                          color: isSelected
                              ? MyFitUiKit.util.color.backgroundButton
                              : MyFitUiKit.util.color.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 15),
        Divider(color: MyFitUiKit.util.color.card)
      ],
    );
  }
}
