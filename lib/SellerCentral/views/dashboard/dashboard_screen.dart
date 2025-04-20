import 'package:flutter/material.dart';
import 'package:pakmart/Model/SellerModel.dart';
import 'package:pakmart/SellerCentral/views/products/product_screen.dart';
import 'package:pakmart/SellerCentral/views/receive_leads/receive_leads_screen.dart';
import 'package:pakmart/SellerCentral/views/user_analytics/user_analytics_screen.dart';
import 'package:pakmart/service/logout_service/logout_service.dart';
import 'package:pakmart/service/session_manager/session_controller.dart';

final List<String> actions = ["Product", "User Analytics", "Received Leads"];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              LogoutService().logoutService(context);
            },
            icon: const Icon(Icons.logout)),
        automaticallyImplyLeading: false,
        title: const Text("Seller Dashboard"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns in the grid
          crossAxisSpacing: 10, // space between columns
          mainAxisSpacing: 10, // space between rows
        ),
        itemCount: actions.length, // Number of boxes
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (actions[index] == "Product") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductSellerScreen(),
                    ));
              } else if (actions[index] == "User Analytics") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserAnalyticsScreen(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReceiveLeadsScreen(),
                  ),
                );
              }
            },
            child: Card(
              elevation: 5,
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  actions[index],
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
