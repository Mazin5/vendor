class Reservation {
  final String id;
  final String userName;
  final DateTime date;
  final String service;

  Reservation({required this.id, required this.userName, required this.date, required this.service});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      userName: json['userName'],
      date: DateTime.parse(json['date']),
      service: json['service'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'date': date.toIso8601String(),
        'service': service,
      };
}
