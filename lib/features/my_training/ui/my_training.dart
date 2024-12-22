import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';
import 'package:my_fit_ui_kit/extension/cafe_text_style_extension.dart';

class MyTrainingPage extends ConsumerStatefulWidget {
  const MyTrainingPage({super.key});

  @override
  ConsumerState<MyTrainingPage> createState() => _MyTrainingPage();
}

class _MyTrainingPage extends ConsumerState<MyTrainingPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: context.sizeHeight(0.02),
        horizontal: context.sizeHeight(0.03),
      ),
      children: [
        Text(
          "Jeison Vargas",
          style: MyFitUiKit.util.cafeTextStyle.title.copyWith(fontSize: 20),
        ),
        Text(
          "Mi Entreno",
          style: MyFitUiKit.util.cafeTextStyle.titleXL,
        ),
        SizedBox(height: context.sizeHeight(0.02)),
        MyFitUiKit.widget.card.simpleCard(
            space: 0,
            onTap: () {},
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
            )),
        SizedBox(height: context.sizeHeight(0.02)),
        MyFitUiKit.widget.card.simpleCard(
            space: 0,
            onTap: () {},
            imageSize: 140,
            title: "Peso Muerto",
            description: "78 kl",
            image: "assets/image/2.png",
            descriptionStyle: MyFitUiKit.util.cafeTextStyle.titleXL.copyWith(
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
          onTap: () {},
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
    );
  }
}
