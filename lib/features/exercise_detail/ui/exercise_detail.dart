import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';
import 'package:my_fit_app/features/exercise_detail/ui/widget/header_exercise_detail.dart';

class ExerciseDetailPage extends ConsumerStatefulWidget {
  const ExerciseDetailPage({super.key});

  @override
  ConsumerState<ExerciseDetailPage> createState() => _ExerciseDetailPage();
}

class _ExerciseDetailPage extends ConsumerState<ExerciseDetailPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          HeaderExerciseDetail(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.sizeHeight(0.03),
              vertical: context.sizeHeight(0.05),
            ),
            child: Column(
              children: [
                MyFitUiKit.widget.card.detailCard(label: "120 KL", value: "100%"),
                SizedBox(height: context.sizeHeight(0.02)),
                MyFitUiKit.widget.card.detailCard(label: "107 KL", value: "90%"),
                SizedBox(height: context.sizeHeight(0.02)),
                MyFitUiKit.widget.card.detailCard(label: "100 KL", value: "80%"),
                SizedBox(height: context.sizeHeight(0.02)),
                MyFitUiKit.widget.card.detailCard(label: "70 KL", value: "70%"),
                SizedBox(height: context.sizeHeight(0.02)),
                MyFitUiKit.widget.card.detailCard(label: "65 KL", value: "60%"),
                SizedBox(height: context.sizeHeight(0.02)),
                MyFitUiKit.widget.card.detailCard(label: "60 KL", value: "50%"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
