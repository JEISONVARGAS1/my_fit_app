import 'package:flutter/material.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomPanelWidget extends StatelessWidget {
  final Widget body;
  final double? maxHeight;
  final PanelController controller;
  final Widget Function(ScrollController) buildPanel;

  const CustomPanelWidget({
    super.key,
    this.maxHeight,
    required this.body,
    required this.controller,
    required this.buildPanel,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      body: body,
      minHeight: 0,
      backdropEnabled: true,
      controller: controller,
      panelBuilder: buildPanel,
      color: Colors.transparent,
      maxHeight: maxHeight ?? context.sizeHeight(0.8),
    );
  }
}
