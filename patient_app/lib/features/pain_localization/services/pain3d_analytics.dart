/// Local-only product events. Nothing is sent to the API.
class Pain3dAnalyticsEvent {
  const Pain3dAnalyticsEvent(this.name, {this.properties = const {}});

  final String name;
  final Map<String, Object?> properties;
}

class Pain3dAnalytics {
  static const screenOpen = 'pain3d_screen_open';
  static const bodyChosen = 'pain3d_body_chosen';
  static const downloadCompleted = 'pain3d_download_completed';
  static const selectionConfirmed = 'pain3d_selection_confirmed';

  final List<Pain3dAnalyticsEvent> _events = [];

  List<Pain3dAnalyticsEvent> get events => List.unmodifiable(_events);

  void log(String name, {Map<String, Object?> properties = const {}}) {
    _events.add(Pain3dAnalyticsEvent(name, properties: properties));
  }
}
