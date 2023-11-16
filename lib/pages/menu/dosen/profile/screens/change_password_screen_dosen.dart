import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/detail_profile_app_bar.dart';
import 'package:my_unhas_new/pages/widgets/change_password_field.dart';

class ChangePasswordScreenDosen extends StatefulWidget {
  const ChangePasswordScreenDosen({super.key});

  @override
  State<ChangePasswordScreenDosen> createState() =>
      _ChangePasswordScreenDosenState();
}

class _ChangePasswordScreenDosenState extends State<ChangePasswordScreenDosen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _newPasswordController;
  late final TextEditingController _repeatPasswordController;

  @override
  void initState() {
    _newPasswordController = TextEditingController();
    _repeatPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(
        title: 'Ganti Password',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    ChangePasswordField(
                      controller: _newPasswordController,
                      label: 'Password',
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Harap diisi terlebih dahulu';
                        }
                        return null;
                      },
                    ),
                    ChangePasswordField(
                      controller: _repeatPasswordController,
                      label: 'Repeat Password',
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Harap diisi terlebih dahulu';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.red,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // do something
                    }
                  },
                  child: const Text('Ganti'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
