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
import 'package:gps_medical_api/src/model/admin_overview.dart';
import 'package:gps_medical_api/src/model/admin_reviews_review_id_moderate_post_request.dart';
import 'package:gps_medical_api/src/model/appointment.dart';
import 'package:gps_medical_api/src/model/appointment_create.dart';
import 'package:gps_medical_api/src/model/appointment_origin.dart';
import 'package:gps_medical_api/src/model/appointment_review_for_clinic.dart';
import 'package:gps_medical_api/src/model/appointment_update.dart';
import 'package:gps_medical_api/src/model/appointments_appointment_id_cancel_post_request.dart';
import 'package:gps_medical_api/src/model/audit_entry.dart';
import 'package:gps_medical_api/src/model/availability_slot.dart';
import 'package:gps_medical_api/src/model/check_nin_request.dart';
import 'package:gps_medical_api/src/model/check_phone_request.dart';
import 'package:gps_medical_api/src/model/clinic.dart';
import 'package:gps_medical_api/src/model/clinic_admin_update.dart';
import 'package:gps_medical_api/src/model/clinic_availability_slot.dart';
import 'package:gps_medical_api/src/model/clinic_create.dart';
import 'package:gps_medical_api/src/model/clinic_credential.dart';
import 'package:gps_medical_api/src/model/clinic_earnings.dart';
import 'package:gps_medical_api/src/model/clinic_membership.dart';
import 'package:gps_medical_api/src/model/clinic_membership_status.dart';
import 'package:gps_medical_api/src/model/clinic_private.dart';
import 'package:gps_medical_api/src/model/clinic_review.dart';
import 'package:gps_medical_api/src/model/clinic_schedule_template.dart';
import 'package:gps_medical_api/src/model/clinic_schedule_template_create.dart';
import 'package:gps_medical_api/src/model/clinic_service.dart';
import 'package:gps_medical_api/src/model/clinic_service_create.dart';
import 'package:gps_medical_api/src/model/clinic_service_teaser.dart';
import 'package:gps_medical_api/src/model/clinic_service_update.dart';
import 'package:gps_medical_api/src/model/clinic_specialist_affiliation.dart';
import 'package:gps_medical_api/src/model/clinic_specialist_teaser.dart';
import 'package:gps_medical_api/src/model/clinic_staff_create.dart';
import 'package:gps_medical_api/src/model/clinic_staff_member.dart';
import 'package:gps_medical_api/src/model/clinic_status.dart';
import 'package:gps_medical_api/src/model/clinic_update.dart';
import 'package:gps_medical_api/src/model/clinic_verification_status.dart';
import 'package:gps_medical_api/src/model/clinic_with_distance.dart';
import 'package:gps_medical_api/src/model/commune.dart';
import 'package:gps_medical_api/src/model/confirm_payment_intent_request.dart';
import 'package:gps_medical_api/src/model/consent_grant.dart';
import 'package:gps_medical_api/src/model/country_code.dart';
import 'package:gps_medical_api/src/model/credential.dart';
import 'package:gps_medical_api/src/model/currency_code.dart';
import 'package:gps_medical_api/src/model/data_residency_mode.dart';
import 'package:gps_medical_api/src/model/dependent.dart';
import 'package:gps_medical_api/src/model/dependent_create.dart';
import 'package:gps_medical_api/src/model/device.dart';
import 'package:gps_medical_api/src/model/device_registration.dart';
import 'package:gps_medical_api/src/model/doctor.dart';
import 'package:gps_medical_api/src/model/doctor_overview.dart';
import 'package:gps_medical_api/src/model/doctor_private.dart';
import 'package:gps_medical_api/src/model/doctor_update.dart';
import 'package:gps_medical_api/src/model/doctor_verification_status.dart';
import 'package:gps_medical_api/src/model/doctor_with_distance.dart';
import 'package:gps_medical_api/src/model/funnel.dart';
import 'package:gps_medical_api/src/model/health_check.dart';
import 'package:gps_medical_api/src/model/ice_server.dart';
import 'package:gps_medical_api/src/model/ice_server_urls.dart';
import 'package:gps_medical_api/src/model/invite_clinic_membership_request.dart';
import 'package:gps_medical_api/src/model/jwks.dart';
import 'package:gps_medical_api/src/model/jwks_keys_inner.dart';
import 'package:gps_medical_api/src/model/login_request.dart';
import 'package:gps_medical_api/src/model/medical_document.dart';
import 'package:gps_medical_api/src/model/medical_records_document_id_download_get200_response.dart';
import 'package:gps_medical_api/src/model/message.dart';
import 'package:gps_medical_api/src/model/message_attachments_inner.dart';
import 'package:gps_medical_api/src/model/message_create.dart';
import 'package:gps_medical_api/src/model/messaging_realtime_event.dart';
import 'package:gps_medical_api/src/model/notification.dart';
import 'package:gps_medical_api/src/model/notification_preferences.dart';
import 'package:gps_medical_api/src/model/otp_verify_request.dart';
import 'package:gps_medical_api/src/model/paginated_appointment_reviews_for_clinic.dart';
import 'package:gps_medical_api/src/model/paginated_appointments.dart';
import 'package:gps_medical_api/src/model/paginated_audit_entries.dart';
import 'package:gps_medical_api/src/model/paginated_clinic_reviews.dart';
import 'package:gps_medical_api/src/model/paginated_clinics.dart';
import 'package:gps_medical_api/src/model/paginated_clinics_private.dart';
import 'package:gps_medical_api/src/model/paginated_clinics_with_distance.dart';
import 'package:gps_medical_api/src/model/paginated_doctors.dart';
import 'package:gps_medical_api/src/model/paginated_doctors_private.dart';
import 'package:gps_medical_api/src/model/paginated_doctors_with_distance.dart';
import 'package:gps_medical_api/src/model/paginated_medical_documents.dart';
import 'package:gps_medical_api/src/model/paginated_notifications.dart';
import 'package:gps_medical_api/src/model/paginated_reviews.dart';
import 'package:gps_medical_api/src/model/paginated_threads.dart';
import 'package:gps_medical_api/src/model/paginated_user_admin.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:gps_medical_api/src/model/password_reset_request.dart';
import 'package:gps_medical_api/src/model/patch_doctor_membership_request.dart';
import 'package:gps_medical_api/src/model/patient.dart';
import 'package:gps_medical_api/src/model/patient_all_of_insurance.dart';
import 'package:gps_medical_api/src/model/patient_update.dart';
import 'package:gps_medical_api/src/model/patient_update_insurance.dart';
import 'package:gps_medical_api/src/model/payment_intent.dart';
import 'package:gps_medical_api/src/model/payment_intent_create.dart';
import 'package:gps_medical_api/src/model/prescription.dart';
import 'package:gps_medical_api/src/model/prescription_create.dart';
import 'package:gps_medical_api/src/model/prescription_item.dart';
import 'package:gps_medical_api/src/model/problem.dart';
import 'package:gps_medical_api/src/model/refresh_tokens_request.dart';
import 'package:gps_medical_api/src/model/refund.dart';
import 'package:gps_medical_api/src/model/refund_request.dart';
import 'package:gps_medical_api/src/model/register_request.dart';
import 'package:gps_medical_api/src/model/register_response.dart';
import 'package:gps_medical_api/src/model/report_review_request.dart';
import 'package:gps_medical_api/src/model/resend_otp_request.dart';
import 'package:gps_medical_api/src/model/review.dart';
import 'package:gps_medical_api/src/model/review_create.dart';
import 'package:gps_medical_api/src/model/review_scope.dart';
import 'package:gps_medical_api/src/model/review_subject_type.dart';
import 'package:gps_medical_api/src/model/review_update.dart';
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
import 'package:gps_medical_api/src/model/teleconsult_ice_candidate.dart';
import 'package:gps_medical_api/src/model/teleconsult_lab_join.dart';
import 'package:gps_medical_api/src/model/teleconsult_lab_join_write.dart';
import 'package:gps_medical_api/src/model/teleconsult_lab_signal_list.dart';
import 'package:gps_medical_api/src/model/teleconsult_lab_signal_write.dart';
import 'package:gps_medical_api/src/model/teleconsult_signal.dart';
import 'package:gps_medical_api/src/model/teleconsult_signal_list.dart';
import 'package:gps_medical_api/src/model/teleconsult_signal_type.dart';
import 'package:gps_medical_api/src/model/teleconsult_signal_write.dart';
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
import 'package:gps_medical_api/src/model/verify_clinic_request.dart';
import 'package:gps_medical_api/src/model/verify_doctor_request.dart';
import 'package:gps_medical_api/src/model/wilaya.dart';

part 'serializers.g.dart';

@SerializersFor([
  Address,
  AdminOverview,
  AdminReviewsReviewIdModeratePostRequest,
  Appointment,
  AppointmentCreate,
  AppointmentOrigin,
  AppointmentReviewForClinic,
  AppointmentUpdate,
  AppointmentsAppointmentIdCancelPostRequest,
  AuditEntry,
  AvailabilitySlot,
  CheckNinRequest,
  CheckPhoneRequest,
  Clinic,$Clinic,
  ClinicAdminUpdate,
  ClinicAvailabilitySlot,
  ClinicCreate,
  ClinicCredential,
  ClinicEarnings,
  ClinicMembership,
  ClinicMembershipStatus,
  ClinicPrivate,
  ClinicReview,
  ClinicScheduleTemplate,
  ClinicScheduleTemplateCreate,
  ClinicService,
  ClinicServiceCreate,
  ClinicServiceTeaser,
  ClinicServiceUpdate,
  ClinicSpecialistAffiliation,
  ClinicSpecialistTeaser,
  ClinicStaffCreate,
  ClinicStaffMember,
  ClinicStatus,
  ClinicUpdate,$ClinicUpdate,
  ClinicVerificationStatus,
  ClinicWithDistance,
  Commune,
  ConfirmPaymentIntentRequest,
  ConsentGrant,
  CountryCode,
  Credential,
  CurrencyCode,
  DataResidencyMode,
  Dependent,
  DependentCreate,
  Device,
  DeviceRegistration,
  Doctor,$Doctor,
  DoctorOverview,
  DoctorPrivate,
  DoctorUpdate,
  DoctorVerificationStatus,
  DoctorWithDistance,
  Funnel,
  HealthCheck,
  IceServer,
  IceServerUrls,
  InviteClinicMembershipRequest,
  JWKS,
  JWKSKeysInner,
  LoginRequest,
  MedicalDocument,
  MedicalRecordsDocumentIdDownloadGet200Response,
  Message,
  MessageAttachmentsInner,
  MessageCreate,
  MessagingRealtimeEvent,
  Notification,
  NotificationPreferences,
  OtpVerifyRequest,
  PaginatedAppointmentReviewsForClinic,
  PaginatedAppointments,
  PaginatedAuditEntries,
  PaginatedClinicReviews,
  PaginatedClinics,
  PaginatedClinicsPrivate,
  PaginatedClinicsWithDistance,
  PaginatedDoctors,
  PaginatedDoctorsPrivate,
  PaginatedDoctorsWithDistance,
  PaginatedMedicalDocuments,
  PaginatedNotifications,
  PaginatedReviews,
  PaginatedThreads,
  PaginatedUserAdmin,
  PaginationMeta,
  PasswordResetRequest,
  PatchDoctorMembershipRequest,
  Patient,
  PatientAllOfInsurance,
  PatientUpdate,
  PatientUpdateInsurance,
  PaymentIntent,
  PaymentIntentCreate,
  Prescription,
  PrescriptionCreate,$PrescriptionCreate,
  PrescriptionItem,
  Problem,$Problem,
  RefreshTokensRequest,
  Refund,
  RefundRequest,
  RegisterRequest,
  RegisterResponse,
  ReportReviewRequest,
  ResendOtpRequest,
  Review,
  ReviewCreate,
  ReviewScope,
  ReviewSubjectType,
  ReviewUpdate,
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
  TeleconsultIceCandidate,
  TeleconsultLabJoin,
  TeleconsultLabJoinWrite,
  TeleconsultLabSignalList,
  TeleconsultLabSignalWrite,
  TeleconsultSignal,
  TeleconsultSignalList,
  TeleconsultSignalType,
  TeleconsultSignalWrite,
  TeleconsultationsAppointmentIdEndPostRequest,
  Thread,
  TimeSeries,
  TimeSeriesPoint,
  TokenPair,
  TurnCredentials,
  User,$User,
  UserAdmin,
  UserAdminUpdate,
  ValidationProblem,
  ValidationProblemAllOfErrors,
  VerifyClinicRequest,
  VerifyDoctorRequest,
  Wilaya,
])
Serializers serializers = (_$serializers.toBuilder()
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
        const FullType(BuiltList, [FullType(ClinicStaffMember)]),
        () => ListBuilder<ClinicStaffMember>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Dependent)]),
        () => ListBuilder<Dependent>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ClinicMembership)]),
        () => ListBuilder<ClinicMembership>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ClinicService)]),
        () => ListBuilder<ClinicService>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ClinicSpecialistTeaser)]),
        () => ListBuilder<ClinicSpecialistTeaser>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ClinicAvailabilitySlot)]),
        () => ListBuilder<ClinicAvailabilitySlot>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
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
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ClinicScheduleTemplate)]),
        () => ListBuilder<ClinicScheduleTemplate>(),
      )
      ..add(Clinic.serializer)
      ..add(ClinicUpdate.serializer)
      ..add(Doctor.serializer)
      ..add(PrescriptionCreate.serializer)
      ..add(Problem.serializer)
      ..add(User.serializer)
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer())
    ).build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
