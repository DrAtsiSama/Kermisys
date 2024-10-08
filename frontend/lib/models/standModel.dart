class Stand {
  final int id;
  final String name;
  final String type;
  final int stock;
  final String description;
  final String location;

  Stand({
    required this.id,
    required this.name,
    required this.type,
    required this.stock,
    required this.description,
    required this.location,
  });

  factory Stand.fromJson(Map<String, dynamic> json) {
    return Stand(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      stock: json['stock'],
      description: json['description'],
      location: json['location'],
    );
  }
}
