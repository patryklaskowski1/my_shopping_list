import 'package:flutter/material.dart';
import 'package:my_shopping_list/app/features/add/add_page_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 179, 74, 126),
        title: Text(widget.title),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 15,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 179, 74, 126),
          onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddPageList(title: widget.title),
                ),
              ),
          child: const Icon(
            Icons.add,
            color: Colors.black,
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
                builder: (context) => HomePage(
                  title: widget.title,
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
            onPressed: () {},
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
