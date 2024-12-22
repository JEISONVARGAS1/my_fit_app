import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePage();
}

class _HomePage extends ConsumerState<HomePage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.sizeHeight(0.02),
        horizontal: context.sizeHeight(0.03),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jeison Vargas",
            style: MyFitUiKit.util.cafeTextStyle.title.copyWith(fontSize: 20),
          ),
          Text(
            "Mi Inicio",
            style: MyFitUiKit.util.cafeTextStyle.titleXL,
          ),
          SizedBox(height: context.sizeHeight(0.02)),
          SizedBox(
            width: context.sizeWidth(),
            child: MyFitUiKit.widget.card.simpleCard(
              onTap: () {},
              cartType: CartType.green,
              title: "PROMO Proteinas !",
              image: "assets/image/1.png",
              description: "No te puedes quedar sin\ntus Proteinas 😏💪🏻",
            ),
          ),
          SizedBox(height: context.sizeHeight(0.05)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyFitUiKit.widget.button.smallButton(
                onTap: () {},
                label: "Mi Qr",
                icon: Icons.qr_code_2,
              ),
              MyFitUiKit.widget.button.smallButton(
                onTap: () {},
                label: "Asistencia",
                icon: Icons.assignment_ind_sharp,
              ),
              MyFitUiKit.widget.button.smallButton(
                onTap: () {},
                label: "Competencias",
                icon: Icons.emoji_events_outlined,
              ),
            ],
          ),
          SizedBox(height: context.sizeHeight(0.05)),
          Spacer(),
          Material(
            borderRadius: BorderRadius.circular(20),
            color: MyFitUiKit.util.color.card,
            child: Padding(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mi membrecía"),
                      Icon(
                        Icons.access_time_filled_rounded,
                        color: MyFitUiKit.util.color.primary,
                      )
                    ],
                  ),
                  SizedBox(height: context.sizeHeight(0.02)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tu mensualidad vence"),
                      Text("20 - 12 - 2024"),
                    ],
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: context.sizeHeight(0.05)),
        ],
      ),
    );
  }
}
