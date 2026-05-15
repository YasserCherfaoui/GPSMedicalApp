//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:gps_medical_api/src/date_serializer.dart';
import 'package:gps_medical_api/src/model/date.dart';

import 'package:gps_medical_api/src/model/address.dart';
import 'package:gps_medical_api/src/model/admin_doctors_doctor_id_verify_post_request.dart';
import 'package:gps_medical_api/src/model/admin_overview.dart';
import 'package:gps_medical_api/src/model/admin_reviews_review_id_moderate_post_request.dart';
import 'package:gps_medical_api/src/model/appointment.dart';
import 'package:gps_medical_api/src/model/appointment_create.dart';
import 'package:gps_medical_api/src/model/appointment_update.dart';
import 'package:gps_medical_api/src/model/appointments_appointment_id_cancel_post_request.dart';
import 'package:gps_medical_api/src/model/audit_entry.dart';
import 'package:gps_medical_api/src/model/availability_slot.dart';
import 'package:gps_medical_api/src/model/commune.dart';
import 'package:gps_medical_api/src/model/consent_grant.dart';
import 'package:gps_medical_api/src/model/credential.dart';
import 'package:gps_medical_api/src/model/dependent.dart';
import 'package:gps_medical_api/src/model/dependent_create.dart';
import 'package:gps_medical_api/src/model/device.dart';
import 'package:gps_medical_api/src/model/device_registration.dart';
import 'package:gps_medical_api/src/model/doctor.dart';
import 'package:gps_medical_api/src/model/doctor_overview.dart';
import 'package:gps_medical_api/src/model/doctor_private.dart';
import 'package:gps_medical_api/src/model/doctor_update.dart';
import 'package:gps_medical_api/src/model/doctor_with_distance.dart';
import 'package:gps_medical_api/src/model/funnel.dart';
import 'package:gps_medical_api/src/model/health_check.dart';
import 'package:gps_medical_api/src/model/ice_server.dart';
import 'package:gps_medical_api/src/model/ice_server_urls.dart';
import 'package:gps_medical_api/src/model/jwks.dart';
import 'package:gps_medical_api/src/model/jwks_keys_inner.dart';
import 'package:gps_medical_api/src/model/login_request.dart';
import 'package:gps_medical_api/src/model/medical_document.dart';
import 'package:gps_medical_api/src/model/medical_records_document_id_download_get200_response.dart';
import 'package:gps_medical_api/src/model/message.dart';
import 'package:gps_medical_api/src/model/message_attachments_inner.dart';
import 'package:gps_medical_api/src/model/message_create.dart';
import 'package:gps_medical_api/src/model/notification.dart';
import 'package:gps_medical_api/src/model/notification_preferences.dart';
import 'package:gps_medical_api/src/model/otp_verify_request.dart';
import 'package:gps_medical_api/src/model/paginated_appointments.dart';
import 'package:gps_medical_api/src/model/paginated_audit_entries.dart';
import 'package:gps_medical_api/src/model/paginated_doctors.dart';
import 'package:gps_medical_api/src/model/paginated_doctors_private.dart';
import 'package:gps_medical_api/src/model/paginated_doctors_with_distance.dart';
import 'package:gps_medical_api/src/model/paginated_medical_documents.dart';
import 'package:gps_medical_api/src/model/paginated_notifications.dart';
import 'package:gps_medical_api/src/model/paginated_reviews.dart';
import 'package:gps_medical_api/src/model/paginated_threads.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:gps_medical_api/src/model/password_reset_request.dart';
import 'package:gps_medical_api/src/model/patient.dart';
import 'package:gps_medical_api/src/model/patient_all_of_insurance.dart';
import 'package:gps_medical_api/src/model/patient_update.dart';
import 'package:gps_medical_api/src/model/payment_intent.dart';
import 'package:gps_medical_api/src/model/payment_intent_create.dart';
import 'package:gps_medical_api/src/model/payments_intents_intent_id_confirm_post_request.dart';
import 'package:gps_medical_api/src/model/prescription.dart';
import 'package:gps_medical_api/src/model/prescription_create.dart';
import 'package:gps_medical_api/src/model/prescription_item.dart';
import 'package:gps_medical_api/src/model/problem.dart';
import 'package:gps_medical_api/src/model/refresh_tokens_request.dart';
import 'package:gps_medical_api/src/model/refund.dart';
import 'package:gps_medical_api/src/model/refund_request.dart';
import 'package:gps_medical_api/src/model/register_request.dart';
import 'package:gps_medical_api/src/model/register_response.dart';
import 'package:gps_medical_api/src/model/resend_otp_request.dart';
import 'package:gps_medical_api/src/model/review.dart';
import 'package:gps_medical_api/src/model/review_create.dart';
import 'package:gps_medical_api/src/model/review_update.dart';
import 'package:gps_medical_api/src/model/reviews_review_id_report_post_request.dart';
import 'package:gps_medical_api/src/model/revoke_consent_request.dart';
import 'package:gps_medical_api/src/model/schedule_exception.dart';
import 'package:gps_medical_api/src/model/schedule_exception_create.dart';
import 'package:gps_medical_api/src/model/schedule_template.dart';
import 'package:gps_medical_api/src/model/schedule_template_create.dart';
import 'package:gps_medical_api/src/model/search_suggest_get200_response.dart';
import 'package:gps_medical_api/src/model/specialty.dart';
import 'package:gps_medical_api/src/model/specialty_create.dart';
import 'package:gps_medical_api/src/model/suggest_item.dart';
import 'package:gps_medical_api/src/model/tele_session.dart';
import 'package:gps_medical_api/src/model/teleconsultations_appointment_id_end_post_request.dart';
import 'package:gps_medical_api/src/model/thread.dart';
import 'package:gps_medical_api/src/model/time_series.dart';
import 'package:gps_medical_api/src/model/time_series_point.dart';
import 'package:gps_medical_api/src/model/token_pair.dart';
import 'package:gps_medical_api/src/model/turn_credentials.dart';
import 'package:gps_medical_api/src/model/user.dart';
import 'package:gps_medical_api/src/model/user_admin.dart';
import 'package:gps_medical_api/src/model/user_admin_update.dart';
import 'package:gps_medical_api/src/model/validation_problem.dart';
import 'package:gps_medical_api/src/model/validation_problem_all_of_errors.dart';
import 'package:gps_medical_api/src/model/wilaya.dart';

part 'serializers.g.dart';

@SerializersFor([
  Address,
  AdminDoctorsDoctorIdVerifyPostRequest,
  AdminOverview,
  AdminReviewsReviewIdModeratePostRequest,
  Appointment,
  AppointmentCreate,
  AppointmentUpdate,
  AppointmentsAppointmentIdCancelPostRequest,
  AuditEntry,
  AvailabilitySlot,
  Commune,
  ConsentGrant,
  Credential,
  Dependent,
  DependentCreate,
  Device,
  DeviceRegistration,
  Doctor,
  $Doctor,
  DoctorOverview,
  DoctorPrivate,
  DoctorUpdate,
  DoctorWithDistance,
  Funnel,
  HealthCheck,
  IceServer,
  IceServerUrls,
  JWKS,
  JWKSKeysInner,
  LoginRequest,
  MedicalDocument,
  MedicalRecordsDocumentIdDownloadGet200Response,
  Message,
  MessageAttachmentsInner,
  MessageCreate,
  Notification,
  NotificationPreferences,
  OtpVerifyRequest,
  PaginatedAppointments,
  PaginatedAuditEntries,
  PaginatedDoctors,
  PaginatedDoctorsPrivate,
  PaginatedDoctorsWithDistance,
  PaginatedMedicalDocuments,
  PaginatedNotifications,
  PaginatedReviews,
  PaginatedThreads,
  PaginationMeta,
  PasswordResetRequest,
  Patient,
  PatientAllOfInsurance,
  PatientUpdate,
  PaymentIntent,
  PaymentIntentCreate,
  PaymentsIntentsIntentIdConfirmPostRequest,
  Prescription,
  PrescriptionCreate,
  $PrescriptionCreate,
  PrescriptionItem,
  Problem,
  $Problem,
  RefreshTokensRequest,
  Refund,
  RefundRequest,
  RegisterRequest,
  RegisterResponse,
  ResendOtpRequest,
  Review,
  ReviewCreate,
  ReviewUpdate,
  ReviewsReviewIdReportPostRequest,
  RevokeConsentRequest,
  ScheduleException,
  ScheduleExceptionCreate,
  ScheduleTemplate,
  ScheduleTemplateCreate,
  SearchSuggestGet200Response,
  Specialty,
  SpecialtyCreate,
  SuggestItem,
  TeleSession,
  TeleconsultationsAppointmentIdEndPostRequest,
  Thread,
  TimeSeries,
  TimeSeriesPoint,
  TokenPair,
  TurnCredentials,
  User,
  $User,
  UserAdmin,
  UserAdminUpdate,
  ValidationProblem,
  ValidationProblemAllOfErrors,
  Wilaya,
])
Serializers serializers =
    (_$serializers.toBuilder()
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(Message)]),
            () => ListBuilder<Message>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(ScheduleTemplate)]),
            () => ListBuilder<ScheduleTemplate>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(Commune)]),
            () => ListBuilder<Commune>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(ScheduleException)]),
            () => ListBuilder<ScheduleException>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(Wilaya)]),
            () => ListBuilder<Wilaya>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(Dependent)]),
            () => ListBuilder<Dependent>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltMap, [
              FullType(String),
              FullType.nullable(JsonObject),
            ]),
            () => MapBuilder<String, JsonObject?>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(AvailabilitySlot)]),
            () => ListBuilder<AvailabilitySlot>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(Specialty)]),
            () => ListBuilder<Specialty>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(String)]),
            () => ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, [FullType(ConsentGrant)]),
            () => ListBuilder<ConsentGrant>(),
          )
          ..add(Doctor.serializer)
          ..add(PrescriptionCreate.serializer)
          ..add(Problem.serializer)
          ..add(User.serializer)
          ..add(const OneOfSerializer())
          ..add(const AnyOfSerializer())
          ..add(const DateSerializer())
          ..add(Iso8601DateTimeSerializer()))
        .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
