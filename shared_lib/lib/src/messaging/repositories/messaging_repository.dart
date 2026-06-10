import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class MessagingThreadItem {
  const MessagingThreadItem({required this.thread, this.lastMessagePreview});

  final Thread thread;
  final String? lastMessagePreview;
}

class MessagingRepository {
  MessagingRepository(this._client);

  final GpsMedicalClient _client;

  Future<({List<MessagingThreadItem> threads, bool hasMore})> listThreads({
    required int page,
    int pageSize = 20,
    bool includePreviews = true,
  }) async {
    final response = await _client.messaging.listMessagingThreads(
      page: page,
      pageSize: pageSize,
    );
    final paginated = response.data;
    final items = paginated?.data?.toList() ?? [];
    final meta = paginated?.meta;
    final total = meta?.total ?? items.length;
    final currentPage = meta?.page ?? page;
    final size = meta?.pageSize ?? pageSize;
    final totalPages = meta?.totalPages;
    final hasMore = totalPages != null
        ? currentPage < totalPages
        : currentPage * size < total;

    if (!includePreviews || items.isEmpty) {
      return (
        threads: items
            .map((thread) => MessagingThreadItem(thread: thread))
            .toList(),
        hasMore: hasMore,
      );
    }

    final previews = await Future.wait(
      items.map((thread) => _fetchLatestPreview(thread.id)),
    );

    final threads = <MessagingThreadItem>[];
    for (var i = 0; i < items.length; i++) {
      threads.add(
        MessagingThreadItem(thread: items[i], lastMessagePreview: previews[i]),
      );
    }

    return (threads: threads, hasMore: hasMore);
  }

  Future<String?> _fetchLatestPreview(String? threadId) async {
    if (threadId == null || threadId.isEmpty) return null;

    try {
      final response = await _client.messaging
          .listMessagingThreadMessages(threadId: threadId, limit: 1);
      final messages = response.data;
      if (messages == null || messages.isEmpty) return null;
      return _rawPreviewFromMessage(messages.first);
    } catch (_) {
      return null;
    }
  }

  Future<Thread> getThread(String threadId) async {
    final response = await _client.messaging.getMessagingThread(
      threadId: threadId,
    );
    final thread = response.data;
    if (thread == null) {
      throw StateError('Thread not found');
    }
    return thread;
  }

  Future<List<Message>> listMessages(
    String threadId, {
    DateTime? before,
    int limit = 50,
  }) async {
    final response = await _client.messaging
        .listMessagingThreadMessages(
          threadId: threadId,
          before: before,
          limit: limit,
        );
    return response.data?.toList() ?? [];
  }

  Future<Message> sendMessage(
    String threadId, {
    String? body,
    List<String>? attachmentDocumentIds,
  }) async {
    final response = await _client.messaging
        .createMessagingThreadMessage(
          threadId: threadId,
          messageCreate: MessageCreate((b) {
            final trimmed = body?.trim();
            if (trimmed != null && trimmed.isNotEmpty) {
              b.body = trimmed;
            }
            if (attachmentDocumentIds != null &&
                attachmentDocumentIds.isNotEmpty) {
              b.attachmentDocumentIds.replace(
                BuiltList<String>(attachmentDocumentIds),
              );
            }
          }),
        );
    final message = response.data;
    if (message == null) {
      throw StateError('Empty message response');
    }
    return message;
  }

  Future<void> markMessageRead(String messageId) async {
    await _client.messaging.markMessagingMessageRead(
      messageId: messageId,
    );
  }

  String? _rawPreviewFromMessage(Message message) {
    final body = message.body?.trim();
    if (body != null && body.isNotEmpty) {
      return body.length > 120 ? '${body.substring(0, 120)}…' : body;
    }
    final attachments = message.attachments;
    if (attachments != null && attachments.isNotEmpty) {
      final first = attachments.first;
      final name = first.fileName?.trim();
      if (name != null && name.isNotEmpty) return name;
      return 'attachment';
    }
    return null;
  }
}
