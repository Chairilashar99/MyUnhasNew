import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:table_calendar/table_calendar.dart';

class AcademicEvent {
  final String title;
  final String description;

  AcademicEvent({required this.title, required this.description});
}

class KalenderpageMahasiswa extends StatefulWidget {
  const KalenderpageMahasiswa({Key? key}) : super(key: key);

  @override
  _KalenderpageMahasiswaState createState() => _KalenderpageMahasiswaState();
}

class _KalenderpageMahasiswaState extends State<KalenderpageMahasiswa> {
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  Map<DateTime, List<AcademicEvent>> academicEvents = {
    DateTime.utc(2023, 9, 7): [
      AcademicEvent(
          title: 'Dies Natalis Universitas Hasanuddin',
          description: '7 September 2023'),
      AcademicEvent(
          title: 'Unhas Carrer Expo 2023', description: '7 September 2023'),
    ],
    DateTime.utc(2023, 9, 15): [
      AcademicEvent(
          title: 'Wisuda Periode September 2023/2024',
          description: '15 September 2023'),
    ],
  };

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
                child: Text(
                  'Kalender Akademik',
                  style: kTextTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TableCalendar(
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                firstDay: DateTime.utc(DateTime.now().year, 1, 1),
                lastDay: DateTime.utc(DateTime.now().year + 50, 12, 31),
                focusedDay: focusedDay,
                selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    this.selectedDay = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                },
                calendarFormat: CalendarFormat.month,
                calendarStyle: const CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Palette.pinkDark,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Palette.pinkDark,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(
                    color: Palette.pinkDark,
                  ),
                  markerDecoration: BoxDecoration(
                    color: Palette.red,
                    shape: BoxShape.circle,
                  ),
                ),
                eventLoader: (day) => academicEvents[day] ?? [],
              ),
              ...(() {
                List<AcademicEvent> events = academicEvents[selectedDay] ?? [];
                if (events.isEmpty) {
                  return [
                    Center(
                      child: Text(
                        "Tidak ada acara untuk tanggal ini.",
                        style: kTextTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ];
                }
                return events.asMap().entries.map((entry) {
                  int idx = entry.key;
                  AcademicEvent event = entry.value;
                  return Stack(
                    children: [
                      Container(
                        height: 68,
                        margin: const EdgeInsets.only(bottom: 10, left: 16),
                        width: MediaQuery.of(context).size.width - 16,
                        decoration: BoxDecoration(
                          color: Palette.pinkDark.withOpacity(0.3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(left: 45),
                          title: Text(
                            event.title,
                            style: kTextTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            event.description,
                            style: kTextTheme.bodyMedium?.copyWith(
                              color: Palette.black,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 13,
                        child: CircleAvatar(
                          backgroundColor: Palette.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            (idx + 1).toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList();
              })(),
            ],
          ),
        ),
      ),
    );
  }
}
