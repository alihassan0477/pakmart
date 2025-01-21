class RFQ {
  RFQ(
      {required this.title,
      required this.Location,
      required this.customTitle,
      required this.customerId,
      required this.productRequired,
      required this.deliveryTime,
      required this.quantity});

  String title;
  String customTitle;
  String productRequired;
  int quantity;
  String deliveryTime;
  String Location;
  String customerId;

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "custom_title": customTitle,
      "deliveryTime": deliveryTime,
      "productname": productRequired,
      "quantity": quantity,
      "Location": Location,
      "customer_id": customerId
    };
  }
}
