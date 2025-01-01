import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_fit_app/features/smart_watch/provider/smart_watch_controller.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fit_ui_kit/models/button_model.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';
import 'package:my_fit_app/features/feeding_balance/ui/widget/feeding_header.dart';
import 'package:my_fit_app/features/feeding_balance/provider/feeding_balance_controller.dart';
import 'package:my_fit_app/features/feeding_balance/ui/widget/circular_progress_painter.dart';

class SmartWatchPage extends ConsumerStatefulWidget {
  const SmartWatchPage({super.key});

  @override
  ConsumerState<SmartWatchPage> createState() => _SmartWatchPage();
}

class _SmartWatchPage extends ConsumerState<SmartWatchPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(smartWatchControllerProvider.notifier).initPage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(feedingBalanceControllerProvider).value!;
    final provider = ref.read(feedingBalanceControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.sizeHeight(0.02),
            horizontal: context.sizeHeight(0.03),
          ),
          child: ListView(
            children: [
              FeedingHeader(),
              SizedBox(height: context.sizeHeight(0.05)),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: context.sizeHeight(0.2),
                  height: context.sizeHeight(0.2),
                  child: CustomPaint(
                    size: const Size(100, 100),
                    painter: CircularProgressPainter(state.percentage),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 5)
                        ],
                        color: MyFitUiKit.util.color.white,
                      ),
                      child: Text(
                        '${state.percentage.toInt()}%',
                        style: MyFitUiKit.util.cafeTextStyle.title.copyWith(
                            color: MyFitUiKit.util.color.backgroundButton),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.sizeHeight(0.1)),
              Column(
                spacing: context.sizeHeight(0.02),
                children: List.generate(
                  state.listFood.length,
                  (index) => MyFitUiKit.widget.card.productCard(
                    label: state.listFood[index].label,
                    onTap: () {},
                    firstValue: state.listFood[index].grams.toString(),
                    secondValue: state.listFood[index].calories.toString(),
                  ),
                ),
              ),
              SizedBox(height: context.sizeHeight(0.05)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: context.sizeWidth(0.07),
          right: context.sizeWidth(0.07),
          bottom: context.sizeHeight(0.05),
        ),
        child: MyFitUiKit.widget.button
            .formButton(ButtonModel(label: "Guardar", onTap: () {})),
      ),
    );
  }
}
