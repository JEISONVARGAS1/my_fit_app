import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fit_ui_kit/models/button_model.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';
import 'package:my_fit_app/features/auth/provider/auth_controller.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPage();
}

class _AuthPage extends ConsumerState<AuthPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider).value!;
    final provider = ref.read(authControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: context.sizeHeight(0.03),
              vertical: context.sizeHeight(0.02)),
          children: [
            Text(
              "Bienvenido a",
              style: MyFitUiKit.util.cafeTextStyle.title,
              textAlign: TextAlign.center,
            ),
            Text(
              "MY FITAPP",
              textAlign: TextAlign.center,
              style: MyFitUiKit.util.cafeTextStyle.titleXL.copyWith(
                color: MyFitUiKit.util.color.primary,
              ),
            ),
            SizedBox(height: context.sizeHeight(0.15)),
            MyFitUiKit.widget.form.input(
              label: "Correo Electronico",
              controller: state.emailController,
            ),
            SizedBox(height: context.sizeHeight(0.03)),
            MyFitUiKit.widget.form.passwordInput(
              label: "Contraseña",
              controller: state.passwordController,
            ),
            SizedBox(height: context.sizeHeight(0.17)),
            MyFitUiKit.widget.button.formButton(
              ButtonModel(
                label: "Continuar",
                type: ButtonType.enable,
                onTap: () => context.pushNamed("lobby"),
              ),
            ),
            SizedBox(height: context.sizeHeight(0.1)),
            Text(
              "No Tengo una cuenta",
              style: MyFitUiKit.util.cafeTextStyle.description,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.sizeHeight(0.01)),
            Text(
              "Registrarme",
              style: MyFitUiKit.util.cafeTextStyle.description.copyWith(
                color: MyFitUiKit.util.color.primary,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
