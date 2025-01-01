import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';
import 'package:my_fit_app/features/exercise_detail/ui/widget/curved_rectangle_painter.dart';

class HeaderExerciseDetail extends StatelessWidget {
  const HeaderExerciseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: SCurvePainter(),
          child: Container(
            height: context.sizeHeight(0.32),
            padding: EdgeInsets.symmetric(
              vertical: context.sizeHeight(0.02),
              horizontal: context.sizeHeight(0.03),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.sizeHeight(0.05)),
                Row(
                  children: [
                    MyFitUiKit.widget.button.goBackButton(
                      isDark: true,
                      onTap: () => context.pop(),
                    ),
                    SizedBox(width: context.sizeWidth(0.03)),
                    Text(
                      "Peso Muerto",
                      style: MyFitUiKit.util.cafeTextStyle.title.copyWith(
                        color: MyFitUiKit.util.color.backgroundButton,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            offset: Offset(2, 2),
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.sizeHeight(0.03)),
                Text(
                  "120 KL",
                  style: MyFitUiKit.util.cafeTextStyle.titleXL.copyWith(
                    color: MyFitUiKit.util.color.backgroundButton,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        offset: Offset(2, 2),
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 40,
          child: Image(
            image: AssetImage("assets/image/1.png"),
            height: 250,
          ),
        )
      ],
    );
  }
}
