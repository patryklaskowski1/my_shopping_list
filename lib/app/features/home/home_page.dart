import 'package:flutter/material.dart';
import 'package:my_shopping_list/app/auth/pages/user_page.dart';
import 'package:my_shopping_list/app/features/add/add_page_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required title,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 179, 74, 126),
        title: const Text('My shoping list'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 15,
      ),
      body: StreamBuilder<Object>(
          stream:
              FirebaseFirestore.instance.collection("ShopingList").snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 179, 74, 126),
          onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddPageList(
                    title: 'My shoping list',
                  ),
                ),
              ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 179, 74, 126),
        shape: const CircularNotchedRectangle(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            tooltip: 'My shopping list',
            splashColor: Colors.pink,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(
                  title: 'My shoping list',
                ),
              ),
            ),
            icon: const Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            tooltip: 'Sale',
            splashColor: Colors.pink,
            icon: const Icon(
              Icons.production_quantity_limits,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () {},
            tooltip: 'Add Sale',
            splashColor: Colors.pink,
            icon: const Icon(
              Icons.add_shopping_cart,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const UserProfile(),
              ),
            ),
            tooltip: 'Account',
            splashColor: Colors.pink,
            icon: const Icon(
              Icons.manage_accounts,
              size: 30,
            ),
          ),
        ]),
      ),
    );
  }
}
