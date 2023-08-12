class NotificationModel {
  final String title;
  final String description;
  final bool wasRead;

  NotificationModel({
    required this.title,
    required this.description,
    this.wasRead = false,
  });
}