import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/gps_spacing.dart';

/// Six single-digit boxes with auto-focus advance and [onCompleted].
class OtpPinInput extends StatefulWidget {
  const OtpPinInput({
    required this.onChanged,
    required this.onCompleted,
    super.key,
    this.length = 6,
    this.enabled = true,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;
  final int length;
  final bool enabled;

  @override
  State<OtpPinInput> createState() => _OtpPinInputState();
}

class _OtpPinInputState extends State<OtpPinInput> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get _code => _controllers.map((c) => c.text).join();

  void _onDigitChanged(int index, String value) {
    if (value.length > 1) {
      _controllers[index].text = value.substring(value.length - 1);
    }
    final code = _code;
    widget.onChanged(code);
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    if (RegExp(r'^\d{6}$').hasMatch(code)) {
      widget.onCompleted(code);
    }
  }

  KeyEventResult _onKey(int index, KeyEvent event) {
    if (event is! KeyDownEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: 48,
          child: Focus(
            onKeyEvent: (node, event) => _onKey(index, event),
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              enabled: widget.enabled,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: Theme.of(context).textTheme.headlineSmall,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.symmetric(vertical: GpsSpacing.sm),
              ),
              onChanged: (v) => _onDigitChanged(index, v),
            ),
          ),
        );
      }),
    );
  }
}
