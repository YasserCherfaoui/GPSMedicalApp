import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class TagListInput extends StatefulWidget {
  const TagListInput({
    required this.tags,
    required this.onChanged,
    required this.label,
    required this.hint,
    required this.addLabel,
    this.errorText,
    super.key,
  });

  final List<String> tags;
  final ValueChanged<List<String>> onChanged;
  final String label;
  final String hint;
  final String addLabel;
  final String? errorText;

  @override
  State<TagListInput> createState() => _TagListInputState();
}

class _TagListInputState extends State<TagListInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTag() {
    final value = _controller.text.trim();
    if (value.isEmpty || widget.tags.contains(value)) return;
    widget.onChanged([...widget.tags, value]);
    _controller.clear();
  }

  void _removeTag(String tag) {
    widget.onChanged(widget.tags.where((t) => t != tag).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: GpsSpacing.xs),
        if (widget.tags.isNotEmpty)
          Wrap(
            spacing: GpsSpacing.xs,
            runSpacing: GpsSpacing.xs,
            children: [
              for (final tag in widget.tags)
                InputChip(
                  label: Text(tag),
                  onDeleted: () => _removeTag(tag),
                ),
            ],
          ),
        if (widget.tags.isNotEmpty) const SizedBox(height: GpsSpacing.sm),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  errorText: widget.errorText,
                ),
                onSubmitted: (_) => _addTag(),
              ),
            ),
            const SizedBox(width: GpsSpacing.sm),
            TextButton(onPressed: _addTag, child: Text(widget.addLabel)),
          ],
        ),
      ],
    );
  }
}
