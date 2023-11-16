import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/widgets/schedule_card.dart';

class JadwalPageWali extends StatefulWidget {
  const JadwalPageWali({super.key});

  @override
  State<JadwalPageWali> createState() => _JadwalPageWaliState();
}

class _JadwalPageWaliState extends State<JadwalPageWali> {
  List<ScheduleCard> schedules = [
    const ScheduleCard(
      title: 'Bahasa Indonesia',
      time: '16.30 - 17.30 WITA',
      code: 'MKU 213',
      subtitle: 'Bahasa Indonesia A',
      label: 'Wajib',
    ),
    const ScheduleCard(
      title: 'Bahasa Inggris',
      time: '13.30 - 15.00 WITA',
      code: 'MKU 222',
      subtitle: 'Bahasa Inggris A',
      label: 'Perminatan',
    ),
  ];

  //category
  int selectedCategoryIndex = 0;
  final List<String> jadwalMatakuliah = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: RichText(
                  text: TextSpan(
                    style: kTextTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Jadwal Matakuliah | ',
                        style: kTextTheme.titleSmall?.copyWith(
                          color: Palette.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Semester 7',
                        style: kTextTheme.titleSmall?.copyWith(
                          color: Palette.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: jadwalMatakuliah.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: Builder(
                        builder: (BuildContext context) {
                          bool isSelected = index == selectedCategoryIndex;
                          Color backgroundColor = isSelected
                              ? Palette.pinkDark.withOpacity(0.3)
                              : Palette.white;
                          Color textColor =
                              isSelected ? Palette.red : Palette.black;
                          return Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              left: 10,
                              right:
                                  index == jadwalMatakuliah.length - 1 ? 20 : 0,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(12),
                              border: isSelected
                                  ? null
                                  : Border.all(color: Palette.black),
                            ),
                            child: Text(
                              jadwalMatakuliah[index],
                              style: TextStyle(
                                color: textColor,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: schedules.map((schedule) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ScheduleCard(
                      title: schedule.title,
                      time: schedule.time,
                      code: schedule.code,
                      subtitle: schedule.subtitle,
                      label: schedule.label,
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
