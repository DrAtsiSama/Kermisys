class Stand {
  final int id;
  final String name;
  final String type;
  final String? description;
  final String? location;
  int stock;
  final DateTime? startDate;
  final DateTime? endDate;
  final int kermesseId;
  final int ownerId;

  Stand({
    required this.id,
    required this.name,
    required this.type,
    required this.stock,
    this.description,
    this.location,
    this.startDate,
    this.endDate,
    required this.kermesseId,
    required this.ownerId,
  });

  factory Stand.fromJson(Map<String, dynamic> json) {
    return Stand(
      id: json['ID'] ?? 0, // Utilisation de 'ID' au lieu de 'id'
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      stock: json['stock'] ?? 0,
      description: json['description'],
      location: json['location'],
      startDate: json['start_date'] != null && json['start_date'] != "0001-01-01T00:00:00Z"
          ? DateTime.parse(json['start_date'])
          : null,
      endDate: json['end_date'] != null && json['end_date'] != "0001-01-01T00:00:00Z"
          ? DateTime.parse(json['end_date'])
          : null,
      kermesseId: json['kermesse_id'] ?? 0,
      ownerId: json['owner_id'] ?? 0,
    );
  }
}
