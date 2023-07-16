
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rwu_cafeteria_system/screens/cart/cart.dart';
import 'package:rwu_cafeteria_system/screens/feedback_screen/feedback_screen.dart';
import 'package:rwu_cafeteria_system/screens/foods/foods.dart';
import 'package:rwu_cafeteria_system/screens/home/home.dart';
import 'package:rwu_cafeteria_system/screens/logout_screen.dart';
import 'package:rwu_cafeteria_system/screens/orders.dart';
import 'package:rwu_cafeteria_system/utils/color.dart';

class Drawerr {
  ///Drawer
  static drawerr() {
    return ListView(children: <Widget>[
     UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: primaryColor),
          accountName: Text( ""),
          accountEmail: Text(FirebaseAuth.instance.currentUser!.email.toString()),
          currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Icon(Icons.person),
                  ),
                )
            
        ),
    
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: InkWell(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 0,
            child: ListTile(
              onTap: () {
                Get.back();
              },
              leading: Icon(
                Icons.home,
                color: Colors.orange,
              ),
              title: Text("Home"),
              trailing: Icon(
                Icons.navigate_next,
              ),
            ),
          ),
        ),
      ),
       Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: InkWell(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 0,
            child: ListTile(
              onTap: () {
                Get.to(FoodScreenn());
              },
              leading: Icon(
                Icons.food_bank_sharp,
                color: Colors.orange,
              ),
              title: Text("Food Items"),
              trailing: Icon(
                Icons.navigate_next,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 0,
          child: ListTile(
            onTap: () {
              Get.to(() => Cart());
            },
            leading: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.green,
            ),
            title: Text("My Cart"),
            trailing: Icon(
              Icons.navigate_next,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: InkWell(
          onTap: () {
            Get.to(() => OrdersScreen());
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 0,
            child: ListTile(
              leading: Icon(
                Icons.online_prediction_sharp,
                color: Colors.amber,
              ),
              title: Text("My Orders"),
              trailing: Icon(
                Icons.navigate_next,
              ),
            ),
          ),
        ),
      ),
     Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: InkWell(
          onTap: () {
            Get.to(() => FeedbackPage());
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 0,
            child: ListTile(
              leading: Icon(
                Icons.feedback_sharp,
                color: Color.fromARGB(255, 154, 3, 3),
              ),
              title: Text("Add FeedBAck"),
              trailing: Icon(
                Icons.navigate_next,
              ),
            ),
          ),
        ),
      ),
    
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: GestureDetector(
          onTap: () async {
            Get.to(LogoutAlertBox());
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 0,
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
            ),
          ),
        ),
      ),
    ]);
  }
}
