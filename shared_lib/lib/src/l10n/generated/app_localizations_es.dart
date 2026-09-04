// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get splashSubtitle => 'Del desconcierto a la orientación inteligente';

  @override
  String get chooseLanguage => 'Elige tu idioma';

  @override
  String get continueLabel => 'Continuar';

  @override
  String get skip => 'Omitir';

  @override
  String get next => 'Siguiente';

  @override
  String get start => 'Comenzar';

  @override
  String get onboardingTitle1 =>
      'Del desconcierto a la orientación inteligente';

  @override
  String get onboardingTitle2 => '¿Cómo funciona?';

  @override
  String get onboardingTitle3 => 'Tus datos, protegidos en Argelia';

  @override
  String get onboardingBody1 =>
      'Se acabó el nomadismo médico. El especialista correcto, en el momento justo.';

  @override
  String get onboardingBody2 =>
      'Recorrido en 4 pasos: localización, cribado, coaching, derivación.';

  @override
  String get onboardingBody3 =>
      'Alojamiento local ANPDP, cifrado, médicos verificados.';

  @override
  String get welcomeTitle => 'Bienvenido';

  @override
  String get welcomeSubtitle => 'Tu camino hacia la salud empieza aquí';

  @override
  String get createAccount => 'Crear una cuenta';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get loginTitle => 'Iniciar sesión';

  @override
  String get loginSubtitle => 'Qué bueno verte de nuevo';

  @override
  String get phoneLabel => 'Teléfono';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get confirmPasswordLabel => 'Confirmar contraseña';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get registration => 'Registro';

  @override
  String get verification => 'Verificación';

  @override
  String get ninTitle => 'Tu identidad';

  @override
  String get ninSubtitle => 'Número de Identificación Nacional (18 dígitos)';

  @override
  String get ninHint => 'Se encuentra en tu documento de identidad biométrico';

  @override
  String get phoneTitle => 'Tu número de teléfono';

  @override
  String get phoneSubtitle => 'Te enviaremos un código de verificación por SMS';

  @override
  String get phoneFormatHint => 'Formato: +213 5XX, 6XX o 7XX';

  @override
  String get sendCode => 'Enviar código';

  @override
  String get otpTitle => 'Introduce el código recibido';

  @override
  String otpSubtitle(String phone) {
    return 'Código de 6 dígitos enviado a $phone';
  }

  @override
  String get ninVerificationPendingBanner =>
      'Tu identidad está siendo verificada. Puedes continuar el registro; no se requiere ninguna acción de tu parte.';

  @override
  String get resendCode => 'Reenviar código';

  @override
  String resendIn(String seconds) {
    return 'Reenviar en 0:$seconds';
  }

  @override
  String get verify => 'Verificar';

  @override
  String get passwordTitle => 'Crea tu contraseña';

  @override
  String get consentTitle => 'Tus consentimientos';

  @override
  String get consentSubtitle => 'De conformidad con la ley argelina ANPDP';

  @override
  String get consentHealth => 'Tratamiento de mis datos de salud';

  @override
  String get consentData => 'Tratamiento de mis datos personales';

  @override
  String get consentTerms => 'Términos y política ANPDP';

  @override
  String get consentMarketing => 'Comunicaciones de marketing (opcional)';

  @override
  String get acceptTerms =>
      'Acepto los Términos de uso y la Política de privacidad';

  @override
  String get createMyAccount => 'Crear mi cuenta';

  @override
  String get biometricTitle => 'Inicio de sesión biométrico';

  @override
  String get biometricSubtitle =>
      'Face ID o huella dactilar para iniciar sesión más rápido';

  @override
  String get enable => 'Activar';

  @override
  String get later => 'Más tarde';

  @override
  String get successTitle => '¡Bienvenido a Medora!';

  @override
  String get successSubtitle => 'Tu cuenta ha sido creada con éxito.';

  @override
  String get discoverApp => 'Explorar la aplicación';

  @override
  String get forgotTitle => 'Recuperación de cuenta';

  @override
  String get resetTitle => 'Nueva contraseña';

  @override
  String get resetAction => 'Restablecer';

  @override
  String get invalidPhone => 'Número inválido (+213 5/6/7 + 8 dígitos)';

  @override
  String get invalidNin => 'NIN inválido (18 dígitos)';

  @override
  String get passwordsMismatch => 'Las contraseñas no coinciden';

  @override
  String get requiredConsents =>
      'Acepta todos los consentimientos obligatorios';

  @override
  String get networkError => 'Error de red. Inténtalo de nuevo.';

  @override
  String get fullNameTitle => 'Tu nombre completo';

  @override
  String get fullNameSubtitle =>
      'Tal como aparece en tus documentos oficiales (2 a 120 caracteres).';

  @override
  String get fullNameHint => 'Nombre y apellidos';

  @override
  String get invalidFullName => 'Nombre inválido (2 a 120 caracteres).';

  @override
  String get countryTitle => 'Tu país';

  @override
  String get countrySubtitle =>
      'Elige tu país de residencia. Esto no se puede cambiar más adelante.';

  @override
  String get countryImmutableNotice =>
      'El país elegido es definitivo. No se puede cambiar tras la creación de la cuenta.';

  @override
  String get countryAlgeria => 'Argelia';

  @override
  String get countryTunisia => 'Túnez';

  @override
  String get phoneCountryMismatch =>
      'Este número no corresponde al país elegido.';

  @override
  String get countryNotSupportedForRole =>
      'El registro de especialistas no está disponible aún en Túnez.';

  @override
  String get consentSubtitleTn =>
      'De conformidad con la ley tunecina INPDP (ley 2004-63)';

  @override
  String get consentTermsTn => 'Términos y política INPDP';

  @override
  String consentLegalVersion(String version) {
    return 'Versión de los términos: $version';
  }

  @override
  String get invalidPhoneTn => 'Número inválido (+216 2/4/5/9 + 7 dígitos)';

  @override
  String get phoneFormatHintTn => 'Formato: +216 2X, 4X, 5X o 9X';

  @override
  String get errorInvalidCredentials =>
      'Credenciales incorrectas. Verifica tu número de teléfono y contraseña.';

  @override
  String get errorAccessDenied =>
      'Acceso denegado. No tienes permiso para acceder a esta aplicación.';

  @override
  String get errorTooManyRequests =>
      'Demasiados intentos. Inténtalo de nuevo en unos minutos.';

  @override
  String get errorInternalServer =>
      'Error interno del servidor. Inténtalo de nuevo más tarde.';

  @override
  String get errorNetworkTimeout =>
      'Tiempo de conexión agotado. Comprueba tu conexión a Internet e inténtalo de nuevo.';

  @override
  String get errorNetworkConnection =>
      'No se puede conectar al servidor. Comprueba tu conexión a Internet.';

  @override
  String get errorPasswordRequired => 'Introduce tu contraseña.';

  @override
  String get bookingAvailabilityTitle => 'Elegir una franja horaria';

  @override
  String get bookingPreviousWeek => 'Semana anterior';

  @override
  String get bookingNextWeek => 'Semana siguiente';

  @override
  String bookingSlotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count franjas',
      one: '1 franja',
      zero: 'Sin franjas',
    );
    return '$_temp0';
  }

  @override
  String get bookingReserve => 'Reservar';

  @override
  String bookingSlotDuration(int minutes) {
    return 'Duración: $minutes min';
  }

  @override
  String get bookingModeInPerson => 'Presencial';

  @override
  String get bookingModeTelehealth => 'Telesalud';

  @override
  String get bookingModeAll => 'Todos';

  @override
  String bookingWeekRange(String from, String to) {
    return '$from – $to';
  }

  @override
  String get bookingSelectMode => 'Seleccionar modo de consulta';

  @override
  String bookingLockExpires(String time) {
    return 'Franja reservada — expira en $time';
  }

  @override
  String get bookingLockExpired => 'Tu reserva de franja ha expirado.';

  @override
  String get bookingBack => 'Volver';

  @override
  String get bookingStepConfirm => 'Confirmar franja';

  @override
  String get bookingStepPatient => '¿Para quién?';

  @override
  String get bookingStepReview => 'Resumen';

  @override
  String get bookingForMe => 'Para mí';

  @override
  String get bookingReasonHint => 'Motivo de la visita (opcional)';

  @override
  String get bookingSubmit => 'Confirmar cita';

  @override
  String get bookingRescheduleSubmit => 'Reprogramar cita';

  @override
  String get bookingSlotTakenTitle => 'Franja no disponible';

  @override
  String get bookingSlotTakenMessage =>
      'Esta franja acaba de ser tomada. ¿Elegir otra?';

  @override
  String get bookingChooseAnotherSlot => 'Elegir otra franja';

  @override
  String get bookingOfflineBanner =>
      'Sin conexión — la reserva requiere conexión';

  @override
  String get bookingOfflineSubmit =>
      'Se requiere conexión para confirmar la cita';

  @override
  String get bookingResumeDraftTitle => '¿Reanudar tu reserva?';

  @override
  String get bookingResumeDraftMessage =>
      'Se guardó una reserva en curso. Se necesita conexión para confirmar la franja.';

  @override
  String get bookingOnlineRestored =>
      'Conexión restablecida — puedes confirmar la cita';

  @override
  String get bookingResume => 'Reanudar';

  @override
  String get bookingDiscard => 'Descartar';

  @override
  String get appointmentsTitle => 'Citas';

  @override
  String get appointmentsUpcoming => 'Próximas';

  @override
  String get appointmentsHistory => 'Historial';

  @override
  String get appointmentsEmptyUpcoming => 'Sin citas próximas';

  @override
  String get appointmentsEmptyUpcomingCta => 'Encontrar un especialista';

  @override
  String get appointmentsEmptyHistory => 'Sin citas pasadas';

  @override
  String get appointmentDetailTitle => 'Detalle de la cita';

  @override
  String get appointmentCancel => 'Cancelar';

  @override
  String get appointmentReschedule => 'Reprogramar';

  @override
  String get appointmentCancelReasonHint => 'Motivo de cancelación (opcional)';

  @override
  String get appointmentConfirmCancel => 'Confirmar cancelación';

  @override
  String get appointmentDirections => 'Indicaciones';

  @override
  String get appointmentJoinTelehealth => 'Unirse';

  @override
  String get appointmentJoinTelehealthHint =>
      'Disponible 15 minutos antes de la cita.';

  @override
  String get appointmentLeaveReview => 'Dejar una reseña';

  @override
  String get appointmentStatusPending => 'Pendiente';

  @override
  String get appointmentStatusConfirmed => 'Confirmada';

  @override
  String get appointmentStatusCancelled => 'Cancelada';

  @override
  String get appointmentStatusCompleted => 'Completada';

  @override
  String get appointmentStatusNoShow => 'No presentado';

  @override
  String get appointmentPaymentUnpaid => 'Sin pagar';

  @override
  String get appointmentPaymentDeposit => 'Depósito pagado';

  @override
  String get appointmentPaymentPaid => 'Pagado';

  @override
  String get appointmentPaymentRefunded => 'Reembolsado';

  @override
  String get bookingLoadError => 'No se pueden cargar las franjas.';

  @override
  String get appointmentsLoadError => 'No se pueden cargar las citas.';

  @override
  String get appointmentDetailLoadError => 'No se puede cargar la cita.';

  @override
  String get bookingFeeLabel => 'Honorario';

  @override
  String get bookingSummaryDoctor => 'Médico';

  @override
  String get bookingSummarySlot => 'Franja';

  @override
  String get bookingSummaryPatient => 'Paciente';

  @override
  String get bookingSummaryReason => 'Motivo';

  @override
  String get errorGenericTitle => 'Error';

  @override
  String get retry => 'Reintentar';

  @override
  String get specialtiesEmpty => 'No se encontraron especialidades.';

  @override
  String get specialtiesLoadError => 'No se pueden cargar las especialidades.';

  @override
  String specialtiesPickerParentAll(String name) {
    return 'Toda la especialidad ($name)';
  }

  @override
  String get geoWilayaPickerTitle => 'Seleccionar wilaya';

  @override
  String get geoCommunePickerTitle => 'Seleccionar comuna';

  @override
  String get geoClear => 'Limpiar';

  @override
  String get geoSearchWilayaHint => 'Buscar una wilaya…';

  @override
  String get geoSearchCommuneHint => 'Buscar una comuna…';

  @override
  String get geoWilayaEmpty => 'No se encontró ninguna wilaya.';

  @override
  String get geoCommuneEmpty => 'No se encontró ninguna comuna.';

  @override
  String get geoWilayasLoadError => 'No se pueden cargar las wilayas.';

  @override
  String get geoCommunesLoadError => 'No se pueden cargar las comunas.';

  @override
  String get geoUseWilayaCenter => 'Usar el centro de la wilaya';

  @override
  String get discoveryAppBarTitle => 'Medora';

  @override
  String get discoveryRecommendedTitle => 'Especialistas recomendados';

  @override
  String get discoveryViewList => 'Lista';

  @override
  String get discoveryViewMap => 'Mapa';

  @override
  String get discoveryDoctorsEmptyTitle => 'No se encontraron médicos';

  @override
  String get discoveryDoctorsEmptyMessage =>
      'Ningún especialista coincide en este momento.';

  @override
  String get discoverySearchAction => 'Buscar';

  @override
  String get discoveryDoctorsLoadError =>
      'No se pueden cargar los especialistas.';

  @override
  String get discoveryRateLimitTitle => 'Demasiadas solicitudes';

  @override
  String discoveryRateLimitMessage(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Espera # segundos antes de reintentar.',
      one: 'Espera # segundo antes de reintentar.',
    );
    return '$_temp0';
  }

  @override
  String get doctorTitleDefault => 'Dr.';

  @override
  String get doctorLanguageArabic => 'Árabe';

  @override
  String get doctorLanguageFrench => 'Francés';

  @override
  String get doctorLanguageEnglish => 'Inglés';

  @override
  String get doctorLanguageTamazight => 'Tamazight';

  @override
  String get doctorCardBookCta => 'Reservar';

  @override
  String get doctorCardTelehealth => 'Telesalud';

  @override
  String get doctorCardVerifiedBadge => 'Certificado';

  @override
  String doctorCardMatchPercent(int percent) {
    return '$percent% de compatibilidad';
  }

  @override
  String get searchHint => 'Buscar médico, especialidad…';

  @override
  String get searchEmptyTitle => 'Ningún médico coincide';

  @override
  String get searchEmptyMessage => '¿Ampliar la zona o cambiar filtros?';

  @override
  String get searchClearFilters => 'Limpiar filtros';

  @override
  String get searchLoadError => 'Ocurrió un error durante la búsqueda.';

  @override
  String get searchSuggestionsEmpty => 'Sin sugerencias.';

  @override
  String get searchSuggestionsLoadError => 'Error al cargar sugerencias.';

  @override
  String get searchSuggestionsSpecialties => 'Especialidades';

  @override
  String get searchSuggestionsDoctors => 'Médicos';

  @override
  String get searchSuggestionsLocations => 'Ubicaciones';

  @override
  String get searchFiltersTitle => 'Filtros de búsqueda';

  @override
  String get searchFiltersReset => 'Restablecer';

  @override
  String get searchFiltersApply => 'Aplicar filtros';

  @override
  String get searchFilterSpecialty => 'Especialidad';

  @override
  String get searchFilterSpecialtyAll => 'Todas las especialidades';

  @override
  String get searchFilterLocation => 'Ubicación (Wilaya / Comuna)';

  @override
  String get searchFilterLocationAll => 'Toda Argelia';

  @override
  String get searchFilterGender => 'Género';

  @override
  String get searchFilterGenderAny => 'Cualquiera';

  @override
  String get searchFilterGenderMale => 'Masculino';

  @override
  String get searchFilterGenderFemale => 'Femenino';

  @override
  String get searchFilterLanguages => 'Idiomas hablados';

  @override
  String get searchFilterMaxFee => 'Honorario máximo';

  @override
  String searchFilterMaxFeeValue(int fee) {
    return '$fee DZD';
  }

  @override
  String get searchFilterAvailability => 'Disponibilidad';

  @override
  String get searchFilterAvailabilityAll => 'Todas';

  @override
  String get searchFilterAvailabilityToday => 'Hoy';

  @override
  String get searchFilterAvailability3Days => '3 días';

  @override
  String get searchFilterAvailability1Week => '1 semana';

  @override
  String get searchFilterAvailability1Month => '1 mes';

  @override
  String get searchFilterTelehealth => 'Telesalud disponible';

  @override
  String get searchFilterInsurance => 'Seguros aceptados';

  @override
  String get searchFilterInsuranceCnas => 'Aprobado CNAS';

  @override
  String get searchFilterInsuranceCasnos => 'Aprobado CASNOS';

  @override
  String get searchFilterSort => 'Ordenar por';

  @override
  String get searchFilterSortRelevance => 'Relevancia';

  @override
  String get searchFilterSortRating => 'Mejor valoración';

  @override
  String get searchFilterSortFeeAsc => 'Honorario ascendente';

  @override
  String get searchFilterSortFeeDesc => 'Honorario descendente';

  @override
  String get searchFilterSortDistance => 'Distancia ascendente';

  @override
  String get doctorDetailTitle => 'Perfil del especialista';

  @override
  String get doctorDetailBioTitle => 'Biografía';

  @override
  String get doctorDetailBioEmpty => 'Sin biografía disponible.';

  @override
  String get doctorDetailBioExpand => 'Leer más';

  @override
  String get doctorDetailBioCollapse => 'Mostrar menos';

  @override
  String get doctorDetailFeeTitle => 'Honorarios de consulta';

  @override
  String get doctorDetailFeeInPerson => 'Consulta presencial';

  @override
  String doctorDetailFeeValue(int fee) {
    return '$fee DZD';
  }

  @override
  String get doctorDetailLanguagesTitle => 'Idiomas hablados';

  @override
  String get doctorDetailLanguagesEmpty => 'No especificado';

  @override
  String get doctorDetailAddressTitle => 'Dirección del consultorio';

  @override
  String get doctorDetailMapUnavailable => 'Mapa no disponible';

  @override
  String get doctorDetailReviewsTitle => 'Reseñas de pacientes';

  @override
  String get doctorDetailReviewsEmpty => 'Sin reseñas aún.';

  @override
  String get doctorDetailReviewsLoadMore => 'Cargar más';

  @override
  String get doctorDetailVerifiedPatient => 'Paciente verificado';

  @override
  String get doctorDetailBookCta => 'Reservar';

  @override
  String get doctorDetailTelehealthCta => 'Telesalud';

  @override
  String get doctorDetailNotFoundTitle => 'Médico no encontrado';

  @override
  String get doctorDetailNotFoundMessage =>
      'El perfil de este especialista no está disponible.';

  @override
  String get doctorDetailLoadError =>
      'No se puede cargar el perfil de este especialista.';

  @override
  String get mapNearbyTitle => 'Médicos cercanos';

  @override
  String get mapNearbyClinicsTitle => 'Clínicas cercanas';

  @override
  String get mapNearbyLoadErrorTitle => 'Error de carga';

  @override
  String get mapNearbyLoadErrorMessage => 'Ocurrió un error en el mapa.';

  @override
  String get mapNearbyPermissionBanner =>
      'Permite la ubicación para ver médicos cerca de ti.';

  @override
  String get mapNearbyClinicsPermissionBanner =>
      'Permite la ubicación para ver clínicas cerca de ti.';

  @override
  String get mapNearbyPermissionRationaleTitle => 'Acceso a la ubicación';

  @override
  String get mapNearbyPermissionRationaleBody =>
      'Medora usa tu ubicación para mostrar especialistas cercanos. También puedes elegir una wilaya manualmente.';

  @override
  String get mapNearbyClinicsPermissionRationaleBody =>
      'Medora usa tu ubicación para mostrar clínicas cercanas. También puedes elegir una wilaya manualmente.';

  @override
  String get mapNearbyPermissionRationaleContinue => 'Continuar';

  @override
  String get mapNearbyPermissionRationaleCancel => 'Cancelar';

  @override
  String get mapNearbyPermissionAllow => 'Permitir';

  @override
  String get mapNearbyChooseWilaya => 'Elegir wilaya';

  @override
  String get mapNearbyMyLocation => 'Mi ubicación';

  @override
  String get mapNearbyEdit => 'Editar';

  @override
  String get mapNearbyWilayaSearch => 'Buscar por wilaya';

  @override
  String mapNearbyWilayaSearchNamed(String wilaya) {
    return 'Buscar por wilaya ($wilaya)';
  }

  @override
  String mapNearbyLocationComma(String commune, String wilaya) {
    return '$commune, $wilaya';
  }

  @override
  String get mapNearbyRadiusLabel => 'Radio:';

  @override
  String mapNearbyRadiusValue(String radius) {
    return '$radius km';
  }

  @override
  String mapNearbyClusterCount(int count) {
    return '$count médicos';
  }

  @override
  String mapNearbyClinicClusterCount(int count) {
    return '$count clínicas';
  }

  @override
  String get mapNearbyChooseWilayaTooltip => 'Elegir wilaya';

  @override
  String get mapNearbySpecialtyTitle => 'Seleccionar especialidad';

  @override
  String get mapNearbySpecialtyClear => 'Limpiar';

  @override
  String get profileTitle => 'Mi perfil';

  @override
  String get profileEdit => 'Editar';

  @override
  String get profileSave => 'Guardar';

  @override
  String get profileAccount => 'Cuenta';

  @override
  String get profileSignOut => 'Cerrar sesión';

  @override
  String get profileFullName => 'Nombre completo';

  @override
  String get profilePhone => 'Teléfono';

  @override
  String get profileEmail => 'Correo electrónico';

  @override
  String get profileBirthDate => 'Fecha de nacimiento';

  @override
  String get profileGender => 'Género';

  @override
  String get profileBloodType => 'Grupo sanguíneo';

  @override
  String get profileAddress => 'Dirección';

  @override
  String get profileAddressLine1 => 'Calle y número';

  @override
  String get profileAddressLine2 => 'Dirección adicional';

  @override
  String get profilePostalCode => 'Código postal';

  @override
  String get profileAllergies => 'Alergias';

  @override
  String get profileChronicConditions => 'Enfermedades crónicas';

  @override
  String get profileInsurance => 'Seguro';

  @override
  String get profileInsuranceProvider => 'Proveedor';

  @override
  String get profileInsuranceNumber => 'Número de afiliado';

  @override
  String get profileNotSet => 'No establecido';

  @override
  String get profileReadOnlyField => 'No editable';

  @override
  String get profileGenderMale => 'Masculino';

  @override
  String get profileGenderFemale => 'Femenino';

  @override
  String get profileGenderOther => 'Otro';

  @override
  String get profileInsuranceCnas => 'CNAS';

  @override
  String get profileInsuranceCasnos => 'CASNOS';

  @override
  String get profileInsuranceNone => 'Ninguno';

  @override
  String get profileInsurancePrivate => 'Privado';

  @override
  String get profilePickBirthDate => 'Elegir fecha';

  @override
  String get profilePickAddress => 'Elegir wilaya y comuna';

  @override
  String get profileTagHint => 'Escribir y pulsar Enter';

  @override
  String get profileAddTag => 'Agregar';

  @override
  String get profileInvalidEmail => 'Correo electrónico inválido';

  @override
  String get profileInvalidBirthDate =>
      'La fecha de nacimiento no puede ser en el futuro';

  @override
  String get profileLoadError => 'No se puede cargar el perfil';

  @override
  String get profileSaveError => 'No se puede guardar';

  @override
  String get profileDeleteAccount => 'Eliminar mi cuenta';

  @override
  String get profileDeleteTitle => '¿Eliminar tu cuenta?';

  @override
  String get profileDeleteWarning =>
      'Esta acción programa la eliminación permanente de tu cuenta y datos personales.';

  @override
  String get profileDeleteGracePeriod =>
      'Tienes 30 días para cancelar la eliminación volviendo a iniciar sesión.';

  @override
  String get profileDeleteConfirm => 'Sí, eliminar mi cuenta';

  @override
  String get profileDeleteFinalTitle => 'Confirmación final';

  @override
  String get profileDeleteFinalMessage =>
      '¿Estás absolutamente seguro? Tu cuenta será programada para eliminación.';

  @override
  String get profileDeleteSuccess => 'Cuenta programada para eliminación';

  @override
  String get profileDeleteError => 'No se puede eliminar';

  @override
  String get deviceVaultBannerTitle => 'Datos solo en este dispositivo';

  @override
  String get deviceVaultBannerBody =>
      'Tu fecha de nacimiento, grupo sanguíneo, dirección, historial médico y documentos permanecen en este dispositivo. Desinstalar la aplicación o perder el teléfono los elimina permanentemente.';

  @override
  String get deviceVaultBannerDismiss => 'Entendido';

  @override
  String get deviceVaultSettingsTitle => 'Bóveda en el dispositivo';

  @override
  String get deviceVaultSettingsBody =>
      'Estos datos viven solo en este dispositivo. Desinstalar la aplicación o perder el teléfono los elimina. No se ofrece copia de seguridad.';

  @override
  String get profileConsents => 'Consentimientos ANPDP';

  @override
  String get consentManagementTitle => 'Mis consentimientos';

  @override
  String consentVersionLabel(String version) {
    return 'Versión $version';
  }

  @override
  String consentGrantedAtLabel(String date) {
    return 'Otorgado el $date';
  }

  @override
  String consentRevokedAtLabel(String date) {
    return 'Revocado el $date';
  }

  @override
  String get consentActive => 'Activo';

  @override
  String get consentRevoked => 'Revocado';

  @override
  String get consentRevokeEssential => 'Retirar mi consentimiento';

  @override
  String get consentRevokeEssentialTitle =>
      '¿Retirar un consentimiento esencial?';

  @override
  String get consentRevokeEssentialMessage =>
      'Retirar un consentimiento esencial suspenderá tu cuenta. No podrás usar la aplicación hasta que la cuenta sea reactivada.';

  @override
  String get consentRevokeEssentialConfirm => 'Retirar y suspender';

  @override
  String get consentRevokeError => 'No se puede revocar el consentimiento';

  @override
  String get consentRevokedLandingTitle => 'Cuenta suspendida';

  @override
  String get consentRevokedLandingMessage =>
      'Has retirado un consentimiento esencial. Tu cuenta está suspendida conforme a la normativa ANPDP.';

  @override
  String get consentRevokedLandingAction => 'Volver al inicio';

  @override
  String get dependentsTitle => 'Dependientes';

  @override
  String get dependentsAdd => 'Agregar dependiente';

  @override
  String get dependentsEdit => 'Editar dependiente';

  @override
  String get dependentsEmpty => 'No hay dependientes registrados';

  @override
  String get dependentsDeleteTitle => '¿Eliminar este dependiente?';

  @override
  String get dependentsDeleteMessage =>
      'Esta acción es permanente. Las citas pasadas permanecen vinculadas a esta persona.';

  @override
  String get dependentsDeleteConfirm => 'Eliminar';

  @override
  String get dependentFullName => 'Nombre completo';

  @override
  String get dependentRelation => 'Relación';

  @override
  String get dependentBirthDate => 'Fecha de nacimiento';

  @override
  String get dependentGender => 'Género';

  @override
  String get dependentRelationChild => 'Hijo/a';

  @override
  String get dependentRelationSpouse => 'Cónyuge';

  @override
  String get dependentRelationParent => 'Padre/Madre';

  @override
  String get dependentRelationOther => 'Otro';

  @override
  String dependentAgeYears(int age) {
    return '$age años';
  }

  @override
  String get dependentSaveError => 'No se puede guardar';

  @override
  String get dependentDeleteError => 'No se puede eliminar';

  @override
  String get medicalRecordsTitle => 'Expediente médico';

  @override
  String get medicalRecordsEmpty => 'Sin documentos';

  @override
  String get medicalRecordsLoadError => 'No se pueden cargar los documentos';

  @override
  String get medicalRecordsFilterAll => 'Todos';

  @override
  String get medicalRecordTypePrescription => 'Receta';

  @override
  String get medicalRecordTypeReport => 'Informe';

  @override
  String get medicalRecordTypeLabResult => 'Resultado de laboratorio';

  @override
  String get medicalRecordTypeImaging => 'Imagen';

  @override
  String get medicalRecordTypeCertificate => 'Certificado';

  @override
  String get medicalRecordTypeOther => 'Otro';

  @override
  String get medicalRecordAuthorPatient => 'Paciente';

  @override
  String get medicalRecordAuthorSpecialist => 'Médico';

  @override
  String get medicalRecordAuthorConcierge => 'Conserje';

  @override
  String get medicalRecordViewerPlaceholder =>
      'La vista previa del documento estará disponible pronto.';

  @override
  String medicalRecordFileSizeBytes(int size) {
    return '$size B';
  }

  @override
  String medicalRecordFileSizeKb(String size) {
    return '$size KB';
  }

  @override
  String medicalRecordFileSizeMb(String size) {
    return '$size MB';
  }

  @override
  String get medicalRecordsUpload => 'Agregar documento';

  @override
  String get medicalRecordsUploadAddCamera => 'Cámara';

  @override
  String get medicalRecordsUploadAddGallery => 'Galería';

  @override
  String get medicalRecordsUploadAddFiles => 'Archivos PDF';

  @override
  String get medicalRecordsUploadForm => 'Formulario completo';

  @override
  String get medicalRecordsOcrGalleryHint =>
      'Foto desde galería — OCR de datos clave';

  @override
  String get medicalRecordsOcrTitle => 'Extracción OCR';

  @override
  String get medicalRecordsOcrHint =>
      'Lee tipo de examen, fecha y elementos clave — sin interpretación clínica.';

  @override
  String get medicalRecordsOcrStart => 'Iniciar extracción';

  @override
  String get medicalRecordsOcrRetry => 'Reintentar extracción';

  @override
  String get medicalRecordsOcrStarted =>
      'Documento guardado — extracción OCR en curso.';

  @override
  String get medicalRecordUploadType => 'Tipo de documento';

  @override
  String get medicalRecordUploadTitle => 'Título (opcional)';

  @override
  String get medicalRecordUploadNotes => 'Notas (opcional)';

  @override
  String get medicalRecordUploadPatient => 'Paciente implicado';

  @override
  String get medicalRecordUploadSubmit => 'Subir';

  @override
  String medicalRecordUploadMaxFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Máximo # archivos por envío',
      one: 'Máximo # archivo por envío',
    );
    return '$_temp0';
  }

  @override
  String get medicalRecordUploadFileTooLarge =>
      'Cada archivo debe ser de 20 MB o menos.';

  @override
  String get medicalRecordUploadInvalidMime =>
      'Formatos aceptados: PDF, JPEG o PNG únicamente.';

  @override
  String get medicalRecordUploadTypeRequired =>
      'Selecciona un tipo de documento.';

  @override
  String get medicalRecordUploadNoFiles => 'Agrega al menos un archivo.';

  @override
  String get medicalRecordUploadStorageUnavailable =>
      'El servicio de archivos no está disponible temporalmente. Inténtalo más tarde.';

  @override
  String get medicalRecordUploadCancel => 'Cancelar';

  @override
  String get medicalRecordUploadSuccess => 'Documento agregado';

  @override
  String get medicalRecordUploadFailed => 'Error al subir';

  @override
  String get medicalRecordDownload => 'Descargar';

  @override
  String get medicalRecordShare => 'Compartir';

  @override
  String get medicalRecordDownloadSuccess => 'Archivo guardado en Descargas';

  @override
  String get medicalRecordViewerLoadError => 'No se puede abrir el documento';

  @override
  String get medicalRecordDeleteTitle => '¿Eliminar este documento?';

  @override
  String get medicalRecordDeleteMessage =>
      'Esta acción es permanente. El archivo será eliminado de tu expediente.';

  @override
  String get medicalRecordDeleteConfirm => 'Eliminar';

  @override
  String get medicalRecordDeleteError => 'No se puede eliminar';

  @override
  String get messagingTitle => 'Mensajería';

  @override
  String get messagingEmpty => 'Sin conversaciones aún';

  @override
  String get messagingLoadError => 'No se pueden cargar las conversaciones';

  @override
  String get messagingAttachmentPreview => 'Adjunto';

  @override
  String get messagingThreadPlaceholder =>
      'Conversación — detalles próximamente';

  @override
  String get messagingComposerHint => 'Escribe un mensaje…';

  @override
  String get messagingSend => 'Enviar';

  @override
  String get messagingAttach => 'Adjuntar documento';

  @override
  String get messagingPickAttachments => 'Elegir documentos';

  @override
  String get messagingAttachConfirm => 'Adjuntar selección';

  @override
  String get messagingMessagePending => 'Enviando…';

  @override
  String get messagingMessageSent => 'Enviado';

  @override
  String get messagingMessageRead => 'Leído';

  @override
  String get messagingSendError => 'Error al enviar';

  @override
  String get messagingLoadMessagesError => 'No se pueden cargar los mensajes';

  @override
  String get notificationsTitle => 'Notificaciones';

  @override
  String get notificationsEmpty => 'Sin notificaciones';

  @override
  String get notificationsLoadError => 'No se pueden cargar las notificaciones';

  @override
  String get notificationsMarkAllRead => 'Marcar todo como leído';

  @override
  String get notificationsPreferences => 'Preferencias';

  @override
  String get notificationsPreferencesTitle => 'Preferencias de notificación';

  @override
  String get notificationsPrefPush => 'Notificaciones push';

  @override
  String get notificationsPrefSms => 'SMS';

  @override
  String get notificationsPrefEmail => 'Correo electrónico';

  @override
  String get notificationsPrefAppointmentReminders => 'Recordatorios de citas';

  @override
  String get notificationsPrefMarketing => 'Ofertas y noticias';

  @override
  String get notificationsPrefReminderHours => 'Recordatorio antes de la cita';

  @override
  String notificationsPrefReminderHoursValue(int hours) {
    return '$hours h antes';
  }

  @override
  String get notificationsPrefSaveError => 'No se puede guardar';

  @override
  String get reviewCreateTitle => 'Dejar una reseña';

  @override
  String get reviewRatingLabel => 'Calificación';

  @override
  String get reviewCommentLabel => 'Comentario (opcional)';

  @override
  String get reviewCommentHint => 'Comparte tu experiencia…';

  @override
  String get reviewSubmit => 'Enviar';

  @override
  String get reviewSubmitError => 'No se puede enviar la reseña.';

  @override
  String get reviewRatingRequired => 'Selecciona una calificación.';

  @override
  String reviewCommentTooLong(int max) {
    return 'El comentario no debe superar $max caracteres.';
  }

  @override
  String get reviewConfirmationTitle => 'Gracias por tu reseña';

  @override
  String get reviewConfirmationBody =>
      'Tu reseña está pendiente de moderación. Se publicará tras la validación por nuestro equipo, habitualmente en 48 horas.';

  @override
  String get reviewConfirmationStatusPending => 'Pendiente de moderación';

  @override
  String get reviewAlreadySubmitted => 'Ya has dejado una reseña';

  @override
  String get reviewDelete => 'Eliminar mi reseña';

  @override
  String get reviewDeleteConfirm => '¿Eliminar esta reseña?';

  @override
  String get reviewDeleteSuccess => 'Reseña eliminada.';

  @override
  String get reviewDeleteError => 'No se puede eliminar la reseña.';

  @override
  String get reviewDeleteExpired =>
      'La eliminación ya no es posible después de 7 días.';

  @override
  String get reviewAlreadyExistsError => 'Ya existe una reseña para esta cita.';

  @override
  String get reviewNotEligibleError =>
      'Esta cita no permite publicar una reseña.';

  @override
  String get reviewBackToAppointment => 'Volver a la cita';

  @override
  String reviewStarsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count estrellas',
      one: '1 estrella',
    );
    return '$_temp0';
  }

  @override
  String get paymentDepositTitle => 'Pagar depósito';

  @override
  String paymentDepositBody(int amount) {
    return 'Se requiere un depósito de $amount DZD para confirmar esta cita.';
  }

  @override
  String get paymentDepositCta => 'Pagar depósito';

  @override
  String paymentDepositAmountLabel(int amount) {
    return '$amount DZD';
  }

  @override
  String get paymentDepositProviderStripeTest => 'Modo de prueba (sandbox)';

  @override
  String get paymentDepositSandboxHint =>
      'El pago se simula en un entorno de prueba.';

  @override
  String get paymentDepositSuccess => 'Pago exitoso. Tu cita está actualizada.';

  @override
  String get paymentDepositFailed => 'El pago falló.';

  @override
  String get paymentDepositNotEligible => 'Esta cita no es elegible para pago.';

  @override
  String get paymentDepositPayeeClinicHint =>
      'El pago va a la clínica (no al especialista).';

  @override
  String paymentDepositPayeeClinicNamed(String clinicName) {
    return 'El pago va a $clinicName.';
  }

  @override
  String get paymentDepositPayeeClinicFallback => 'Clínica';

  @override
  String get specialistVerificationPendingTitle => 'Expediente en revisión';

  @override
  String get specialistVerificationPendingBody =>
      'Nuestro equipo está revisando tu expediente. Recibirás una notificación cuando se tome una decisión.';

  @override
  String get specialistVerificationMoreInfoTitle =>
      'Información adicional requerida';

  @override
  String get specialistVerificationMoreInfoBody =>
      'Nuestro equipo necesita documentos o aclaraciones adicionales antes de validar tu expediente.';

  @override
  String get specialistVerificationRejectedTitle => 'Expediente rechazado';

  @override
  String get specialistVerificationRejectedBody =>
      'Tu expediente no pudo ser validado. Revisa el mensaje a continuación y envía nuevos documentos si es necesario.';

  @override
  String get specialistVerificationSubmitCta => 'Enviar mis documentos';

  @override
  String get specialistVerificationResubmitCta => 'Reenviar mis documentos';

  @override
  String get specialistVerificationCompleteProfileCta => 'Completar mi perfil';

  @override
  String get specialistVerificationRefreshCta => 'Actualizar estado';

  @override
  String get specialistVerificationRefreshLoading => 'Verificando…';

  @override
  String get specialistVerificationRefreshCompleted => 'Verificación completa';

  @override
  String get specialistVerificationRefreshFailed =>
      'Verificación fallida. Inténtalo de nuevo.';

  @override
  String specialistVerificationLastChecked(String timestamp) {
    return 'Última verificación: $timestamp';
  }

  @override
  String get specialistProfileEditTitle => 'Editar mi perfil';

  @override
  String get specialistProfileSaveChanges => 'Guardar cambios';

  @override
  String get specialistProfileSectionInfo => 'Información';

  @override
  String get specialistProfileSectionSpecialties => 'Especialidades';

  @override
  String get specialistProfileSectionLanguages => 'Idiomas hablados';

  @override
  String get specialistProfileSectionConsultation => 'Consulta';

  @override
  String get specialistProfileSectionPractice => 'Lugar de práctica';

  @override
  String get specialistProfileTitle => 'Título';

  @override
  String get specialistProfileBio => 'Biografía';

  @override
  String get specialistProfilePhotoUrl => 'URL de la foto';

  @override
  String get specialistProfileSelectSpecialty => 'Especialidad principal';

  @override
  String get specialistProfileFee => 'Honorario de consulta (DZD)';

  @override
  String get specialistProfileCnas => 'Aprobado CNAS';

  @override
  String get specialistProfileCasnos => 'Aprobado CASNOS';

  @override
  String get specialistProfileTelehealth => 'Telesalud disponible';

  @override
  String get specialistProfileConfirmationPolicy => 'Política de confirmación';

  @override
  String get specialistProfilePolicyManual => 'Manual';

  @override
  String get specialistProfilePolicyAuto => 'Automático';

  @override
  String get specialistProfileBookingWindow => 'Ventana de reserva (días)';

  @override
  String get specialistProfileAddressLine1 => 'Dirección';

  @override
  String get specialistProfileAddressLine2 => 'Dirección adicional';

  @override
  String get specialistProfileVerifiedBadge => 'Cuenta verificada';

  @override
  String get specialistProfileUnverifiedBadge => 'No verificado';

  @override
  String get specialistCredentialsTitle => 'Credenciales profesionales';

  @override
  String get specialistCredentialsSubtitle =>
      'Introduce tu número en el Colegio Médico y sube tus diplomas o tarjetas (PDF, JPEG, PNG — máx. 10 MB).';

  @override
  String get specialistCredentialsCouncilNumber =>
      'Número en el Colegio Médico';

  @override
  String get specialistCredentialsCouncilRequired =>
      'El número en el Colegio Médico es obligatorio.';

  @override
  String get specialistCredentialsType => 'Tipo de credencial';

  @override
  String get specialistCredentialsAddFile => 'Agregar archivo';

  @override
  String get specialistCredentialsNoFiles => 'Agrega al menos una credencial.';

  @override
  String get specialistCredentialsSubmit => 'Enviar para verificación';

  @override
  String get specialistCredentialsExisting => 'Credenciales ya enviadas';

  @override
  String get specialistCredentialsSubmitSuccess =>
      'Credenciales enviadas. Tu expediente está en revisión.';

  @override
  String get specialistCredentialsUploadFailed =>
      'Error al subir. Inténtalo de nuevo.';

  @override
  String get specialistCredentialTypeDiploma => 'Diploma';

  @override
  String get specialistCredentialTypeCouncilCard =>
      'Tarjeta del Colegio Médico';

  @override
  String get specialistCredentialTypeSpecialtyCert =>
      'Certificado de especialidad';

  @override
  String get specialistCredentialTypeOther => 'Otro';

  @override
  String get specialistCredentialStatusPending => 'Pendiente';

  @override
  String get specialistCredentialStatusApproved => 'Aprobado';

  @override
  String get specialistCredentialStatusRejected => 'Rechazado';

  @override
  String get specialistTabInbox => 'Solicitudes';

  @override
  String get specialistTabCalendar => 'Agenda';

  @override
  String get specialistTabMessages => 'Mensajes';

  @override
  String get specialistTabProfile => 'Perfil';

  @override
  String get specialistTabStats => 'Estadísticas';

  @override
  String get specialistShellPlaceholder => 'Próximamente';

  @override
  String get specialistScheduleTitle => 'Mi agenda';

  @override
  String get specialistScheduleTabTemplates => 'Horarios';

  @override
  String get specialistScheduleTabExceptions => 'Excepciones';

  @override
  String get specialistScheduleTabPreview => 'Vista previa';

  @override
  String get specialistScheduleAddWindow => 'Agregar franja';

  @override
  String get specialistScheduleEditWindow => 'Editar franja';

  @override
  String get specialistScheduleSaveWindow => 'Guardar franja';

  @override
  String get specialistScheduleSaveSuccess => 'Agenda guardada.';

  @override
  String get specialistScheduleStartTime => 'Hora de inicio';

  @override
  String get specialistScheduleEndTime => 'Hora de fin';

  @override
  String get specialistScheduleSlotDuration => 'Duración de la franja';

  @override
  String specialistScheduleSlotMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get specialistScheduleMode => 'Modo de consulta';

  @override
  String get specialistScheduleModeInPerson => 'Presencial';

  @override
  String get specialistScheduleModeTelehealth => 'Telesalud';

  @override
  String get specialistScheduleModeBoth => 'Ambos';

  @override
  String get specialistScheduleActive => 'Franja activa';

  @override
  String get specialistScheduleActiveHint =>
      'Desactivar elimina la franja al guardar.';

  @override
  String get specialistScheduleInactive => 'Inactiva';

  @override
  String get specialistScheduleNoWindowsTitle => 'Sin franjas';

  @override
  String get specialistScheduleNoWindowsBody =>
      'Agrega tus horas de consulta para este día.';

  @override
  String get specialistScheduleDeleteWindowTitle => '¿Eliminar esta franja?';

  @override
  String get specialistScheduleDeleteWindowBody =>
      'Las citas generadas desde esta franja ya no estarán disponibles.';

  @override
  String get specialistScheduleAddException => 'Agregar excepción';

  @override
  String get specialistScheduleExceptionDates => 'Período';

  @override
  String get specialistSchedulePickDates => 'Elegir';

  @override
  String get specialistScheduleExceptionKind => 'Tipo';

  @override
  String get specialistScheduleExceptionVacation => 'Vacaciones';

  @override
  String get specialistScheduleExceptionSick => 'Baja por enfermedad';

  @override
  String get specialistScheduleExceptionBlocked => 'No disponible';

  @override
  String get specialistScheduleExceptionExtra => 'Excepción';

  @override
  String get specialistScheduleExceptionNote => 'Nota (opcional)';

  @override
  String get specialistScheduleExceptionSaved => 'Excepción guardada.';

  @override
  String specialistScheduleExceptionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count excepciones',
      one: '1 excepción',
    );
    return '$_temp0';
  }

  @override
  String get specialistScheduleNoExceptionsTitle => 'Sin excepciones';

  @override
  String get specialistScheduleNoExceptionsBody =>
      'Bloquea días por vacaciones, baja o no disponibilidad.';

  @override
  String get specialistSchedulePreviewEmptyTitle => 'Sin franjas';

  @override
  String get specialistSchedulePreviewEmptyBody =>
      'Guarda tus franjas horarias y vuelve aquí para ver las citas generadas.';

  @override
  String get specialistScheduleLoadError => 'No se puede cargar la agenda.';

  @override
  String get specialistScheduleErrorWeekday => 'Día de la semana inválido.';

  @override
  String get specialistScheduleErrorSlotDuration =>
      'Duración o intervalo de franja inválido.';

  @override
  String get specialistScheduleErrorMode => 'Modo de consulta inválido.';

  @override
  String get specialistScheduleErrorStartTime => 'Hora de inicio inválida.';

  @override
  String get specialistScheduleErrorEndTime => 'Hora de fin inválida.';

  @override
  String get specialistScheduleErrorStartDate => 'Fecha de inicio inválida.';

  @override
  String get specialistScheduleErrorEndDate => 'Fecha de fin inválida.';

  @override
  String get specialistScheduleErrorKind => 'Tipo de excepción inválido.';

  @override
  String get specialistScheduleErrorNote =>
      'La nota no debe superar 200 caracteres.';

  @override
  String get specialistScheduleLocation => 'Asignación';

  @override
  String get specialistScheduleLocationHint =>
      'Personal (consultorio) o franjas cedidas a una clínica.';

  @override
  String get specialistScheduleLocationCabinet => 'Mi consultorio';

  @override
  String get specialistScheduleLocationClinicFallback => 'Clínica';

  @override
  String get specialistScheduleDonationPersonal => 'Personal (mi consultorio)';

  @override
  String specialistScheduleDonationClinicNamed(String clinicName) {
    return 'Cedido a $clinicName';
  }

  @override
  String get specialistScheduleDonationNotice =>
      'La clínica es notificada de cualquier cambio en tus franjas cedidas.';

  @override
  String get specialistScheduleDonationNoticeTitle =>
      'Franjas cedidas a una clínica';

  @override
  String get specialistScheduleDonationNoticeGotIt => 'Entendido';

  @override
  String get specialistScheduleDonationFilterClear => 'Todas las franjas';

  @override
  String specialistScheduleDonationFilterBanner(String clinicName) {
    return 'Mostrando franjas cedidas a $clinicName';
  }

  @override
  String get specialistScheduleConflictMessage =>
      'Esta franja se superpone a una cita existente (consultorio o clínica).';

  @override
  String get specialistClinicSessionBadge => 'Sesión clínica';

  @override
  String clinicMembershipsDonatedHours(String hours) {
    return '$hours h / semana cedidas';
  }

  @override
  String get clinicMembershipsDonatedHoursNone => 'Sin franjas cedidas';

  @override
  String get clinicMembershipsManageDonated => 'Gestionar franjas cedidas';

  @override
  String get specialistProfileManageSchedule => 'Gestionar mi agenda';

  @override
  String get specialistInboxTabRequests => 'Solicitudes';

  @override
  String get specialistInboxTabConfirmed => 'Confirmadas';

  @override
  String get specialistInboxTabHistory => 'Historial';

  @override
  String get specialistInboxEmptyRequests => 'Sin solicitudes pendientes';

  @override
  String get specialistInboxEmptyConfirmed => 'Sin citas confirmadas';

  @override
  String get specialistInboxEmptyHistory => 'Sin citas pasadas';

  @override
  String get specialistAppointmentDetailTitle => 'Detalle de la cita';

  @override
  String get specialistAppointmentPatientAnonymous =>
      'Paciente (identidad oculta)';

  @override
  String get specialistAppointmentPatientLabel => 'Paciente';

  @override
  String specialistAppointmentPatientRef(String ref) {
    return 'Paciente ····$ref';
  }

  @override
  String get specialistAppointmentConfirmed => 'Cita confirmada';

  @override
  String get specialistAppointmentCancelTitle => 'Cancelar cita';

  @override
  String get specialistAppointmentStartTelehealth => 'Iniciar telesalud';

  @override
  String get specialistTelehealthComingSoon =>
      'La telesalud estará disponible pronto.';

  @override
  String get specialistAppointmentViewRecords => 'Ver expediente médico';

  @override
  String get specialistAppointmentIssuePrescription => 'Emitir receta';

  @override
  String get specialistAppointmentConfirm => 'Confirmar cita';

  @override
  String get specialistAppointmentMarkNoShow => 'Marcar como ausente';

  @override
  String get specialistCalendarMonthView => 'Mes';

  @override
  String get specialistCalendarWeekView => 'Semana';

  @override
  String get specialistCalendarDayAppointments => 'Citas de hoy';

  @override
  String get specialistCalendarEmptyDay => 'Sin citas hoy';

  @override
  String get specialistCalendarLoadError => 'No se puede cargar la agenda.';

  @override
  String get specialistPatientRecordsTitle => 'Expediente del paciente';

  @override
  String get specialistPatientRecordsEmpty => 'Sin documentos compartidos';

  @override
  String get specialistPatientRecordsForbidden =>
      'Ningún documento compartido contigo para este paciente';

  @override
  String get specialistPatientRecordsLoadError =>
      'No se puede cargar el expediente.';

  @override
  String get specialistPrescriptionTitle => 'Receta';

  @override
  String get specialistPrescriptionDiagnosis => 'Diagnóstico';

  @override
  String get specialistPrescriptionValidUntil => 'Válida hasta';

  @override
  String get specialistPrescriptionDrugsSection => 'Medicamentos';

  @override
  String specialistPrescriptionDrugNumber(int number) {
    return 'Medicamento $number';
  }

  @override
  String get specialistPrescriptionAddDrug => 'Agregar medicamento';

  @override
  String get specialistPrescriptionDrugName => 'Nombre del medicamento';

  @override
  String get specialistPrescriptionDosage => 'Dosis';

  @override
  String get specialistPrescriptionFrequency => 'Frecuencia';

  @override
  String get specialistPrescriptionDurationDays => 'Duración (días)';

  @override
  String get specialistPrescriptionInstructions => 'Instrucciones';

  @override
  String get specialistPrescriptionSubmit => 'Emitir receta';

  @override
  String get specialistPrescriptionSuccess => 'Receta emitida con éxito';

  @override
  String get specialistPrescriptionAtLeastOneDrug =>
      'Agrega al menos un medicamento';

  @override
  String get specialistTeleconsultTitle => 'Teleconsulta';

  @override
  String get specialistTeleconsultWindowClosed =>
      'La sesión aún no está abierta.';

  @override
  String specialistTeleconsultOpensIn(String time) {
    return 'Abre en $time';
  }

  @override
  String get specialistTeleconsultWaitingPatient => 'Esperando al paciente…';

  @override
  String get specialistTeleconsultConnectionError =>
      'No se puede iniciar la teleconsulta.';

  @override
  String get patientTeleconsultTitle => 'Teleconsulta';

  @override
  String get patientTeleconsultWindowClosed => 'La sesión aún no está abierta.';

  @override
  String patientTeleconsultOpensIn(String time) {
    return 'Abre en $time';
  }

  @override
  String get patientTeleconsultWaitingDoctor => 'Esperando al médico…';

  @override
  String get patientTeleconsultConnectionError =>
      'No se puede iniciar la teleconsulta.';

  @override
  String get teleconsultMicOn => 'Micrófono encendido';

  @override
  String get teleconsultMicOff => 'Micrófono apagado';

  @override
  String get teleconsultCameraOn => 'Cámara encendida';

  @override
  String get teleconsultCameraOff => 'Cámara apagada';

  @override
  String get teleconsultHangupTitle => '¿Finalizar llamada?';

  @override
  String get teleconsultHangupMessage =>
      'El otro participante será desconectado.';

  @override
  String get teleconsultHangupConfirm => 'Colgar';

  @override
  String get teleconsultHangupStay => 'Quedarse en la llamada';

  @override
  String get specialistStatsRatingTitle => 'Valoración media';

  @override
  String get specialistStatsAppointments => 'Citas';

  @override
  String get specialistStatsCompleted => 'Completadas';

  @override
  String get specialistStatsRevenue => 'Ingresos';

  @override
  String get specialistStatsNoShowRate => 'Tasa de ausencias';

  @override
  String get specialistStatsTrendTitle => 'Tendencia';

  @override
  String get specialistStatsMetricAppointments => 'Citas';

  @override
  String get specialistStatsMetricRevenue => 'Ingresos';

  @override
  String get specialistStatsMetricNoShow => 'Ausencias';

  @override
  String get specialistStatsMetricNewPatients => 'Nuevos pacientes';

  @override
  String get specialistStatsGranularityDay => 'Día';

  @override
  String get specialistStatsGranularityWeek => 'Semana';

  @override
  String get specialistStatsGranularityMonth => 'Mes';

  @override
  String get specialistStatsLoadError =>
      'No se pueden cargar las estadísticas.';

  @override
  String get specialistStatsChartEmpty =>
      'No hay suficientes datos para mostrar el gráfico.';

  @override
  String get specialistStatsReviewsTitle => 'Mis reseñas';

  @override
  String get specialistStatsReviewsEmpty => 'Sin reseñas publicadas';

  @override
  String get specialistStatsReviewsLoadError =>
      'No se pueden cargar las reseñas.';

  @override
  String get searchEntityDoctors => 'Médicos';

  @override
  String get searchEntityClinics => 'Clínicas';

  @override
  String get searchHintClinics => 'Buscar clínica…';

  @override
  String get searchEmptyClinicsTitle => 'Ninguna clínica coincide';

  @override
  String get searchEmptyClinicsMessage => '¿Ampliar zona o cambiar filtros?';

  @override
  String get searchSuggestionsClinics => 'Clínicas';

  @override
  String get clinicCardBookCta => 'Ver clínica';

  @override
  String get clinicCardTelehealth => 'Telesalud';

  @override
  String clinicCardFromPrice(int price, String currency) {
    return 'Desde $price $currency';
  }

  @override
  String get clinicDetailTitle => 'Clínica';

  @override
  String get clinicDetailAboutTitle => 'Acerca de';

  @override
  String get clinicDetailAboutEmpty => 'Sin descripción disponible.';

  @override
  String get clinicDetailServicesTitle => 'Servicios';

  @override
  String get clinicDetailServicesEmpty => 'Sin servicios publicados aún.';

  @override
  String get clinicDetailSpecialistsTitle => 'Profesionales';

  @override
  String get clinicDetailSpecialistsEmpty =>
      'Sin profesionales visibles en este perfil.';

  @override
  String get clinicDetailReviewsTitle => 'Reseñas';

  @override
  String get clinicDetailReviewsEmpty => 'Sin reseñas públicas aún.';

  @override
  String get clinicDetailLoadError => 'No se puede cargar la clínica.';

  @override
  String get clinicDetailNotFoundTitle => 'Clínica no encontrada';

  @override
  String get clinicDetailNotFoundMessage => 'Esta clínica no está disponible.';

  @override
  String get clinicDetailMapUnavailable => 'Mapa no disponible';

  @override
  String get clinicDetailAssignNotice =>
      'Estás reservando un servicio; la clínica asigna al profesional.';

  @override
  String clinicDetailDurationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String clinicDetailServicePrice(int price, String currency) {
    return '$price $currency';
  }

  @override
  String get clinicDetailVerifiedPatient => 'Paciente verificado';

  @override
  String get clinicDetailLoadMoreReviews => 'Cargar más reseñas';

  @override
  String get clinicDetailVerifiedBadge => 'Clínica verificada';

  @override
  String get discoveryClinicsEmptyTitle => 'No se encontraron clínicas';

  @override
  String get discoveryClinicsEmptyMessage =>
      'No hay clínicas verificadas disponibles en este momento.';

  @override
  String get clinicBookingCta => 'Reservar';

  @override
  String get clinicBookingSummaryClinic => 'Clínica';

  @override
  String get clinicBookingSummaryService => 'Servicio';

  @override
  String get clinicMembershipsTitle => 'Afiliaciones a clínicas';

  @override
  String get clinicMembershipsEmpty =>
      'Sin invitaciones ni afiliaciones en este momento.';

  @override
  String get clinicMembershipsInvitations => 'Invitaciones';

  @override
  String get clinicMembershipsActive => 'Afiliaciones activas';

  @override
  String get clinicMembershipsAccept => 'Aceptar';

  @override
  String get clinicMembershipsRefuse => 'Rechazar';

  @override
  String get clinicMembershipsDetach => 'Solicitar desvinculación';

  @override
  String get clinicMembershipsDetachPending =>
      'Desvinculación pendiente de aprobación';

  @override
  String get clinicMembershipsVisibleOnProfile =>
      'Visible en mi perfil público';

  @override
  String get clinicMembershipsLoadError =>
      'No se pueden cargar las afiliaciones.';

  @override
  String get clinicMembershipsActionError =>
      'Acción fallida. Inténtalo de nuevo.';

  @override
  String get appointmentDetailClinicBooking => 'Reserva en clínica';

  @override
  String get appointmentDetailClinicService => 'Servicio';

  @override
  String get appointmentDetailAwaitingSpecialist =>
      'Esperando la asignación de un profesional por parte de la clínica.';

  @override
  String get appointmentDetailAssignedSpecialist => 'Profesional asignado';

  @override
  String get appointmentReviewSession => 'Reseña de consulta';

  @override
  String get appointmentReviewClinicProfile => 'Reseña de clínica';

  @override
  String get reviewClinicProfileCreateTitle => 'Reseña de clínica';

  @override
  String get reviewClinicAlreadySubmitted =>
      'Ya has dejado una reseña para esta clínica.';

  @override
  String get painLocalizationTitle => '¿Dónde te duele?';

  @override
  String painLocalizationDownloadProgress(int percent) {
    return 'Descargando modelo ($percent%)';
  }

  @override
  String get painLocalizationOfflineTitle =>
      'Modelo no disponible sin conexión';

  @override
  String get painLocalizationOfflineMessage =>
      'Conéctate para descargar el modelo 3D (aprox. 12 MB). Luego la herramienta funcionará sin red.';

  @override
  String get painLocalizationRetry => 'Reintentar';

  @override
  String get painLocalizationWebGlTitle => 'Visualización 3D no disponible';

  @override
  String get painLocalizationWebGlMessage =>
      'Este dispositivo no puede mostrar el modelo 3D. La función está oculta aquí.';

  @override
  String get painLocalizationErrorTitle => 'No se puede cargar el modelo';

  @override
  String get painLocalizationErrorMessage =>
      'La descarga falló. Inténtalo de nuevo.';

  @override
  String get painLocalizationCardSubtitle =>
      'Localiza la zona en un modelo 3D. Herramienta exploratoria: nada se envía a un médico.';

  @override
  String get painLocalizationChooserTitle => '¿Qué modelo mostrar?';

  @override
  String get painLocalizationChooserDisclaimer =>
      'La elección del cuerpo es tuya; no se deduce de tu perfil. Esta herramienta es exploratoria: la selección permanece en el dispositivo y no se envía a un médico.';

  @override
  String get painLocalizationChooserMale => 'Masculino';

  @override
  String get painLocalizationChooserFemale => 'Femenino';

  @override
  String get painLocalizationSwitchBody => 'Cambiar modelo';

  @override
  String get painLocalizationConfirm => 'Confirmar';

  @override
  String get painLocalizationCancel => 'Cancelar';

  @override
  String get painLocalizationClearAll => 'Limpiar todo';

  @override
  String get painLocalizationClearAllTitle => '¿Limpiar selecciones?';

  @override
  String get painLocalizationClearAllMessage =>
      'Todas las zonas indicadas serán eliminadas de este dispositivo.';

  @override
  String get painLocalizationEmpty =>
      'Toca el modelo para explorar una zona y agrégala si es necesario. Nada se envía a un médico.';

  @override
  String get painLocalizationAddSelection => 'Agregar esta zona';

  @override
  String get painLocalizationSelectionAlreadyAdded =>
      'Esta zona ya está en tu lista';

  @override
  String get painLocalizationRemoveChip => 'Eliminar';

  @override
  String get painLocalizationConfirmedSnackbar =>
      'Selecciones guardadas en este dispositivo.';

  @override
  String get anamnesisTitle => 'Cuestionario';

  @override
  String get anamnesisLoading => 'Cargando cuestionario…';

  @override
  String get anamnesisError => 'No se puede cargar el cuestionario.';

  @override
  String get anamnesisRetry => 'Reintentar';

  @override
  String get anamnesisContinue => 'Continuar';

  @override
  String get anamnesisDone => 'Finalizar';

  @override
  String get anamnesisCompleteTitle => 'Cuestionario completado';

  @override
  String get anamnesisCompleteMessage => 'Tus respuestas han sido guardadas.';

  @override
  String get anamnesisOfflineQueued =>
      'Respuesta guardada localmente — se sincronizará al reconectarse.';

  @override
  String get anamnesisDisclaimer =>
      'Ayuda con la orientación — no es un diagnóstico médico.';

  @override
  String get anamnesisUnsupportedQuestion => 'Tipo de pregunta no compatible.';

  @override
  String get anamnesisDurationValue => 'Duración';

  @override
  String anamnesisProgressOpen(int answered) {
    return '$answered pregunta(s) respondida(s)';
  }

  @override
  String anamnesisProgressCount(int answered, int total) {
    return '$answered / $total';
  }

  @override
  String get anamnesisScoreLabel => 'Puntuación de relevancia regenerativa';

  @override
  String get anamnesisFollowUpTitle => 'Preguntas de seguimiento';

  @override
  String get anamnesisFollowUpHint =>
      'Algunos detalles más para afinar la orientación — no es un diagnóstico.';

  @override
  String get anamnesisFollowUpLoading => 'Preparando preguntas de seguimiento…';

  @override
  String anamnesisFollowUpProgress(int current, int total) {
    return 'Pregunta $current / $total';
  }

  @override
  String get anamnesisDocsCta =>
      'Agregar documento (RM / radiografía / análisis)';

  @override
  String get anamnesisDocsTitle => 'Documentos de examen';

  @override
  String get anamnesisDocsHint =>
      'Adjunta un informe de imagen o biología. La extracción lee los datos clave — sin interpretación clínica.';

  @override
  String get anamnesisDocsCamera => 'Foto';

  @override
  String get anamnesisDocsGallery => 'Galería';

  @override
  String get anamnesisDocsPickFile => 'Archivo';

  @override
  String get anamnesisDocsEmpty => 'Sin documentos para esta sesión.';

  @override
  String get anamnesisDocsUntitled => 'Documento';

  @override
  String get anamnesisDocsReview => 'Revisar';

  @override
  String get anamnesisDocsReviewTitle => 'Extracción OCR';

  @override
  String get anamnesisDocsReviewHint =>
      'Corrige si es necesario. El texto OCR bruto nunca se sobrescribe.';

  @override
  String get anamnesisDocsStatusQueued => 'En cola';

  @override
  String get anamnesisDocsStatusProcessing => 'Extrayendo…';

  @override
  String get anamnesisDocsStatusExtracted => 'Extraído — a revisar';

  @override
  String get anamnesisDocsStatusFailed => 'Extracción fallida';

  @override
  String get anamnesisDocsFieldExamType => 'Tipo de examen';

  @override
  String get anamnesisDocsFieldExamDate => 'Fecha del examen';

  @override
  String get anamnesisDocsFieldBodyRegion => 'Región corporal';

  @override
  String get anamnesisDocsFieldFacility => 'Centro';

  @override
  String get anamnesisDocsFieldFindings => 'Hallazgos clave (uno por línea)';

  @override
  String get anamnesisDocsFieldNotes => 'Notas';

  @override
  String get anamnesisDocsRawOcr => 'Texto OCR bruto';

  @override
  String get anamnesisDocsSaveCorrections => 'Guardar correcciones';

  @override
  String get anamnesisDocsCorrectionsSaved => 'Correcciones guardadas.';

  @override
  String get anamnesisUrgenceTitle => 'Urgencia — consulta de inmediato';

  @override
  String get anamnesisUrgenceFallback =>
      'Se detectaron señales de alerta. Acude a urgencias o llama a servicios de emergencia de inmediato. Este mensaje no es un diagnóstico.';

  @override
  String get anamnesisUrgenceNumbersLabel => 'Números de emergencia';

  @override
  String get anamnesisUrgenceAck => 'Entendido';

  @override
  String get anamnesisRegenerativeTitle => 'Orientación regenerativa';

  @override
  String get anamnesisRegenerativeMessage =>
      'Tu camino puede continuar hacia una evaluación regenerativa personalizada.';

  @override
  String get anamnesisParcoursCta => 'Generar mi evaluación';

  @override
  String get anamnesisParcoursSoon => 'Generando evaluación…';

  @override
  String get bilanListTitle => 'Mi evaluación';

  @override
  String get bilanDetailTitle => 'Evaluación detallada';

  @override
  String get bilanLoadError => 'No se puede cargar la evaluación.';

  @override
  String get bilanListEmpty => 'Sin evaluaciones aún.';

  @override
  String bilanListItemTitle(String zone) {
    return 'Zona $zone';
  }

  @override
  String bilanListItemSubtitle(int score, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Puntuación $score % · $dateString';
  }

  @override
  String bilanScoreLabel(int score) {
    return 'Puntuación de relevancia: $score %';
  }

  @override
  String get bilanSummarySection => 'Resumen';

  @override
  String get bilanOrientationSection => 'Orientación';

  @override
  String get bilanExportPdf => 'Exportar PDF';

  @override
  String get bilanPdfOpenError => 'No se puede abrir el PDF.';

  @override
  String get bilanTransmitCta => 'Enviar al especialista';

  @override
  String get bilanTransmitTitle => 'Transmisión de evaluación';

  @override
  String get bilanTransmitHelp =>
      'Introduce el identificador del especialista destinatario (UUID directory.specialists).';

  @override
  String get bilanTransmitSpecialistId => 'ID del especialista';

  @override
  String get bilanTransmitSpecialistRequired =>
      'El identificador del especialista es obligatorio.';

  @override
  String get bilanTransmitConfirm => 'Enviar';

  @override
  String get bilanTransmitSuccess => 'Evaluación enviada al especialista.';

  @override
  String get profileBilanTile => 'Mi evaluación';

  @override
  String get referralMatchesTitle => 'Especialistas recomendados';

  @override
  String get referralMatchesEmpty =>
      'Sin especialistas recomendados en este momento. Inténtalo de nuevo tras la validación por conserjería.';

  @override
  String referralMatchScore(int score) {
    return 'Relevancia $score %';
  }

  @override
  String get referralMatchSpecialistFallback => 'Especialista';

  @override
  String get referralLoadError => 'No se pueden cargar las recomendaciones.';

  @override
  String get referralSelectSuccess =>
      'Especialista seleccionado — puedes reservar una cita.';

  @override
  String get profileCoachingTile => 'Mi coaching';

  @override
  String get bilanCoachingCta => 'Mi coaching biológico';

  @override
  String get coachingListTitle => 'Mi coaching';

  @override
  String get coachingPlanTitle => 'Plan de coaching';

  @override
  String get coachingLoadError => 'No se puede cargar el coaching.';

  @override
  String get coachingListEmpty => 'Sin planes de coaching aún.';

  @override
  String get coachingGenerating => 'Generando plan…';

  @override
  String coachingListItemTitle(String sessionId) {
    return 'Sesión $sessionId';
  }

  @override
  String coachingListItemSubtitle(int goalMl, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Objetivo de hidratación $goalMl ml · $dateString';
  }

  @override
  String get coachingProgressLabel => 'Optimización biológica';

  @override
  String get coachingProgressError => 'No se puede cargar el progreso.';

  @override
  String get coachingHydrationTitle => 'Hidratación';

  @override
  String get coachingHydrationError => 'No se puede cargar la hidratación.';

  @override
  String coachingHydrationMlGoal(int goalMl) {
    return '/ $goalMl ml';
  }

  @override
  String coachingHydrationAdd(int amountMl) {
    return '+ $amountMl ml';
  }

  @override
  String get coachingHydrationLogged => 'Hidratación registrada.';

  @override
  String get coachingSleepTitle => 'Sueño';

  @override
  String get coachingSleepError => 'No se puede cargar el sueño.';

  @override
  String get coachingSleepEmpty => 'Sin registros recientes.';

  @override
  String coachingSleepHoursLabel(String hours) {
    return 'Duración: $hours h';
  }

  @override
  String get coachingSleepQualityLabel => 'Calidad (1 a 5)';

  @override
  String get coachingSleepLogCta => 'Registrar noche';

  @override
  String get coachingSleepLogged => 'Sueño registrado.';

  @override
  String coachingSleepLastEntry(String date, double hours, int quality) {
    return 'Último: $date — $hours h, calidad $quality/5';
  }

  @override
  String get coachingSectionNutrition => 'Nutrición';

  @override
  String get coachingSectionMobility => 'Movilidad';

  @override
  String get coachingSectionPosture => 'Postura';

  @override
  String get specialistIncomingBilansTab => 'Evaluaciones';

  @override
  String get specialistIncomingBilansEmpty => 'Sin evaluaciones entrantes.';

  @override
  String get specialistIncomingBilansError =>
      'No se pueden cargar las evaluaciones entrantes.';

  @override
  String specialistIncomingBilanItem(String id) {
    return 'Evaluación $id';
  }

  @override
  String get specialistIncomingBilanDetailTitle => 'Evaluación entrante';

  @override
  String get specialistIncomingBilanMarkReviewed => 'Marcar como revisado';

  @override
  String get specialistIncomingBilanReviewed =>
      'Evaluación marcada como revisada.';

  @override
  String get specialistIncomingBilanOpenAgenda => 'Abrir agenda';

  @override
  String get freemiumUnlockCta => 'Desbloquear';

  @override
  String get freemiumUnlockSuccess => 'Contenido desbloqueado con éxito.';

  @override
  String get freemiumUnlockFailed => 'El pago falló.';

  @override
  String freemiumAmountLabel(int amount) {
    return '$amount DZD (sandbox)';
  }

  @override
  String get freemiumBilanTitle => 'Evaluación detallada';

  @override
  String get freemiumBilanBody =>
      'Accede a las secciones completas, documentos y exportación PDF.';

  @override
  String get freemiumBilanPdfCta => 'Desbloquear PDF';

  @override
  String get freemiumCoachingTitle => 'Coaching premium';

  @override
  String get freemiumCoachingBody =>
      'Desbloquea el plan personalizado y los rastreadores diarios.';

  @override
  String get alreadyHaveAccount => 'Ya tengo una cuenta';

  @override
  String get needHelp => '¿Necesitas ayuda?';

  @override
  String get viewGuide => 'Consultar la guía';

  @override
  String get welcomeHeroGpsLabel => 'GPS MÉDICO';

  @override
  String get welcomeHeroGpsCaption => 'Proximidad optimizada';

  @override
  String get welcomeHeroRecordsLabel => 'EXPEDIENTES';

  @override
  String get welcomeHeroRecordsCaption => 'Salud digital';

  @override
  String get welcomeHeroAnalysisTitle => 'Análisis inteligente';

  @override
  String get welcomeHeroAnalysisCaption => 'Diagnósticos en tiempo real';

  @override
  String onboardingSmartTitle(String brand) {
    return 'Tu $brand inteligente';
  }

  @override
  String onboardingSmartBody(String brand) {
    return 'Navega con tranquilidad por el panorama médico argelino. $brand utiliza la IA para guiarte hacia la mejor atención y vigilar tu vitalidad en tiempo real.';
  }

  @override
  String get onboardingFeatureGuidanceTitle => 'Orientación experta';

  @override
  String get onboardingFeatureGuidanceBody =>
      'Encuentra a los especialistas adecuados en toda Argelia.';

  @override
  String get onboardingFeatureMonitoringTitle => 'Monitorización con IA';

  @override
  String get onboardingFeatureMonitoringBody =>
      'Seguimiento inteligente de tus constantes de salud.';

  @override
  String get onboardingStepPainTitle => 'Localiza tu dolor';

  @override
  String get onboardingStepPainBody =>
      'Identifica con precisión tus zonas de molestia.';

  @override
  String get onboardingStepScreeningTitle => 'Cribado inteligente';

  @override
  String get onboardingStepScreeningBody =>
      'Nuestra IA analiza tus síntomas y documentos.';

  @override
  String get onboardingStepPrepareTitle => 'Prepara tu cuerpo';

  @override
  String get onboardingStepPrepareBody =>
      'Recibe consejos personalizados antes de la consulta.';

  @override
  String get onboardingStepExpertTitle => 'Conoce al experto';

  @override
  String get onboardingStepExpertBody =>
      'Pide cita con el especialista adecuado.';

  @override
  String get onboardingBadgeHosting => 'Alojamiento local';

  @override
  String get onboardingBadgeEncryption => 'Cifrado';

  @override
  String get onboardingBadgeDoctors => 'Médicos verificados';

  @override
  String get onboardingBadgeDoctorsSubtitle => 'Autorizados por el Estado';

  @override
  String get onboardingTrustHosting =>
      'Alojamiento local certificado por la ANPDP';

  @override
  String get onboardingTrustEncryption => 'Cifrado de extremo a extremo';

  @override
  String get onboardingTrustDoctors => 'Médicos verificados y autorizados';

  @override
  String get securedLabel => 'Seguro';

  @override
  String get instantLabel => 'Instantáneo';

  @override
  String get onboardingHeroGuidanceTitle => 'Orientación inteligente';

  @override
  String get onboardingHeroGuidanceSubtitle => 'IA + red médica argelina';

  @override
  String get onboardingHeroSampleDoctorName => 'Dr. Karim B.';

  @override
  String get onboardingHeroSampleDoctorSpecialty => 'Cardiología';

  @override
  String get onboardingHeroSampleDoctorRating => '4,9';

  @override
  String get onboardingHeroAiStatusLabel => 'ESTADO IA';

  @override
  String get onboardingHeroAiStatusValue => 'Análisis activo';

  @override
  String get onboardingHeroPathTitle => 'Tu recorrido';

  @override
  String get onboardingHeroPathSteps => 'Dolor → Análisis → Especialista';

  @override
  String get orSeparator => 'O';

  @override
  String get signInWithBiometrics => 'Iniciar sesión con biometría';

  @override
  String get notRegisteredYet => '¿Aún no te has registrado?';

  @override
  String get authToastTitle => 'Autenticación';

  @override
  String get ninVisualGuideLabel => 'GUÍA VISUAL';

  @override
  String get ninVisualGuideBody =>
      'El NIN está en la parte superior derecha de tu tarjeta biométrica.';

  @override
  String get ninFieldLabel => 'NIN';

  @override
  String get ninDigitsCount => '18 DÍGITOS';

  @override
  String get ninWhyLink => '¿Por qué el NIN?';

  @override
  String get passwordEncryptionNotice =>
      'Cifrado de extremo a extremo conforme a la ANPDP';

  @override
  String get passwordStrengthLabel => 'Seguridad de la contraseña:';

  @override
  String get passwordStrengthWeak => 'Débil';

  @override
  String get passwordStrengthMedium => 'Media';

  @override
  String get passwordStrengthStrong => 'Fuerte';

  @override
  String get passwordRuleMinLength => 'Al menos 10 caracteres';

  @override
  String get passwordRuleUppercase => 'Una mayúscula';

  @override
  String get passwordRuleDigit => 'Un número';

  @override
  String get passwordRuleSpecial => 'Un carácter especial';

  @override
  String get consentHealthSubtitle =>
      'Necesario para el funcionamiento de la aplicación y el seguimiento de tu historial médico.';

  @override
  String get consentDataSubtitle =>
      'Autorizar el tratamiento seguro y el alojamiento de tus datos clínicos.';

  @override
  String get consentMarketingSubtitle =>
      'Recibe consejos de coaching biológico personalizados y novedades de salud.';

  @override
  String get otpHelpBody =>
      'Si no recibes el código, comprueba tu conexión de red o contacta con nuestro soporte.';

  @override
  String get biometricEnableTitle => 'Activa el inicio de sesión biométrico';

  @override
  String get biometricEnableSubtitle =>
      'Inicia sesión más rápido y con total seguridad usando Face ID o tu huella.';

  @override
  String get successFeatureNavigationLabel => 'NAVEGACIÓN';

  @override
  String get successFeatureNavigationBody => 'Encuentra clínicas';

  @override
  String get successFeatureAppointmentsLabel => 'CITAS';

  @override
  String get successFeatureAppointmentsBody => 'Gestión sencilla';

  @override
  String get profilePlaceholderTitle => 'Perfil — provisional';

  @override
  String get profilePlaceholderSession => 'Sesión activa (token oculto).';

  @override
  String profilePlaceholderRole(String role) {
    return 'Rol: $role';
  }

  @override
  String get profilePlaceholderSimulateExpiry => 'Simular caducidad de sesión';

  @override
  String get errorRegistrationIncomplete =>
      'Los datos de registro están incompletos.';

  @override
  String get errorEmptyResponse => 'Respuesta vacía del servidor.';

  @override
  String get errorConflict =>
      'Se ha producido un conflicto (puede que este recurso ya exista).';

  @override
  String get errorInvalidInput => 'Los datos indicados no son válidos.';

  @override
  String get errorUnexpected => 'Se ha producido un error inesperado.';

  @override
  String get errorPasswordUpdatedSignInAgain =>
      'Contraseña actualizada. Inicia sesión con tu nueva contraseña.';

  @override
  String get painSelectionMissing => 'Falta la selección de la zona de dolor.';

  @override
  String get specialistPrescriptionSubmitError =>
      'No se ha podido crear la receta.';
}
