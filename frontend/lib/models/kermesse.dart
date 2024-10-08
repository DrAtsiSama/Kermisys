class Kermesse {
  final int id;
  final String name;
  final String description;
  final String location;
  final String startDate;
  final String endDate;

  Kermesse({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.startDate,
    required this.endDate,
  });

  factory Kermesse.fromJson(Map<String, dynamic> json) {
    return Kermesse(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? "",
      location: json['location'],
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
  }
}
