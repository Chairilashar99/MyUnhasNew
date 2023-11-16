import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/controllers/login_controllers.dart';
import 'package:my_unhas_new/pages/widgets/alert_bottomsheet.dart';
import 'package:my_unhas_new/pages/widgets/blur_background_container.dart';

class LoginModal extends StatelessWidget {
  const LoginModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());

    return BlurBackgroundContainer(
      modal: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 24,
          ),
          height: 520,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Palette.white.withOpacity(.94),
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Text(
                      'Masuk',
                      style: kTextTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Login menggunakan username dan password di Neosia',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const SignInForm(),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -48,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Palette.white,
                      child: Icon(
                        Icons.close,
                        color: Palette.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<LoginController>();

    return Stack(
      children: [
        FormBuilder(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Username",
                style: TextStyle(
                  color: Palette.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: FormBuilderTextField(
                  name: 'username',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Harap isi username terlebih dahulu',
                    ),
                  ]),
                  controller: controller.usernameEditingController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.grey),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Palette.pink,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorStyle: const TextStyle(height: 1),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Palette.red,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.person_rounded,
                            size: 18,
                            color: Palette.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "Password",
                style: TextStyle(
                  color: Palette.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: Obx(() {
                  return FormBuilderTextField(
                    name: 'password',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Harap isi password terlebih dahulu',
                      ),
                    ]),
                    controller: controller.passwordEditingController,
                    obscureText: !controller.passwordVisible.value,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Palette.grey),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Palette.pink,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          controller.passwordVisible.value =
                              !controller.passwordVisible.value;
                        },
                        icon: Icon(
                          controller.passwordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Palette.red,
                        ),
                      ),
                      errorStyle: const TextStyle(height: 1),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Palette.red),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Palette.red),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Palette.red,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.lock,
                              size: 18,
                              color: Palette.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  if (!controller.isAttempt.value) {
                    var validate = controller.validate();
                    if (validate.isNotEmpty) {
                      showErrorAlert(validate, context);
                      return;
                    }
                    try {
                      var errors = await controller.login();
                      if (errors.isNotEmpty) {
                        showErrorAlert(errors, context);
                      }
                    } catch (e) {
                      showErrorAlert(
                          ['Terjadi kesalahan saat login.'], context);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Palette.red,
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
                icon: Obx(() {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (controller.isAttempt.value)
                        const CircularProgressIndicator(
                          color: Palette.white,
                        )
                      else
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Palette.white,
                          size: 18,
                        ),
                    ],
                  );
                }),
                label: const Text(
                  'Masuk',
                  style: TextStyle(color: Palette.white),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void showErrorAlert(List<String> errors, BuildContext context) {
    showNotificationDialog(
      icon: const Icon(
        Icons.error,
        color: Palette.red,
        size: 50,
      ),
      title: "Login gagal",
      messages: errors,
      context: context,
    );
  }
}
