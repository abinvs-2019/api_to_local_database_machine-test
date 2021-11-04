import 'package:flutter/material.dart';
import 'package:machine_test/modal/api_model/model.dart';
import 'package:machine_test/service/api.dart';
import 'package:machine_test/views/search_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<ProductMODAL>? _futureData;
  @override
  void initState() {
    _futureData = APIMANAGER().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Container(
        child: FutureBuilder<ProductMODAL>(
            future: _futureData,
            builder: (context, snapshot) {
              return snapshot.data != null
                  ? Center(
                      child: Container(
                        child: Text(
                          snapshot.data!.productCount.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
