import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/utils/cache_db_helper.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/modal/api_model/model.dart';
import 'package:machine_test/service/api.dart';
import 'package:machine_test/views/product_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  bool isSerching = false;
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
          automaticallyImplyLeading: false,
          title: appBarTextField(),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: FutureBuilder<ProductMODAL>(
              future: _futureData,
              builder: (context, snapshot) {
                return snapshot.data != null
                    ? ListView.builder(
                        itemCount: snapshot.data!.products!.length,
                        itemBuilder: (context, index) {
                          var productData = snapshot.data!.products![index];

                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    productData.qrCode!,
                                  ),
                                  Icon(Icons.arrow_upward)
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailsPage(
                                                  theme: productData.theme
                                                      .toString(),
                                                  subcatrgory: productData
                                                      .subCategory
                                                      .toString(),
                                                  offMonth: productData
                                                      .offerMonths
                                                      .toString(),
                                                  mood: productData.gender
                                                      .toString(),
                                                  gender: productData.gender
                                                      .toString(),
                                                  fir: productData.fit!
                                                      .toString(),
                                                  finidh: productData.finish!,
                                                  Name: productData.name!,
                                                  technologyImageUrl:
                                                      productData
                                                          .technologyImageUrl,
                                                  imgURl: productData.imageUrl,
                                                  brand: productData.brand
                                                      .toString(),
                                                  category: productData.category
                                                      .toString(),
                                                  collection: productData
                                                      .collection
                                                      .toString(),
                                                  likeability:
                                                      productData.likeabilty,
                                                  mrp: productData.mrp
                                                      .toString(),
                                                  option: productData.option,
                                                  qrCode: productData.qrCode)));
                                },
                                child: Card(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.network(
                                            "${productData.imageUrl!}",
                                            width: 100,
                                            height: 100,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(productData.option!
                                                  .toString()),
                                              Text(productData.mrp!.toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            const Text("28,30,32"),
                                            const Text("34,36,38"),
                                            const Text("40,42"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        })
                    : Container();
              }),
        ));
  }

  Container appBarTextField() {
    return Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextFormField(
            onChanged: ((value) {
              // nitiateSearch(
              //   "API_Product",
              //   _searchController.toString(),
              // );
            }),
            controller: _searchController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ));
  }

  // queryData(String table, searchString) async {
  //   Future<List<Map<String, dynamic>>> queryList =
  //       APICacheDBHelper.conditionalQuery(table, searchString);
  // }
}
