import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/booking/utils/booking_api_error.dart';

void main() {
  test('rethrowBookingApiError maps 422 field errors', () {
    expect(
      () => rethrowBookingApiError(
        DioException(
          requestOptions: RequestOptions(path: '/appointments'),
          response: Response(
            requestOptions: RequestOptions(path: '/appointments'),
            statusCode: 422,
            data: {
              'type': 'about:blank',
              'title': 'Validation Error',
              'status': 422,
              'errors': [
                {'field': 'reason', 'message': 'Trop long'},
              ],
            },
          ),
        ),
      ),
      throwsA(
        predicate<BookingValidationException>(
          (e) => e.fieldErrors['reason'] == 'Trop long',
        ),
      ),
    );
  });

  test('rethrowBookingApiError maps 409 SLOT_TAKEN', () {
    expect(
      () => rethrowBookingApiError(
        DioException(
          requestOptions: RequestOptions(path: '/appointments'),
          response: Response(
            requestOptions: RequestOptions(path: '/appointments'),
            statusCode: 409,
            data: {
              'type': 'about:blank',
              'title': 'Conflict',
              'status': 409,
              'code': 'SLOT_TAKEN',
              'detail': 'Créneau pris',
            },
          ),
        ),
      ),
      throwsA(isA<SlotTakenException>()),
    );
  });
}
