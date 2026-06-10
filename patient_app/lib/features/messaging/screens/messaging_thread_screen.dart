import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../profile/providers/patient_profile.provider.dart';
import '../providers/messaging_thread.provider.dart';
import '../widgets/medical_record_picker_sheet.dart';

class MessagingThreadScreen extends ConsumerStatefulWidget {
  const MessagingThreadScreen({required this.threadId, super.key});

  final String threadId;

  @override
  ConsumerState<MessagingThreadScreen> createState() =>
      _MessagingThreadScreenState();
}

class _MessagingThreadScreenState extends ConsumerState<MessagingThreadScreen> {
  final _scrollController = ScrollController();
  final _composerController = TextEditingController();
  final _selectedAttachments = <String>[];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _composerController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 120) {
      ref.read(messagingThreadProvider(widget.threadId).notifier).loadOlder();
    }
  }

  Future<void> _sendMessage() async {
    final body = _composerController.text;
    final attachments = List<String>.from(_selectedAttachments);
    if (body.trim().isEmpty && attachments.isEmpty) return;

    try {
      await ref
          .read(messagingThreadProvider(widget.threadId).notifier)
          .send(body: body, attachmentDocumentIds: attachments);
      if (!mounted) return;
      _composerController.clear();
      setState(_selectedAttachments.clear);
      await _scrollToLatest();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.messagingSendError),
        ),
      );
    }
  }

  Future<void> _pickAttachments() async {
    final picked = await showMedicalRecordPickerSheet(context);
    if (picked == null || picked.isEmpty) return;
    setState(() {
      for (final id in picked) {
        if (!_selectedAttachments.contains(id)) {
          _selectedAttachments.add(id);
        }
      }
    });
  }

  Future<void> _scrollToLatest() async {
    if (!_scrollController.hasClients) return;
    await Future<void>.delayed(const Duration(milliseconds: 50));
    if (!_scrollController.hasClients) return;
    _scrollController.jumpTo(0);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final threadAsync = ref.watch(messagingThreadProvider(widget.threadId));
    final profileAsync = ref.watch(patientProfileProvider);
    final currentUserId = profileAsync.valueOrNull?.id ?? '';

    return Scaffold(
      appBar: AppBar(
        title: threadAsync.maybeWhen(
          data: (state) => Text(doctorDisplayName(state.doctor)),
          orElse: () => Text(l10n.messagingTitle),
        ),
        actions: [
          IconButton(
            onPressed: () => ref
                .read(messagingThreadProvider(widget.threadId).notifier)
                .refresh(),
            icon: const Icon(Icons.refresh),
            tooltip: l10n.retry,
          ),
        ],
      ),
      body: threadAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.messagingLoadMessagesError),
              const SizedBox(height: GpsSpacing.md),
              FilledButton(
                onPressed: () =>
                    ref.invalidate(messagingThreadProvider(widget.threadId)),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
        data: (state) {
          final messages = state.messages;

          return Column(
            children: [
              if (state.isLoadingOlder)
                const LinearProgressIndicator(minHeight: 2),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => ref
                      .read(messagingThreadProvider(widget.threadId).notifier)
                      .pollLatest(),
                  child: messages.isEmpty
                      ? ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.5,
                              child: Center(child: Text(l10n.messagingEmpty)),
                            ),
                          ],
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          reverse: true,
                          padding: const EdgeInsets.all(GpsSpacing.md),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message =
                                messages[messages.length - 1 - index];
                            final isMine =
                                currentUserId.isNotEmpty &&
                                message.senderId == currentUserId;
                            return MessageBubble(
                              message: message,
                              isMine: isMine,
                              currentUserId: currentUserId,
                            );
                          },
                        ),
                ),
              ),
              MessageComposer(
                controller: _composerController,
                selectedAttachmentIds: _selectedAttachments,
                onAttach: _pickAttachments,
                onSend: _sendMessage,
                onRemoveAttachment: (id) {
                  setState(() => _selectedAttachments.remove(id));
                },
                enabled: !state.isSending,
              ),
            ],
          );
        },
      ),
    );
  }
}
