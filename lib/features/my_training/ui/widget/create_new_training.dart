import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:my_fit_app/core/models/exercise_model.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';
import 'package:my_fit_app/features/my_training/ui/widget/card_exercise.dart';

class CreateNewTraining extends StatelessWidget {
  final ScrollController sc;
  final Function() onTapFilter;
  final List<ExerciseModel> exercises;
  final Function(ExerciseModel) onTapCard;
  final Function(ExerciseModel) onTapOption;

  const CreateNewTraining({
    super.key,
    required this.sc,
    required this.exercises,
    required this.onTapCard,
    required this.onTapOption,
    required this.onTapFilter,
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
        controller: sc,
        padding: EdgeInsets.only(
          left: context.sizeWidth(0.05),
          right: context.sizeWidth(0.05),
          top: context.sizeHeight(0.02),
          bottom: context.sizeHeight(0.15),
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
          SizedBox(height: context.sizeHeight(0.02)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Selecciona tus",
                    style: MyFitUiKit.util.cafeTextStyle.title
                        .copyWith(fontSize: 20),
                  ),
                  IconButton(
                    onPressed: onTapFilter,
                    icon: Icon(Icons.filter_list),
                  )
                ],
              ),
              Text(
                "Ejercicio",
                style: MyFitUiKit.util.cafeTextStyle.titleXL,
              ),
            ],
          ),
          SizedBox(height: context.sizeHeight(0.03)),
          Column(
            spacing: context.sizeHeight(0.01),
            children: List.generate(
              exercises.length,
              (int index) => CardExercise(
                onTapCard: onTapCard,
                onTapOption: onTapOption,
                exerciseModel: exercises[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
