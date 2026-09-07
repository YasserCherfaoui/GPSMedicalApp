import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/specialist_messaging.provider.dart';
import '../widgets/specialist_thread_row_tile.dart';

class SpecialistMessagingThreadScreen extends ConsumerStatefulWidget {
  const SpecialistMessagingThreadScreen({required this.threadId, super.key});

  final String threadId;

  @override
  ConsumerState<SpecialistMessagingThreadScreen> createState() =>
      _SpecialistMessagingThreadScreenState();
}

class _SpecialistMessagingThreadScreenState
    extends ConsumerState<SpecialistMessagingThreadScreen> {
  final _scrollController = ScrollController();
  final _composerController = TextEditingController();
  final _selectedAttachments = <String>[];
  String _currentUserId = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadCurrentUserId();
  }

  Future<void> _loadCurrentUserId() async {
    try {
      final response = await ref.read(gpsMedicalClientProvider).auth.getMe();
      if (!mounted) return;
      setState(() => _currentUserId = response.data?.id ?? '');
    } catch (_) {
      // Presence/typing filters degrade gracefully without user id.
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _composerController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 120) {
      ref
          .read(specialistMessagingThreadProvider(widget.threadId).notifier)
          .loadOlder();
    }
  }

  void _onComposerChanged(String value) {
    if (value.trim().isEmpty) return;
    ref.read(messagingWebSocketClientProvider)?.sendTyping(widget.threadId);
  }

  Future<void> _sendMessage() async {
    final body = _composerController.text;
    if (body.trim().isEmpty) return;
    try {
      await ref
          .read(specialistMessagingThreadProvider(widget.threadId).notifier)
          .send(body: body);
      if (!mounted) return;
      _composerController.clear();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.messagingSendError)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final threadAsync = ref.watch(
      specialistMessagingThreadProvider(widget.threadId),
    );
    final typing = ref.watch(threadTypingProvider(widget.threadId));
    final peerTyping =
        typing != null &&
        typing.isActive &&
        typing.userId.isNotEmpty &&
        (_currentUserId.isEmpty || typing.userId != _currentUserId);
    final peerId = threadAsync.valueOrNull?.thread.patientId;
    final peerPresence = ref.watch(userPresenceProvider(peerId));

    return Scaffold(
      appBar: AppBar(
        title: threadAsync.maybeWhen(
          data: (state) => PresenceTitle(
            label: patientThreadDisplayLabel(l10n, state.thread),
            presence: peerPresence,
          ),
          orElse: () => Text(l10n.messagingTitle),
        ),
      ),
      body: threadAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => ErrorState(
          title: l10n.messagingLoadMessagesError,
          onRetry: () => ref.invalidate(
            specialistMessagingThreadProvider(widget.threadId),
          ),
        ),
        data: (state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  padding: const EdgeInsets.all(GpsSpacing.md),
                  itemCount:
                      state.messages.length + (state.isLoadingOlder ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= state.messages.length) {
                      return const Padding(
                        padding: EdgeInsets.all(GpsSpacing.md),
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    }
                    final reversedIndex = state.messages.length - 1 - index;
                    final message = state.messages[reversedIndex];
                    final isMine = _currentUserId.isNotEmpty &&
                        message.senderId == _currentUserId;
                    return MessageBubble(
                      message: message,
                      isMine: isMine,
                      currentUserId: _currentUserId,
                    );
                  },
                ),
              ),
              TypingIndicator(visible: peerTyping),
              MessageComposer(
                controller: _composerController,
                selectedAttachmentIds: _selectedAttachments,
                onAttach: () {},
                onChanged: _onComposerChanged,
                onRemoveAttachment: (id) {
                  setState(() => _selectedAttachments.remove(id));
                },
                onSend: _sendMessage,
                enabled: !state.isSending,
              ),
            ],
          );
        },
      ),
    );
  }
}
