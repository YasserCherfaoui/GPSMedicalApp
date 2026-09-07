import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Bottom sheet: patient sends a first-contact message request (no appointment).
Future<void> showMessageRequestSheet(
  BuildContext context,
  WidgetRef ref, {
  required String doctorId,
  required String doctorName,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => _MessageRequestSheet(
      doctorId: doctorId,
      doctorName: doctorName,
    ),
  );
}

class _MessageRequestSheet extends ConsumerStatefulWidget {
  const _MessageRequestSheet({
    required this.doctorId,
    required this.doctorName,
  });

  final String doctorId;
  final String doctorName;

  @override
  ConsumerState<_MessageRequestSheet> createState() =>
      _MessageRequestSheetState();
}

class _MessageRequestSheetState extends ConsumerState<_MessageRequestSheet> {
  final _controller = TextEditingController();
  var _sending = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context)!;
    final body = _controller.text.trim();
    if (body.isEmpty) return;
    setState(() => _sending = true);
    try {
      final created = await ref
          .read(engagementRepositoryProvider)
          .createMessagingRequest(doctorId: widget.doctorId, body: body);
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.engagementMessageRequestSuccess)),
      );
      context.push(GpsRoutes.messagingThreadDetail(created.threadId));
    } on DioException catch (e) {
      if (!mounted) return;
      final code = e.response?.statusCode;
      final msg = code == 403
          ? l10n.engagementMessageRequestQuota
          : l10n.engagementMessageRequestError;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.engagementMessageRequestError)),
      );
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        GpsSpacing.lg,
        GpsSpacing.lg,
        GpsSpacing.lg,
        GpsSpacing.lg + bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.engagementMessageRequestTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: GpsSpacing.xs),
          Text(
            widget.doctorName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GpsSpacing.md),
          TextField(
            controller: _controller,
            maxLength: 1000,
            maxLines: 4,
            enabled: !_sending,
            decoration: InputDecoration(
              hintText: l10n.engagementMessageRequestHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: GpsSpacing.md),
          PrimaryButton(
            label: l10n.engagementMessageRequestSend,
            onPressed: _sending ? null : _submit,
          ),
        ],
      ),
    );
  }
}
