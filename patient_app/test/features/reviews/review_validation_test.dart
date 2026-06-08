import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/reviews/utils/review_validation.dart';

void main() {
  test('validateReviewRating rejects missing and out-of-range values', () {
    expect(validateReviewRating(null, 'required'), 'required');
    expect(validateReviewRating(0, 'required'), 'required');
    expect(validateReviewRating(6, 'required'), 'required');
    expect(validateReviewRating(3, 'required'), isNull);
  });

  test('validateReviewComment allows empty and rejects long text', () {
    expect(validateReviewComment(null, 'too long'), isNull);
    expect(validateReviewComment('', 'too long'), isNull);
    expect(
      validateReviewComment('a' * maxReviewCommentLength, 'too long'),
      isNull,
    );
    expect(
      validateReviewComment('a' * (maxReviewCommentLength + 1), 'too long'),
      'too long',
    );
  });
}
