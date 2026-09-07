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

  test('rethrowBookingApiError maps 422 when error rows are Map<dynamic,dynamic>', () {
    expect(
      () => rethrowBookingApiError(
        DioException(
          requestOptions: RequestOptions(path: '/appointments'),
          response: Response(
            requestOptions: RequestOptions(path: '/appointments'),
            statusCode: 422,
            data: <dynamic, dynamic>{
              'errors': <dynamic>[
                <dynamic, dynamic>{
                  'field': 'clinic_id',
                  'message': 'requis',
                },
              ],
            },
          ),
        ),
      ),
      throwsA(
        predicate<BookingValidationException>(
          (e) => e.fieldErrors['clinic_id'] == 'requis',
        ),
      ),
    );
  });

  test('rethrowBookingApiError maps problem+json to BookingApiException', () {
    expect(
      () => rethrowBookingApiError(
        DioException(
          requestOptions: RequestOptions(path: '/appointments'),
          response: Response(
            requestOptions: RequestOptions(path: '/appointments'),
            statusCode: 404,
            data: {
              'title': 'Service introuvable',
              'status': 404,
            },
          ),
        ),
      ),
      throwsA(
        predicate<BookingApiException>(
          (e) => e.statusCode == 404 && e.title == 'Service introuvable',
        ),
      ),
    );
  });

  test('bookingSubmitErrorMessage prefers API title', () {
    expect(
      bookingSubmitErrorMessage(
        const BookingApiException(
          statusCode: 500,
          title: 'Erreur interne',
        ),
        'Network error',
      ),
      'Erreur interne',
    );
  });
}
