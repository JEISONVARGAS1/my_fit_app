import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_fit_app/features/my_training/ui/widget/slidable_action_widget.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:my_fit_app/core/models/exercise_model.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';

class CardExercise extends StatelessWidget {
  final ExerciseModel exerciseModel;
  final Function(ExerciseModel) onTapCard;
  final Function(ExerciseModel) onTapOption;

  const CardExercise({
    super.key,
    required this.onTapCard,
    required this.onTapOption,
    required this.exerciseModel,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableActionWidget(
            autoClose: true,
            borderRadius: BorderRadius.circular(20),
            onPressed: (d) => onTapOption(exerciseModel),
            backgroundColor: MyFitUiKit.util.color.primary,
            foregroundColor: MyFitUiKit.util.color.backgroundButton,
            icon: Icons.remove_red_eye_outlined,
            label: 'Ver',
          ),
        ],
      ),
      child: SizedBox(
        width: context.sizeWidth(),
        height: context.sizeHeight(0.12),
        child: MyFitUiKit.widget.card.simpleCard(
          space: 0,
          imageSize: 140,
          title: exerciseModel.name,
          description: exerciseModel.type.name,
          onTap: () => onTapCard(exerciseModel),
          image: _generateImage(exerciseModel.muscleGroups.first),
          descriptionStyle: MyFitUiKit.util.cafeTextStyle.title.copyWith(
            color: MyFitUiKit.util.color.primary,
            shadows: [
              const Shadow(
                blurRadius: 5.0,
                offset: Offset(2, 2),
                color: Colors.black26,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _generateImage(MuscleGroupsType type) {
    switch (type) {
      case MuscleGroupsType.ARM:
        return "assets/image/1.png";
      case MuscleGroupsType.LEG:
        return "assets/image/2.png";
      case MuscleGroupsType.CORE:
        return "assets/image/3.png";
      case MuscleGroupsType.BALANCE:
        return "assets/image/3.png";
    }
  }
}
