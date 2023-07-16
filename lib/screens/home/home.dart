// import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rwu_cafeteria_system/screens/cart/cart.dart';
import 'package:rwu_cafeteria_system/screens/contact_us/contact_us.dart';
import 'package:rwu_cafeteria_system/screens/drawerr.dart';
import 'package:rwu_cafeteria_system/screens/foods/foods.dart';
import 'package:rwu_cafeteria_system/screens/orders.dart';
import 'package:rwu_cafeteria_system/utils/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List slides = [
    "https://upload.wikimedia.org/wikipedia/en/0/05/Rawalpindi_Women_University_crest.png",
    "https://rwu.edu.pk/wp-content/uploads/2023/06/Image-002.jpg",
    "https://oakandrowan.com/wp-content/uploads/2022/11/Pakistani-Food.jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsq90batypdKRTIGWWrPq0gpk2AR5FrSrI3g&usqp=CAU",
    "https://cdn.tasteatlas.com//Images/Dishes/e668e32ae1a3423c95fbd4d77f8c940c.jpg?w=375&h=280",
    //   "https://wilsontoursafrica.com/wp-content/uploads/2021/12/Downloader.la-61a7b15fd2bf6.jpg",
    //   "https://wilsontoursafrica.com/wp-content/uploads/2021/11/Downloader.la-6197821630b0a.jpg",
    // "https://wilsontoursafrica.com/wp-content/uploads/2021/11/Downloader.la-619786e4bbb3f.jpg",
    // "https://wilsontoursafrica.com/wp-content/uploads/2021/11/Downloader.la-619e0d6d3a6f1.jpg",
    // "https://wilsontoursafrica.com/wp-content/uploads/2021/12/Downloader.la-61a7b27f71698.jpg",
    // "https://wilsontoursafrica.com/wp-content/uploads/2021/11/Downloader.la-619786e4bbb3f.jpg",
  ];
  CarouselController carouselController = new CarouselController();
  int carouselIndex = 0;
   final FirebaseFirestore firestore = FirebaseFirestore.instance;
    late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/uni.jpeg'), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
            backgroundColor: primaryColor,
            title: Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0,
          ),
        ),
       drawer: Drawer(child: Drawerr.drawerr()),
        // backgroundColor: kPrimaryLightColor,
        // appBar: CommonWdget.appbar("Home"),
        body: SafeArea(
            child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                   Container(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/logo.gif',
                              height: 48,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'RWU Cafeteria System',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 29, 28, 28),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'WelCome',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 29, 28, 28),
                          ),
                        ),
                      ],
                    ),
                  ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CarouselSlider.builder(
                          carouselController: carouselController,
                          itemCount: slides.length,
                          itemBuilder: (BuildContext context, int index,
                              int pageViewIndex) {
                            return Container(
                              // height: kIsWeb ? Get.height / 1.5 : Get.height / 3,
                              // width: kIsWeb ? Get.width / 2 : Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          slides.elementAt(index).toString()))),
                            );
                          },
                          options: CarouselOptions(
                              height:
                                  // kIsWeb ? 420 :
                                  200,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 2),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1700),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, carouselReason) {
                                setState(() {
                                  carouselIndex = index;
                                });
                              })),
                    ),
                    CarouselIndicator(
                      color: Colors.grey,
                      activeColor: Colors.black,
                      width: Get.width * 0.05,
                      height: 2,
                      count: slides.length,
                      index: carouselIndex,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                           // Menu section
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          buildMenuItem(context, 'Food Items', Icons.food_bank_sharp, () {
                            Get.to(FoodScreenn());
                        
                          }),
                          SizedBox(height: 16),
                          buildMenuItem(context, 'My Cart', Icons.shopping_cart_sharp, () {
                          Get.to(() => Cart());
                          
                          }),
                          SizedBox(height: 16),
                          buildMenuItem(context, 'Contact us', Icons.contact_mail, () {
                            Get.to(ContactForm());
                          }),
                          SizedBox(height: 16),
                          buildMenuItem(context, 'My Orders', Icons.shopping_cart, () {
                            Get.to(OrdersScreen());
                          }),
                        ],
                      ),
                    ),
                  ),
                          
                         
                        ],
                      ),
                    ),
                
                                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }









  
  Widget buildMenuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: primaryColor,
              size: 28,
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

}
