// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers =
    (Serializers().toBuilder()
          ..add($Doctor.serializer)
          ..add($PrescriptionCreate.serializer)
          ..add($Problem.serializer)
          ..add($User.serializer)
          ..add(Address.serializer)
          ..add(AdminDoctorsDoctorIdVerifyPostRequest.serializer)
          ..add(AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum.serializer)
          ..add(AdminOverview.serializer)
          ..add(AdminReviewsReviewIdModeratePostRequest.serializer)
          ..add(AdminReviewsReviewIdModeratePostRequestDecisionEnum.serializer)
          ..add(Appointment.serializer)
          ..add(AppointmentCreate.serializer)
          ..add(AppointmentCreateModeEnum.serializer)
          ..add(AppointmentModeEnum.serializer)
          ..add(AppointmentPaymentStatusEnum.serializer)
          ..add(AppointmentStatusEnum.serializer)
          ..add(AppointmentUpdate.serializer)
          ..add(AppointmentsAppointmentIdCancelPostRequest.serializer)
          ..add(AuditEntry.serializer)
          ..add(AvailabilitySlot.serializer)
          ..add(AvailabilitySlotModeEnum.serializer)
          ..add(Commune.serializer)
          ..add(ConsentGrant.serializer)
          ..add(ConsentGrantConsentTypeEnum.serializer)
          ..add(Credential.serializer)
          ..add(CredentialStatusEnum.serializer)
          ..add(CredentialTypeEnum.serializer)
          ..add(Dependent.serializer)
          ..add(DependentCreate.serializer)
          ..add(DependentCreateGenderEnum.serializer)
          ..add(DependentCreateRelationEnum.serializer)
          ..add(DependentGenderEnum.serializer)
          ..add(DependentRelationEnum.serializer)
          ..add(Device.serializer)
          ..add(DeviceRegistration.serializer)
          ..add(DeviceRegistrationPlatformEnum.serializer)
          ..add(DoctorGenderEnum.serializer)
          ..add(DoctorLanguagesEnum.serializer)
          ..add(DoctorOverview.serializer)
          ..add(DoctorPrivate.serializer)
          ..add(DoctorPrivateConfirmationPolicyEnum.serializer)
          ..add(DoctorPrivateVerificationStatusEnum.serializer)
          ..add(DoctorUpdate.serializer)
          ..add(DoctorUpdateConfirmationPolicyEnum.serializer)
          ..add(DoctorUpdateLanguagesEnum.serializer)
          ..add(DoctorWithDistance.serializer)
          ..add(Funnel.serializer)
          ..add(HealthCheck.serializer)
          ..add(HealthCheckDbEnum.serializer)
          ..add(HealthCheckRedisEnum.serializer)
          ..add(HealthCheckStatusEnum.serializer)
          ..add(HealthCheckStorageEnum.serializer)
          ..add(IceServer.serializer)
          ..add(IceServerUrls.serializer)
          ..add(JWKS.serializer)
          ..add(JWKSKeysInner.serializer)
          ..add(LoginRequest.serializer)
          ..add(MedicalDocument.serializer)
          ..add(MedicalDocumentAuthorRoleEnum.serializer)
          ..add(MedicalDocumentTypeEnum.serializer)
          ..add(MedicalRecordsDocumentIdDownloadGet200Response.serializer)
          ..add(Message.serializer)
          ..add(MessageAttachmentsInner.serializer)
          ..add(MessageCreate.serializer)
          ..add(Notification.serializer)
          ..add(NotificationPreferences.serializer)
          ..add(NotificationPreferencesReminderHoursBeforeEnum.serializer)
          ..add(NotificationTypeEnum.serializer)
          ..add(OtpVerifyRequest.serializer)
          ..add(PaginatedAppointments.serializer)
          ..add(PaginatedAuditEntries.serializer)
          ..add(PaginatedDoctors.serializer)
          ..add(PaginatedDoctorsPrivate.serializer)
          ..add(PaginatedDoctorsWithDistance.serializer)
          ..add(PaginatedMedicalDocuments.serializer)
          ..add(PaginatedNotifications.serializer)
          ..add(PaginatedReviews.serializer)
          ..add(PaginatedThreads.serializer)
          ..add(PaginationMeta.serializer)
          ..add(PasswordResetRequest.serializer)
          ..add(Patient.serializer)
          ..add(PatientAllOfInsurance.serializer)
          ..add(PatientAllOfInsuranceProviderEnum.serializer)
          ..add(PatientBloodTypeEnum.serializer)
          ..add(PatientGenderEnum.serializer)
          ..add(PatientUpdate.serializer)
          ..add(PatientUpdateBloodTypeEnum.serializer)
          ..add(PatientUpdateGenderEnum.serializer)
          ..add(PaymentIntent.serializer)
          ..add(PaymentIntentCreate.serializer)
          ..add(PaymentIntentCreateProviderEnum.serializer)
          ..add(PaymentIntentCreatePurposeEnum.serializer)
          ..add(PaymentIntentStatusEnum.serializer)
          ..add(PaymentsIntentsIntentIdConfirmPostRequest.serializer)
          ..add(Prescription.serializer)
          ..add(PrescriptionItem.serializer)
          ..add(RefreshTokensRequest.serializer)
          ..add(Refund.serializer)
          ..add(RefundRequest.serializer)
          ..add(RefundRequestReasonEnum.serializer)
          ..add(RefundStatusEnum.serializer)
          ..add(RegisterRequest.serializer)
          ..add(RegisterRequestRoleEnum.serializer)
          ..add(RegisterResponse.serializer)
          ..add(RegisterResponseNinVerificationStatusEnum.serializer)
          ..add(ResendOtpRequest.serializer)
          ..add(Review.serializer)
          ..add(ReviewCreate.serializer)
          ..add(ReviewStatusEnum.serializer)
          ..add(ReviewUpdate.serializer)
          ..add(ReviewsReviewIdReportPostRequest.serializer)
          ..add(ReviewsReviewIdReportPostRequestReasonEnum.serializer)
          ..add(RevokeConsentRequest.serializer)
          ..add(RevokeConsentRequestConsentTypeEnum.serializer)
          ..add(ScheduleException.serializer)
          ..add(ScheduleExceptionCreate.serializer)
          ..add(ScheduleExceptionCreateKindEnum.serializer)
          ..add(ScheduleExceptionKindEnum.serializer)
          ..add(ScheduleTemplate.serializer)
          ..add(ScheduleTemplateCreate.serializer)
          ..add(ScheduleTemplateCreateModeEnum.serializer)
          ..add(ScheduleTemplateCreateSlotDurationMinutesEnum.serializer)
          ..add(ScheduleTemplateModeEnum.serializer)
          ..add(ScheduleTemplateSlotDurationMinutesEnum.serializer)
          ..add(SearchSuggestGet200Response.serializer)
          ..add(Specialty.serializer)
          ..add(SpecialtyCreate.serializer)
          ..add(SuggestItem.serializer)
          ..add(SuggestItemKindEnum.serializer)
          ..add(TeleSession.serializer)
          ..add(TeleSessionStatusEnum.serializer)
          ..add(TeleconsultationsAppointmentIdEndPostRequest.serializer)
          ..add(Thread.serializer)
          ..add(TimeSeries.serializer)
          ..add(TimeSeriesPoint.serializer)
          ..add(TokenPair.serializer)
          ..add(TurnCredentials.serializer)
          ..add(UserAdmin.serializer)
          ..add(UserAdminUpdate.serializer)
          ..add(UserAdminUpdateRoleEnum.serializer)
          ..add(UserAdminUpdateStatusEnum.serializer)
          ..add(UserRoleEnum.serializer)
          ..add(UserStatusEnum.serializer)
          ..add(ValidationProblem.serializer)
          ..add(ValidationProblemAllOfErrors.serializer)
          ..add(Wilaya.serializer)
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(Appointment)]),
            () => ListBuilder<Appointment>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(AuditEntry)]),
            () => ListBuilder<AuditEntry>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(Credential)]),
            () => ListBuilder<Credential>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(Specialty)]),
            () => ListBuilder<Specialty>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(DoctorLanguagesEnum),
            ]),
            () => ListBuilder<DoctorLanguagesEnum>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(Doctor)]),
            () => ListBuilder<Doctor>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(DoctorPrivate)]),
            () => ListBuilder<DoctorPrivate>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(DoctorUpdateLanguagesEnum),
            ]),
            () => ListBuilder<DoctorUpdateLanguagesEnum>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(DoctorWithDistance),
            ]),
            () => ListBuilder<DoctorWithDistance>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(IceServer)]),
            () => ListBuilder<IceServer>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(JWKSKeysInner)]),
            () => ListBuilder<JWKSKeysInner>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(MedicalDocument)]),
            () => ListBuilder<MedicalDocument>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(MessageAttachmentsInner),
            ]),
            () => ListBuilder<MessageAttachmentsInner>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(Notification)]),
            () => ListBuilder<Notification>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(PrescriptionItem)]),
            () => ListBuilder<PrescriptionItem>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(PrescriptionItem)]),
            () => ListBuilder<PrescriptionItem>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(Review)]),
            () => ListBuilder<Review>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(Specialty)]),
            () => ListBuilder<Specialty>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(DoctorLanguagesEnum),
            ]),
            () => ListBuilder<DoctorLanguagesEnum>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(Specialty)]),
            () => ListBuilder<Specialty>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(DoctorLanguagesEnum),
            ]),
            () => ListBuilder<DoctorLanguagesEnum>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(String)]),
            () => ListBuilder<String>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(SuggestItem)]),
            () => ListBuilder<SuggestItem>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(SuggestItem)]),
            () => ListBuilder<SuggestItem>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(SuggestItem)]),
            () => ListBuilder<SuggestItem>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(Thread)]),
            () => ListBuilder<Thread>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(TimeSeriesPoint)]),
            () => ListBuilder<TimeSeriesPoint>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(ValidationProblemAllOfErrors),
            ]),
            () => ListBuilder<ValidationProblemAllOfErrors>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltMap, const [
              const FullType(String),
              const FullType.nullable(JsonObject),
            ]),
            () => MapBuilder<String, JsonObject?>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltMap, const [
              const FullType(String),
              const FullType.nullable(JsonObject),
            ]),
            () => MapBuilder<String, JsonObject?>(),
          ))
        .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
