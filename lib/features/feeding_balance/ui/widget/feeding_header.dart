import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';

class FeedingHeader extends StatelessWidget {
  const FeedingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyFitUiKit.widget.button
            .goBackButton(onTap: () => context.pop(), isDark: false),
        SizedBox(width: context.sizeWidth(0.03)),
        Text(
          "Mi alimento",
          style: MyFitUiKit.util.cafeTextStyle.title,
        ),
        Spacer(),
        Material(
          color: MyFitUiKit.util.color.white,
          shape: CircleBorder(),
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: () {},
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
    );
  }
}
