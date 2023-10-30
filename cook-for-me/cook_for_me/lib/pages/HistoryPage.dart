import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  // Dummy data for past orders (you can replace this with your own data)
  final List<Order> pastOrders = [
    Order(id: 1, date: 'October 1, 2023', items: ['Item 1', 'Item 2']),
    Order(id: 2, date: 'September 25, 2023', items: ['Item 3', 'Item 4']),
    Order(id: 3, date: 'September 15, 2023', items: ['Item 5', 'Item 6']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: pastOrders.length,
        itemBuilder: (context, index) {
          final order = pastOrders[index];
          return ListTile(
            title: Text('Order #${order.id}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${order.date}'),
                Text('Items: ${order.items.join(", ")}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Order {
  final int id;
  final String date;
  final List<String> items;

  Order({
    required this.id,
    required this.date,
    required this.items,
  });
}
