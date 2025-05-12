class RFQ {
  RFQ({
    required this.title,
    required this.Location,
    required this.customTitle,
    required this.customerId,
    required this.productRequired,
    required this.deliveryTime,
    required this.quantity,
  });

  String title;
  String customTitle;
  String productRequired;
  int quantity;
  String deliveryTime;
  String Location;
  String customerId;

  factory RFQ.fromJson(Map<String, dynamic> json) {
    return RFQ(
      title: json['title'] ?? '',
      customTitle: json['custom_title'] ?? '',
      deliveryTime: json['deliveryTime'] ?? '',
      productRequired: json['productname'] ?? '',
      quantity: json['quantity'] ?? 0,
      Location: json['Location'] ?? '',
      customerId: json['customer_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "custom_title": customTitle,
      "deliveryTime": deliveryTime,
      "productname": productRequired,
      "quantity": quantity,
      "Location": Location,
      "customer_id": customerId,
    };
  }
}
