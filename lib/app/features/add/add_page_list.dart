import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPageList extends StatefulWidget {
  const AddPageList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AddPageList> createState() => _AddPageListState();
}

List<String> categorys =
    FirebaseFirestore.instance.collection('users').orderBy('shoppingList') as List<String>;
String? selectedCategorys = 'category1';

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
            children: [
              const TextField(
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
              const SizedBox(
                height: 15,
              ),
              const TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'np.Biedronka',
                  label: Text('Shop Name'),
                  prefixIcon: Icon(
                    Icons.add_location,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text('Someting went wrong'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: Text('Loading'));
                    }
                    final documents = snapshot.data!.docs;
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 260,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            isCollapsed: true,
                            enabledBorder: InputBorder.none,
                          ),
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 18,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 97, 96, 96),
                          ),
                          iconSize: 32,
                          iconEnabledColor:
                              const Color.fromARGB(255, 179, 74, 126),
                          value: selectedCategorys,
                          items: categorys
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 85,
                                    ),
                                    child: Center(
                                      child: Text(
                                        category,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (category) => setState(
                            () => selectedCategorys = category,
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 85,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 179, 74, 126),
                  onPrimary: Colors.white,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
