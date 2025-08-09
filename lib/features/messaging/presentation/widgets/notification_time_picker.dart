import 'package:flutter/material.dart';

import '../../domain/entities/notification.dart';

class NotificationTimePicker extends StatelessWidget {
  final NotificationTime quietHours;
  final ValueChanged<NotificationTime> onChanged;

  const NotificationTimePicker({
    super.key,
    required this.quietHours,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _TimePickerTile(
                label: '開始時刻',
                time: TimeOfDay(
                  hour: quietHours.startHour,
                  minute: quietHours.startMinute,
                ),
                onTimeChanged: (time) {
                  onChanged(quietHours.copyWith(
                    startHour: time.hour,
                    startMinute: time.minute,
                  ));
                },
              ),
            ),
            const SizedBox(width: 16),
            const Icon(Icons.arrow_forward, color: Colors.grey),
            const SizedBox(width: 16),
            Expanded(
              child: _TimePickerTile(
                label: '終了時刻',
                time: TimeOfDay(
                  hour: quietHours.endHour,
                  minute: quietHours.endMinute,
                ),
                onTimeChanged: (time) {
                  onChanged(quietHours.copyWith(
                    endHour: time.hour,
                    endMinute: time.minute,
                  ));
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '現在の設定: ${_formatTimeRange()}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatTimeRange() {
    final startTime = TimeOfDay(
      hour: quietHours.startHour,
      minute: quietHours.startMinute,
    );
    final endTime = TimeOfDay(
      hour: quietHours.endHour,
      minute: quietHours.endMinute,
    );

    return '${_formatTime(startTime)} 〜 ${_formatTime(endTime)}';
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}

class _TimePickerTile extends StatelessWidget {
  final String label;
  final TimeOfDay time;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const _TimePickerTile({
    required this.label,
    required this.time,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
        ),
        const SizedBox(height: 4),
        InkWell(
          onTap: () => _showTimePicker(context),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.access_time, size: 20),
                const SizedBox(width: 8),
                Text(
                  _formatTime(time),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showTimePicker(BuildContext context) async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      onTimeChanged(selectedTime);
    }
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
