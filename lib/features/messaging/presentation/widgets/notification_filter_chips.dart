import 'package:flutter/material.dart';

import '../../domain/entities/notification.dart';

class NotificationFilterChips extends StatelessWidget {
  final NotificationType? selectedType;
  final bool? selectedReadStatus;
  final ValueChanged<NotificationType?> onTypeChanged;
  final ValueChanged<bool?> onReadStatusChanged;

  const NotificationFilterChips({
    super.key,
    this.selectedType,
    this.selectedReadStatus,
    required this.onTypeChanged,
    required this.onReadStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 既読状態フィルター
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FilterChip(
                label: const Text('全て'),
                selected: selectedReadStatus == null,
                onSelected: (selected) {
                  if (selected) {
                    onReadStatusChanged(null);
                  }
                },
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('未読'),
                selected: selectedReadStatus == false,
                onSelected: (selected) {
                  onReadStatusChanged(selected ? false : null);
                },
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('既読'),
                selected: selectedReadStatus == true,
                onSelected: (selected) {
                  onReadStatusChanged(selected ? true : null);
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // 通知種別フィルター
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FilterChip(
                label: const Text('全種別'),
                selected: selectedType == null,
                onSelected: (selected) {
                  if (selected) {
                    onTypeChanged(null);
                  }
                },
              ),
              const SizedBox(width: 8),
              ...NotificationType.values.map((type) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      avatar: Icon(
                        _getTypeIcon(type),
                        size: 16,
                      ),
                      label: Text(type.displayName),
                      selected: selectedType == type,
                      onSelected: (selected) {
                        onTypeChanged(selected ? type : null);
                      },
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  IconData _getTypeIcon(NotificationType type) {
    switch (type) {
      case NotificationType.bookingConfirmed:
        return Icons.check_circle;
      case NotificationType.bookingReminder:
        return Icons.schedule;
      case NotificationType.serviceStarted:
        return Icons.play_circle;
      case NotificationType.serviceCompleted:
        return Icons.task_alt;
      case NotificationType.messageReceived:
        return Icons.message;
      case NotificationType.paymentSuccess:
        return Icons.payment;
      case NotificationType.paymentFailed:
        return Icons.error;
      case NotificationType.systemMaintenance:
        return Icons.build;
      case NotificationType.general:
        return Icons.info;
    }
  }
}
