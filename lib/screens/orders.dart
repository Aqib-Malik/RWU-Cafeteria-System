import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rwu_cafeteria_system/screens/feedback_screen/feedback_screen.dart';
import 'package:rwu_cafeteria_system/utils/color.dart';
import 'package:url_launcher/url_launcher.dart';
class OrdersScreen extends StatelessWidget {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Orders'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.collection('orders').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading"));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          // You can also add a border using the 'borderSide' property
        ),
        tileColor: Colors.grey[200], // Customize the background color
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['name'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              data['email'],
              style: TextStyle(
                fontSize: 12,
                color: Colors.blue,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Functionality to open dialer with the phone number
                launch("tel:${data['phone']}");
              },
              child: Text(
                data['phone'],
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Text(
              "Total: " + data['totalPrice'].toString() + " /Rs",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        subtitle: Column(
          children: [
            Column(
              children: data['item'].map<Widget>((item) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item['imgUrl'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    item['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Price: ${item['price']}',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                );
              }).toList(),
            ),
             ElevatedButton(
        onPressed: () {
         Get.to(FeedbackPage());
        },
        child: Text('Give Feedback',style: TextStyle(color: Colors.white),),
      ),
          ],
        ),
      ),
      SizedBox(height: 8),
     ],
  ),
);



            }).toList(),
          );
        },
      ),
    );
  }
}