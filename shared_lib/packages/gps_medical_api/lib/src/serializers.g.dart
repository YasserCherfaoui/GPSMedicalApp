// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers =
    (Serializers().toBuilder()
          ..add($Clinic.serializer)
          ..add($ClinicUpdate.serializer)
          ..add($Doctor.serializer)
          ..add($PrescriptionCreate.serializer)
          ..add($Problem.serializer)
          ..add($User.serializer)
          ..add(Address.serializer)
          ..add(AdminOverview.serializer)
          ..add(AdminReviewsReviewIdModeratePostRequest.serializer)
          ..add(AdminReviewsReviewIdModeratePostRequestDecisionEnum.serializer)
          ..add(Appointment.serializer)
          ..add(AppointmentCreate.serializer)
          ..add(AppointmentCreateModeEnum.serializer)
          ..add(AppointmentCreateOriginEnum.serializer)
          ..add(AppointmentModeEnum.serializer)
          ..add(AppointmentOrigin.serializer)
          ..add(AppointmentOriginEnum.serializer)
          ..add(AppointmentPaymentStatusEnum.serializer)
          ..add(AppointmentReviewForClinic.serializer)
          ..add(AppointmentStatusEnum.serializer)
          ..add(AppointmentUpdate.serializer)
          ..add(AppointmentsAppointmentIdCancelPostRequest.serializer)
          ..add(AuditEntry.serializer)
          ..add(AvailabilitySlot.serializer)
          ..add(AvailabilitySlotModeEnum.serializer)
          ..add(CheckNinRequest.serializer)
          ..add(CheckPhoneRequest.serializer)
          ..add(ClinicAdminUpdate.serializer)
          ..add(ClinicAvailabilitySlot.serializer)
          ..add(ClinicAvailabilitySlotModeEnum.serializer)
          ..add(ClinicCreate.serializer)
          ..add(ClinicCreateConfirmationPolicyEnum.serializer)
          ..add(ClinicCredential.serializer)
          ..add(ClinicCredentialStatusEnum.serializer)
          ..add(ClinicCredentialTypeEnum.serializer)
          ..add(ClinicEarnings.serializer)
          ..add(ClinicMembership.serializer)
          ..add(ClinicMembershipStatus.serializer)
          ..add(ClinicPrivate.serializer)
          ..add(ClinicPrivateConfirmationPolicyEnum.serializer)
          ..add(ClinicReview.serializer)
          ..add(ClinicReviewStatusEnum.serializer)
          ..add(ClinicScheduleTemplate.serializer)
          ..add(ClinicScheduleTemplateCreate.serializer)
          ..add(ClinicScheduleTemplateCreateModeEnum.serializer)
          ..add(ClinicScheduleTemplateCreateSlotDurationMinutesEnum.serializer)
          ..add(ClinicScheduleTemplateModeEnum.serializer)
          ..add(ClinicScheduleTemplateSlotDurationMinutesEnum.serializer)
          ..add(ClinicService.serializer)
          ..add(ClinicServiceCreate.serializer)
          ..add(ClinicServiceCreateDurationMinutesEnum.serializer)
          ..add(ClinicServiceDurationMinutesEnum.serializer)
          ..add(ClinicServiceTeaser.serializer)
          ..add(ClinicServiceUpdate.serializer)
          ..add(ClinicServiceUpdateDurationMinutesEnum.serializer)
          ..add(ClinicSpecialistAffiliation.serializer)
          ..add(ClinicSpecialistTeaser.serializer)
          ..add(ClinicStaffCreate.serializer)
          ..add(ClinicStaffMember.serializer)
          ..add(ClinicStaffMemberRoleEnum.serializer)
          ..add(ClinicStatus.serializer)
          ..add(ClinicUpdateConfirmationPolicyEnum.serializer)
          ..add(ClinicVerificationStatus.serializer)
          ..add(ClinicWithDistance.serializer)
          ..add(Commune.serializer)
          ..add(ConfirmPaymentIntentRequest.serializer)
          ..add(ConsentGrant.serializer)
          ..add(ConsentGrantConsentTypeEnum.serializer)
          ..add(CountryCode.serializer)
          ..add(Credential.serializer)
          ..add(CredentialStatusEnum.serializer)
          ..add(CredentialTypeEnum.serializer)
          ..add(CurrencyCode.serializer)
          ..add(DataResidencyMode.serializer)
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
          ..add(DoctorUpdate.serializer)
          ..add(DoctorUpdateConfirmationPolicyEnum.serializer)
          ..add(DoctorUpdateGenderEnum.serializer)
          ..add(DoctorUpdateLanguagesEnum.serializer)
          ..add(DoctorVerificationStatus.serializer)
          ..add(DoctorWithDistance.serializer)
          ..add(Funnel.serializer)
          ..add(HealthCheck.serializer)
          ..add(HealthCheckDbEnum.serializer)
          ..add(HealthCheckRedisEnum.serializer)
          ..add(HealthCheckStatusEnum.serializer)
          ..add(HealthCheckStorageEnum.serializer)
          ..add(IceServer.serializer)
          ..add(IceServerUrls.serializer)
          ..add(InviteClinicMembershipRequest.serializer)
          ..add(JWKS.serializer)
          ..add(JWKSKeysInner.serializer)
          ..add(LoginRequest.serializer)
          ..add(LoginRequestClientEnum.serializer)
          ..add(MedicalDocument.serializer)
          ..add(MedicalDocumentAuthorRoleEnum.serializer)
          ..add(MedicalDocumentTypeEnum.serializer)
          ..add(MedicalRecordsDocumentIdDownloadGet200Response.serializer)
          ..add(Message.serializer)
          ..add(MessageAttachmentsInner.serializer)
          ..add(MessageCreate.serializer)
          ..add(MessagingRealtimeEvent.serializer)
          ..add(MessagingRealtimeEventTypeEnum.serializer)
          ..add(Notification.serializer)
          ..add(NotificationPreferences.serializer)
          ..add(NotificationPreferencesReminderHoursBeforeEnum.serializer)
          ..add(NotificationTypeEnum.serializer)
          ..add(OtpVerifyRequest.serializer)
          ..add(PaginatedAppointmentReviewsForClinic.serializer)
          ..add(PaginatedAppointments.serializer)
          ..add(PaginatedAuditEntries.serializer)
          ..add(PaginatedClinicReviews.serializer)
          ..add(PaginatedClinics.serializer)
          ..add(PaginatedClinicsPrivate.serializer)
          ..add(PaginatedClinicsWithDistance.serializer)
          ..add(PaginatedDoctors.serializer)
          ..add(PaginatedDoctorsPrivate.serializer)
          ..add(PaginatedDoctorsWithDistance.serializer)
          ..add(PaginatedMedicalDocuments.serializer)
          ..add(PaginatedNotifications.serializer)
          ..add(PaginatedReviews.serializer)
          ..add(PaginatedThreads.serializer)
          ..add(PaginatedUserAdmin.serializer)
          ..add(PaginationMeta.serializer)
          ..add(PasswordResetRequest.serializer)
          ..add(PatchDoctorMembershipRequest.serializer)
          ..add(Patient.serializer)
          ..add(PatientAllOfInsurance.serializer)
          ..add(PatientAllOfInsuranceProviderEnum.serializer)
          ..add(PatientBloodTypeEnum.serializer)
          ..add(PatientGenderEnum.serializer)
          ..add(PatientUpdate.serializer)
          ..add(PatientUpdateBloodTypeEnum.serializer)
          ..add(PatientUpdateGenderEnum.serializer)
          ..add(PatientUpdateInsurance.serializer)
          ..add(PatientUpdateInsuranceProviderEnum.serializer)
          ..add(PaymentIntent.serializer)
          ..add(PaymentIntentCreate.serializer)
          ..add(PaymentIntentCreateProviderEnum.serializer)
          ..add(PaymentIntentCreatePurposeEnum.serializer)
          ..add(PaymentIntentPayeeTypeEnum.serializer)
          ..add(PaymentIntentStatusEnum.serializer)
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
          ..add(ReportReviewRequest.serializer)
          ..add(ReportReviewRequestReasonEnum.serializer)
          ..add(ResendOtpRequest.serializer)
          ..add(Review.serializer)
          ..add(ReviewCreate.serializer)
          ..add(ReviewCreateReviewScopeEnum.serializer)
          ..add(ReviewCreateSubjectTypeEnum.serializer)
          ..add(ReviewReviewScopeEnum.serializer)
          ..add(ReviewScope.serializer)
          ..add(ReviewStatusEnum.serializer)
          ..add(ReviewSubjectType.serializer)
          ..add(ReviewSubjectTypeEnum.serializer)
          ..add(ReviewUpdate.serializer)
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
          ..add(TeleconsultIceCandidate.serializer)
          ..add(TeleconsultLabJoin.serializer)
          ..add(TeleconsultLabJoinRoleEnum.serializer)
          ..add(TeleconsultLabJoinStatusEnum.serializer)
          ..add(TeleconsultLabJoinWrite.serializer)
          ..add(TeleconsultLabSignalList.serializer)
          ..add(TeleconsultLabSignalWrite.serializer)
          ..add(TeleconsultSignal.serializer)
          ..add(TeleconsultSignalList.serializer)
          ..add(TeleconsultSignalType.serializer)
          ..add(TeleconsultSignalWrite.serializer)
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
          ..add(VerifyClinicRequest.serializer)
          ..add(VerifyClinicRequestDecisionEnum.serializer)
          ..add(VerifyDoctorRequest.serializer)
          ..add(VerifyDoctorRequestDecisionEnum.serializer)
          ..add(Wilaya.serializer)
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(Appointment)]),
            () => ListBuilder<Appointment>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(AppointmentReviewForClinic),
            ]),
            () => ListBuilder<AppointmentReviewForClinic>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(AuditEntry)]),
            () => ListBuilder<AuditEntry>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(Clinic)]),
            () => ListBuilder<Clinic>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(ClinicCredential)]),
            () => ListBuilder<ClinicCredential>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(ClinicServiceTeaser),
            ]),
            () => ListBuilder<ClinicServiceTeaser>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(ClinicPrivate)]),
            () => ListBuilder<ClinicPrivate>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(ClinicReview)]),
            () => ListBuilder<ClinicReview>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(ClinicServiceTeaser),
            ]),
            () => ListBuilder<ClinicServiceTeaser>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(ClinicServiceTeaser),
            ]),
            () => ListBuilder<ClinicServiceTeaser>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(ClinicWithDistance),
            ]),
            () => ListBuilder<ClinicWithDistance>(),
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
            const FullType(BuiltList, const [
              const FullType(ClinicSpecialistAffiliation),
            ]),
            () => ListBuilder<ClinicSpecialistAffiliation>(),
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
            const FullType(BuiltList, const [
              const FullType(ClinicSpecialistAffiliation),
            ]),
            () => ListBuilder<ClinicSpecialistAffiliation>(),
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
            const FullType(BuiltList, const [
              const FullType(ClinicSpecialistAffiliation),
            ]),
            () => ListBuilder<ClinicSpecialistAffiliation>(),
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
            const FullType(BuiltList, const [const FullType(SuggestItem)]),
            () => ListBuilder<SuggestItem>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(TeleconsultSignal),
            ]),
            () => ListBuilder<TeleconsultSignal>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [
              const FullType(TeleconsultSignal),
            ]),
            () => ListBuilder<TeleconsultSignal>(),
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
            const FullType(BuiltList, const [const FullType(UserAdmin)]),
            () => ListBuilder<UserAdmin>(),
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
