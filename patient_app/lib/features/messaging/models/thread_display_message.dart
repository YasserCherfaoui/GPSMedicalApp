import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

enum MessageDeliveryState { pending, sent, read }

class ThreadDisplayMessage {
  const ThreadDisplayMessage({
    required this.id,
    required this.senderId,
    required this.body,
    required this.createdAt,
    this.attachments,
    this.readAt,
    this.isPending = false,
    this.sendFailed = false,
  });

  final String id;
  final String senderId;
  final String body;
  final DateTime createdAt;
  final BuiltList<MessageAttachmentsInner>? attachments;
  final DateTime? readAt;
  final bool isPending;
  final bool sendFailed;

  factory ThreadDisplayMessage.fromMessage(Message message) {
    return ThreadDisplayMessage(
      id: message.id ?? '',
      senderId: message.senderId ?? '',
      body: message.body ?? '',
      createdAt: message.createdAt ?? DateTime.now().toUtc(),
      attachments: message.attachments,
      readAt: message.readAt,
    );
  }

  ThreadDisplayMessage copyWith({
    String? id,
    String? senderId,
    String? body,
    DateTime? createdAt,
    BuiltList<MessageAttachmentsInner>? attachments,
    DateTime? readAt,
    bool? isPending,
    bool? sendFailed,
  }) {
    return ThreadDisplayMessage(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      attachments: attachments ?? this.attachments,
      readAt: readAt ?? this.readAt,
      isPending: isPending ?? this.isPending,
      sendFailed: sendFailed ?? this.sendFailed,
    );
  }

  MessageDeliveryState deliveryStateForSender(String currentUserId) {
    if (senderId != currentUserId) {
      return MessageDeliveryState.sent;
    }
    if (isPending) return MessageDeliveryState.pending;
    if (readAt != null) return MessageDeliveryState.read;
    return MessageDeliveryState.sent;
  }
}
