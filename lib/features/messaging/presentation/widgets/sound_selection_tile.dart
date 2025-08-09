import 'package:flutter/material.dart';

class SoundSelectionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String soundType;
  final bool soundEnabled;
  final ValueChanged<bool> onSoundEnabledChanged;
  final ValueChanged<String> onSoundTypeChanged;

  const SoundSelectionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.soundType,
    required this.soundEnabled,
    required this.onSoundEnabledChanged,
    required this.onSoundTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        soundEnabled ? Icons.volume_up : Icons.volume_off,
        color: soundEnabled ? Theme.of(context).primaryColor : null,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (soundEnabled) ...[
            TextButton(
              onPressed: () => _showSoundSelection(context),
              child: const Text('変更'),
            ),
            const SizedBox(width: 8),
          ],
          Switch(
            value: soundEnabled,
            onChanged: onSoundEnabledChanged,
          ),
        ],
      ),
      onTap: soundEnabled
          ? () => _showSoundSelection(context)
          : () => onSoundEnabledChanged(true),
    );
  }

  Future<void> _showSoundSelection(BuildContext context) async {
    final soundOptions = [
      {'value': 'default', 'label': 'デフォルト'},
      {'value': 'gentle', 'label': 'やさしい音'},
      {'value': 'chime', 'label': 'チャイム'},
      {'value': 'bell', 'label': 'ベル'},
      {'value': 'notification', 'label': '通知音'},
    ];

    final selectedSound = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('通知音を選択'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: soundOptions.map((sound) {
              final value = sound['value']!;
              final label = sound['label']!;

              return RadioListTile<String>(
                title: Text(label),
                value: value,
                groupValue: soundType,
                onChanged: (selectedValue) {
                  Navigator.of(context).pop(selectedValue);
                },
                secondary: IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () => _playTestSound(value),
                  tooltip: 'テスト再生',
                ),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('キャンセル'),
          ),
        ],
      ),
    );

    if (selectedSound != null && selectedSound != soundType) {
      onSoundTypeChanged(selectedSound);
    }
  }

  void _playTestSound(String soundType) {
    // テスト音声再生の実装
    // 実際の実装では audio_service や soundpool などを使用
    debugPrint('Playing test sound: $soundType');
  }
}
