class Order {
  int? id;
  String? date;
  String? total;
  String? status;
  List<String>? items;

  Order({this.id, this.date, this.total, this.status, this.items});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'] as int?,
    date: json['date'] as String?,
    total: json['total'] as String?,
    status: json['status'] as String?,
    items: json['items'] == null ? null : List<String>.from(json['items']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
    'total': total,
    'status': status,
    'items': items,
  };
}
