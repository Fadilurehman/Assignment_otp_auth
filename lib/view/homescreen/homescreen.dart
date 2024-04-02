import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment/controller/cached_image_widget.dart';
import 'package:assignment/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homecontroller = Provider.of<HomeController>(context);
    homecontroller.scrollController.addListener(() {
      if (homecontroller.scrollController.position.pixels ==
          homecontroller.scrollController.position.maxScrollExtent) {
        homecontroller.loadMorePosts();
      }
    });
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notification_add_rounded))
        ],
        title: CachedImageWidget(
            url: "assets/images/home app bar.png", height: 50, width: 100),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: const Text(
                  "Didnt able to finish the home page of task within the time limit "),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                height: 500,
                child: Image.asset(
                  'assets/images/homescreen.png', // Change this to your image path
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.blue,
          onTap: (value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }),
    );
  }
}
