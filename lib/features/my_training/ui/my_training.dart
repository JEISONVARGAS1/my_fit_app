import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';
import 'package:my_fit_app/features/my_training/ui/widget/filter_option.dart';
import 'package:my_fit_app/features/my_training/ui/widget/create_new_training.dart';
import 'package:my_fit_app/features/my_training/ui/widget/custom_panel_widget.dart';
import 'package:my_fit_app/features/my_training/provider/my_training_controller.dart';

class MyTrainingPage extends ConsumerStatefulWidget {
  const MyTrainingPage({super.key});

  @override
  ConsumerState<MyTrainingPage> createState() => _MyTrainingPage();
}

class _MyTrainingPage extends ConsumerState<MyTrainingPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(myTrainingControllerProvider.notifier).initPage(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myTrainingControllerProvider).value!;
    final provider = ref.read(myTrainingControllerProvider.notifier);

    return CustomPanelWidget(
      maxHeight: context.sizeHeight(0.7),
      controller: state.controllerOptions,
      buildPanel: (sc) => FilterOption(
        muscleGroupOption: provider.chooseMuscleGroup,
        exerciseTypeOption: provider.chooseExerciseType,
        closePanel: () => state.controllerOptions.close(),
        validateExerciseType: provider.validateExerciseType,
        validateMuscleGroupsType: provider.validateMuscleGroupsType,
      ),
      body: CustomPanelWidget(
        buildPanel: (sc) => CreateNewTraining(
          sc: sc,
          onTapCard: (data) {},
          exercises: state.exercisesFilter,
          onTapFilter: () => state.controllerOptions.open(),
          onTapOption: (data) => context.pushNamed("exerciseDetailPage"),
        ),
        controller: state.controller,
        body: ListView(
          padding: EdgeInsets.symmetric(
            vertical: context.sizeHeight(0.02),
            horizontal: context.sizeHeight(0.03),
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Jeison Vargas",
                  style: MyFitUiKit.util.cafeTextStyle.title
                      .copyWith(fontSize: 20),
                ),
                Material(
                  color: MyFitUiKit.util.color.white,
                  shape: CircleBorder(),
                  child: InkWell(
                    customBorder: CircleBorder(),
                    onTap: () => state.controller.open(),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.add,
                        color: MyFitUiKit.util.color.backgroundButton,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Mi Entreno",
              style: MyFitUiKit.util.cafeTextStyle.titleXL,
            ),
            SizedBox(height: context.sizeHeight(0.02)),
            MyFitUiKit.widget.card.simpleCard(
              space: 0,
              onTap: () {
                context.pushNamed("exerciseDetailPage");
              },
              imageSize: 140,
              title: "Peso Muerto",
              description: "112 kl",
              image: "assets/image/1.png",
              descriptionStyle: MyFitUiKit.util.cafeTextStyle.titleXL.copyWith(
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
            SizedBox(height: context.sizeHeight(0.02)),
            MyFitUiKit.widget.card.simpleCard(
                space: 0,
                onTap: () {
                  context.pushNamed("exerciseDetailPage");
                },
                imageSize: 140,
                title: "Peso Muerto",
                description: "78 kl",
                image: "assets/image/2.png",
                descriptionStyle:
                    MyFitUiKit.util.cafeTextStyle.titleXL.copyWith(
                  color: MyFitUiKit.util.color.primary,
                  shadows: [
                    const Shadow(
                      blurRadius: 5.0,
                      offset: Offset(2, 2),
                      color: Colors.black26,
                    ),
                  ],
                )),
            SizedBox(height: context.sizeHeight(0.02)),
            MyFitUiKit.widget.card.simpleCard(
              space: 0,
              onTap: () {
                context.pushNamed("exerciseDetailPage");
              },
              imageSize: 140,
              title: "front squat crossfit",
              image: "assets/image/3.png",
              description: "112 kl",
              descriptionStyle: MyFitUiKit.util.cafeTextStyle.titleXL.copyWith(
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
            SizedBox(height: context.sizeHeight(0.02)),
          ],
        ),
      ),
    );
  }
}
