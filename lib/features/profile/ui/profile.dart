import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:my_fit_ui_kit/models/button_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fit_app/core/extension/context_extension.dart';
import 'package:my_fit_app/features/profile/provider/profile_controller.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileControllerProvider).value!;
    final provider = ref.read(profileControllerProvider.notifier);
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: context.sizeHeight(0.02),
        horizontal: context.sizeHeight(0.03),
      ),
      children: [
        SizedBox(height: context.sizeHeight(0.03)),
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            child: Stack(
              fit: StackFit.loose,
              children: [
                Material(
                  color: MyFitUiKit.util.color.card,
                  shape: CircleBorder(),
                  child: InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 0,
                  child: InkWell(
                    customBorder: CircleBorder(),
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyFitUiKit.util.color.card,
                        border: Border.all(
                          width: 3,
                          color: MyFitUiKit.util.color.backgroundButton,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Icon(
                          Icons.camera_alt,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: context.sizeHeight(0.05)),
        MyFitUiKit.widget.form.input(
          label: "Nombre",
          controller: state.emailController,
        ),
        SizedBox(height: context.sizeHeight(0.025)),
        MyFitUiKit.widget.form.input(
          label: "Apellido",
          controller: state.emailController,
        ),
        SizedBox(height: context.sizeHeight(0.025)),
        MyFitUiKit.widget.form.input(
          label: "Numero de Telefono",
          controller: state.emailController,
        ),
        SizedBox(height: context.sizeHeight(0.025)),
        MyFitUiKit.widget.form.input(
          label: "Direccion",
          controller: state.emailController,
        ),
        SizedBox(height: context.sizeHeight(0.1)),
        MyFitUiKit.widget.button.formButton(
          ButtonModel(
            label: "Editar",
            type: ButtonType.enable,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
