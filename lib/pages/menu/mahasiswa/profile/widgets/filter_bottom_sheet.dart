import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';

class FilterBottomSheet extends StatefulWidget {
  final bool isDaftarKegiatan;
  const FilterBottomSheet({super.key, required this.isDaftarKegiatan});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 28,
        horizontal: 24,
      ),
      height: 520,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              thickness: 4,
              indent: 140,
              endIndent: 140,
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.filter_list,
                    color: Palette.red,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Filter',
                      style: kTextTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Palette.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Flexible(
              child: Text(
                widget.isDaftarKegiatan ? 'Pilih Semester' : 'Pilih Asal',
                style: kTextTheme.bodyMedium?.copyWith(
                  color: Palette.black.withOpacity(.5),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const DropdownField(),
            const SizedBox(height: 12),
            Flexible(
              child: Text(
                'Pilih Bulan',
                style: kTextTheme.bodyMedium?.copyWith(
                  color: Palette.black.withOpacity(.5),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const DropdownField(),
            const SizedBox(height: 12),
            widget.isDaftarKegiatan
                ? Container()
                : Flexible(
                    child: Text(
                      'Status',
                      style: kTextTheme.bodyMedium?.copyWith(
                        color: Palette.black.withOpacity(.5),
                      ),
                    ),
                  ),
            const SizedBox(height: 8),
            widget.isDaftarKegiatan
                ? Container()
                : Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(18),
                          ),
                          color: Palette.red.withOpacity(.10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check,
                              color: Palette.red,
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                'Sudah dibaca',
                                style: kTextTheme.bodyMedium?.copyWith(
                                  color: Palette.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(18),
                          ),
                        ),
                        child: Text(
                          'Belum dibaca',
                          style: kTextTheme.bodyMedium?.copyWith(
                            color: Palette.black.withOpacity(.5),
                          ),
                        ),
                      )
                    ],
                  ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(width: 0.5),
                ),
                onPressed: () {},
                child: Text(
                  'Apply',
                  style: kTextTheme.bodyLarge?.copyWith(
                    color: Palette.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownField extends StatelessWidget {
  const DropdownField({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: [],
      hint: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 18,
          ),
          Flexible(
            child: Text('All'),
          )
        ],
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Palette.white,
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
      ),
      onChanged: (value) {},
    );
  }
}
