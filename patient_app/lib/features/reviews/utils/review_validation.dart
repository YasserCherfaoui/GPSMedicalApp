const maxReviewCommentLength = 1000;

String? validateReviewRating(int? rating, String requiredMessage) {
  if (rating == null || rating < 1 || rating > 5) {
    return requiredMessage;
  }
  return null;
}

String? validateReviewComment(String? comment, String tooLongMessage) {
  final trimmed = comment?.trim();
  if (trimmed == null || trimmed.isEmpty) return null;
  if (trimmed.length > maxReviewCommentLength) {
    return tooLongMessage;
  }
  return null;
}
