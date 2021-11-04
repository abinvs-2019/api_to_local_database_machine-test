import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:machine_test/modal/api_model/model.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test/modal/local_database_model/database_methods.dart';

// The Api is called only once when is app is loaded for the first time,
// After that the data is called from the Local Databases.
////////////////////////////////////////////////////////////////////////
class APIMANAGER {
  static const base_api =
      "https://debug.qart.fashion/api/product/GetProductsWithSizes?retailerCode=40984";
  Future<ProductMODAL> getData() async {
    var newModel;
    print("API CALLING ");
    var client = http.Client();
    var isCacheKeyEcist =
        await APICacheManager().isAPICacheKeyExist("API_Product");
    if (!isCacheKeyEcist) {
      print("API HIT");
      var resonse = await client.get(Uri.parse('$base_api'));
      if (resonse.statusCode == 200) {
        print("response ok");
        APICacheDBModel model =
            APICacheDBModel(key: "API_Product", syncData: resonse.body);

        await APICacheManager().addCacheData(model);
        print(resonse.body);
        var jsonString = resonse.body;
        var jsonMap = json.decode(jsonString);
        var newModel = ProductMODAL.fromMap(jsonMap);
        return newModel;
      }
    } else {
      print("LOCAL HIT");
      var cacheData = await APICacheManager().getCacheData("API_Product");
      print("local");
      return ProductMODAL.fromMap(jsonDecode(cacheData.syncData));
    }

    return newModel;
  }
}
