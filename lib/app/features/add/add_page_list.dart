import 'package:flutter/material.dart';
import 'package:my_shopping_list/app/features/home/home_page.dart';

class AddPageList extends StatefulWidget {
  const AddPageList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AddPageList> createState() => _AddPageListState();
}

class _AddPageListState extends State<AddPageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 179, 74, 126),
        title: const Text('Add a need product '),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 15,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Product',
                  label: Text('Product'),
                  prefixIcon: Icon(
                    Icons.fastfood,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Category',
                  label: Text('Category'),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Shop Name',
                  label: Text('Shop Name'),
                  prefixIcon: Icon(
                    Icons.add_location,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'City',
                  label: Text('City'),
                  prefixIcon: Icon(
                    Icons.location_city,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
