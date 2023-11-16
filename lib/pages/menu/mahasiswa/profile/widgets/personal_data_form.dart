import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/input_data_field.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/personal_data_field.dart';

class PersonalDataForm extends StatefulWidget {
  final String title;
  final Map<String, String?> dataMap;

  const PersonalDataForm({
    super.key,
    required this.title,
    required this.dataMap,
  });

  @override
  State<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<TextEditingController> editingControllers = [];

  late final ValueNotifier<Map<String, String?>> formNotifier;
  late final ValueNotifier<bool> isEditNotifier;

  @override
  void initState() {
    formNotifier = ValueNotifier({});
    isEditNotifier = ValueNotifier(false);
    for (var i = 0; i < widget.dataMap.length; i++) {
      editingControllers.add(TextEditingController());
    }

    super.initState();
  }

  @override
  void dispose() {
    formNotifier.dispose();
    isEditNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labels = widget.dataMap.keys.toList();
    final values = widget.dataMap.values.toList();

    return ValueListenableBuilder(
      valueListenable: isEditNotifier,
      builder: (context, isEdit, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Palette.onDisableColor,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: kTextTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: formNotifier,
                      builder: (context, value, child) {
                        return IconButton(
                          onPressed: () {
                            if (isEdit) {
                              formKey.currentState!.save();
                            }
                            if (!isEditNotifier.value) {
                              isEditNotifier.value = true;
                            }
                          },
                          tooltip: isEdit ? 'Save' : 'Edit',
                          icon: Icon(
                            isEdit ? Icons.check_rounded : Icons.edit_rounded,
                            size: 18,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < widget.dataMap.length; i++) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                      child: isEdit
                          ? Builder(
                              builder: (context) {
                                return InputDataField(
                                  action: (v) {
                                    editingControllers[i].text;
                                  },
                                  controller: editingControllers[i],
                                  hintText: '....',
                                  initialValue: values[i],
                                );
                              },
                            )
                          : PersonalDataField(
                              label: labels[i],
                              value: values[i],
                            ),
                    )
                  ],
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
