import 'dart:convert';

//oldModalClass
List<Product> employeeFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));

String employeeToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductMODAL {
  ProductMODAL({
    this.productCount,
    this.products,
    this.lastUpdatedToken,
  });

  int? productCount;
  List<Product>? products;
  int? lastUpdatedToken;

  factory ProductMODAL.fromMap(Map<String, dynamic> json) => ProductMODAL(
        productCount: json["ProductCount"],
        products:
            List<Product>.from(json["Products"].map((x) => Product.fromMap(x))),
        lastUpdatedToken: json["LastUpdatedToken"],
      );

  Map<String, dynamic> toMap() => {
        "ProductCount": productCount,
        "Products": List<dynamic>.from(products!.map((x) => x.toMap())),
        // "Brands": List<dynamic>.from(brands!.map((x) => x.toJson())),
        "LastUpdatedToken": lastUpdatedToken,
      };
}

enum Name { LEE, WRANGLER }

final nameValues = EnumValues({"Lee": Name.LEE, "Wrangler": Name.WRANGLER});

class Product {
  Product({
    this.season,
    this.brand,
    this.mood,
    this.gender,
    this.theme,
    this.category,
    this.name,
    this.color,
    this.option,
    this.mrp,
    this.subCategory,
    this.collection,
    this.fit,
    this.description,
    this.qrCode,
    this.looks,
    this.looksImageUrl,
    this.looksImage,
    this.fabric,
    this.ean,
    this.finish,
    this.availableSizes,
    this.sizeWiseStock,
    this.offerMonths,
    this.productClass,
    this.promoted,
    this.secondary,
    this.deactivated,
    this.defaultSize,
    this.material,
    this.quality,
    this.qrCode2,
    this.displayName,
    this.displayOrder,
    this.minQuantity,
    this.maxQuantity,
    this.qpsCode,
    this.demandType,
    this.image,
    this.imageUrl,
    this.adShoot,
    this.technology,
    this.imageAlt,
    this.technologyImage,
    this.technologyImageUrl,
    this.isCore,
    this.minimumArticleQuantity,
    this.likeabilty,
    this.brandRank,
  });

  Season? season;
  Name? brand;
  String? mood;
  Gender? gender;
  String? theme;
  Category? category;
  String? name;
  String? color;
  String? option;
  num? mrp;
  Category? subCategory;
  Collection? collection;
  Fit? fit;
  String? description;
  String? qrCode;
  String? looks;
  String? looksImageUrl;
  dynamic? looksImage;
  String? fabric;
  Ean? ean;
  String? finish;
  List<String>? availableSizes;
  dynamic? sizeWiseStock;
  List<OfferMonth>? offerMonths;
  num? productClass;
  bool? promoted;
  bool? secondary;
  bool? deactivated;
  dynamic? defaultSize;
  String? material;
  String? quality;
  String? qrCode2;
  String? displayName;
  num? displayOrder;
  num? minQuantity;
  num? maxQuantity;
  String? qpsCode;
  dynamic? demandType;
  String? image;
  String? imageUrl;
  bool? adShoot;
  Technology? technology;
  String? imageAlt;
  dynamic? technologyImage;
  String? technologyImageUrl;
  bool? isCore;
  num? minimumArticleQuantity;
  num? likeabilty;
  String? brandRank;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        season: seasonValues.map[json["Season"]],
        brand: nameValues.map[json["Brand"]],
        mood: json["Mood"],
        gender: genderValues.map[json["Gender"]],
        theme: json["Theme"],
        category: categoryValues.map[json["Category"]],
        name: json["Name"],
        color: json["Color"],
        option: json["Option"],
        mrp: json["MRP"],
        subCategory: categoryValues.map[json["SubCategory"]],
        collection: collectionValues.map[json["Collection"]],
        fit: fitValues.map[json["Fit"]],
        description: json["Description"],
        qrCode: json["QRCode"],
        looks: json["Looks"],
        looksImageUrl:
            json["LooksImageUrl"] == null ? null : json["LooksImageUrl"],
        looksImage: json["LooksImage"],
        fabric: json["Fabric"],
        ean: Ean.fromJson(json["EAN"]),
        finish: json["Finish"],
        availableSizes: List<String>.from(json["AvailableSizes"].map((x) => x)),
        sizeWiseStock: json["SizeWiseStock"],
        offerMonths: List<OfferMonth>.from(
            json["OfferMonths"].map((x) => offerMonthValues.map[x])),
        productClass: json["ProductClass"],
        promoted: json["Promoted"],
        secondary: json["Secondary"],
        deactivated: json["Deactivated"],
        defaultSize: json["DefaultSize"],
        material: json["Material"],
        quality: json["Quality"],
        qrCode2: json["QRCode2"],
        displayName: json["DisplayName"],
        displayOrder: json["DisplayOrder"],
        minQuantity: json["MinQuantity"],
        maxQuantity: json["MaxQuantity"],
        qpsCode: json["QPSCode"],
        demandType: json["DemandType"],
        image: json["Image"],
        imageUrl: json["ImageUrl"],
        adShoot: json["AdShoot"],
        technology: technologyValues.map[json["Technology"]],
        imageAlt: json["ImageAlt"],
        technologyImage: json["TechnologyImage"],
        technologyImageUrl:
            json["TechnologyImageUrl"] ?? json["TechnologyImageUrl"],
        isCore: json["IsCore"],
        minimumArticleQuantity: json["MinimumArticleQuantity"],
        likeabilty: json["Likeabilty"],
        brandRank: json["BrandRank"],
      );

  Map<String, dynamic> toMap() => {
        "Season": seasonValues.reverse![season],
        "Brand": nameValues.reverse![brand],
        "Mood": mood,
        "Gender": genderValues.reverse![gender],
        "Theme": theme,
        "Category": categoryValues.reverse![category],
        "Name": name,
        "Color": color,
        "Option": option,
        "MRP": mrp,
        "SubCategory": categoryValues.reverse![subCategory],
        "Collection": collectionValues.reverse![collection],
        "Fit": fitValues.reverse![fit],
        "Description": description,
        "QRCode": qrCode,
        "Looks": looks,
        "LooksImageUrl": looksImageUrl == null ? null : looksImageUrl,
        "LooksImage": looksImage,
        "Fabric": fabric,
        "EAN": ean!.toJson(),
        "Finish": finish,
        "AvailableSizes": List<dynamic>.from(availableSizes!.map((x) => x)),
        "SizeWiseStock": sizeWiseStock,
        "OfferMonths": List<dynamic>.from(
            offerMonths!.map((x) => offerMonthValues.reverse![x])),
        "ProductClass": productClass,
        "Promoted": promoted,
        "Secondary": secondary,
        "Deactivated": deactivated,
        "DefaultSize": defaultSize,
        "Material": material,
        "Quality": quality,
        "QRCode2": qrCode2,
        "DisplayName": displayName,
        "DisplayOrder": displayOrder,
        "MinQuantity": minQuantity,
        "MaxQuantity": maxQuantity,
        "QPSCode": qpsCode,
        "DemandType": demandType,
        "Image": image,
        "ImageUrl": imageUrl,
        "AdShoot": adShoot,
        "Technology": technologyValues.reverse![technology],
        "ImageAlt": imageAlt,
        "TechnologyImage": technologyImage,
        "TechnologyImageUrl":
            technologyImageUrl == null ? null : technologyImageUrl,
        "IsCore": isCore,
        "MinimumArticleQuantity": minimumArticleQuantity,
        "Likeabilty": likeabilty,
        "BrandRank": brandRank,
      };
}

enum Category {
  MENS_JEANS,
  MENS_SHIRTS,
  MENS_SHORTS,
  MENS_TROUSER,
  MENS_T_SHIRT,
  MENS_NON_DENIM,
  MENS_T_SHIRTS,
  MENS_POLO,
  MENS_CREW_NECK,
  MENS_HENLEY
}

final categoryValues = EnumValues({
  "Mens-Crew Neck": Category.MENS_CREW_NECK,
  "Mens-Henley": Category.MENS_HENLEY,
  "Mens-Jeans": Category.MENS_JEANS,
  "Mens-Non Denim": Category.MENS_NON_DENIM,
  "Mens-Polo": Category.MENS_POLO,
  "Mens-Shirts": Category.MENS_SHIRTS,
  "Mens-Shorts": Category.MENS_SHORTS,
  "Mens-Trouser": Category.MENS_TROUSER,
  "Mens-T-Shirt": Category.MENS_T_SHIRT,
  "Mens-T Shirts": Category.MENS_T_SHIRTS
});

enum Collection {
  LEE_JOY_FACTORY,
  THE_101,
  BLACK_LABEL,
  EXTREME_MOTION,
  URBAN_FANTASY,
  SMILEY,
  SMILEY_X_LEE,
  URBAN_TRAIL,
  EARTH_SEED,
  REACH_THE_SKY,
  OUR_HAPPY_PLACE,
  RACE_READY,
  THE_75_TH_ANNIVERSARY
}

final collectionValues = EnumValues({
  "Black Label": Collection.BLACK_LABEL,
  "Earth & Seed": Collection.EARTH_SEED,
  "Extreme Motion": Collection.EXTREME_MOTION,
  "Lee Joy Factory": Collection.LEE_JOY_FACTORY,
  "Our Happy Place": Collection.OUR_HAPPY_PLACE,
  "Race Ready": Collection.RACE_READY,
  "Reach The Sky": Collection.REACH_THE_SKY,
  "Smiley": Collection.SMILEY,
  "Smiley X Lee": Collection.SMILEY_X_LEE,
  "101+": Collection.THE_101,
  "75Th Anniversary": Collection.THE_75_TH_ANNIVERSARY,
  "Urban Fantasy": Collection.URBAN_FANTASY,
  "Urban Trail": Collection.URBAN_TRAIL
});

class Ean {
  Ean({
    this.the28,
    this.the30,
    this.the32,
    this.the34,
    this.the36,
    this.the38,
    this.the40,
    this.the42,
    this.len,
    this.the2Xl,
    this.l,
    this.m,
    this.s,
    this.xl,
    this.xxl,
  });

  String? the28;
  String? the30;
  String? the32;
  String? the34;
  String? the36;
  String? the38;
  String? the40;
  String? the42;
  String? len;
  String? the2Xl;
  String? l;
  String? m;
  String? s;
  String? xl;
  String? xxl;

  factory Ean.fromJson(Map<String, dynamic> json) => Ean(
        the28: json["28"] == null ? null : json["28"],
        the30: json["30"] == null ? null : json["30"],
        the32: json["32"] == null ? null : json["32"],
        the34: json["34"] == null ? null : json["34"],
        the36: json["36"] == null ? null : json["36"],
        the38: json["38"] == null ? null : json["38"],
        the40: json["40"] == null ? null : json["40"],
        the42: json["42"] == null ? null : json["42"],
        len: json["LEN"] == null ? null : json["LEN"],
        the2Xl: json["2XL"] == null ? null : json["2XL"],
        l: json["L"] == null ? null : json["L"],
        m: json["M"] == null ? null : json["M"],
        s: json["S"] == null ? null : json["S"],
        xl: json["XL"] == null ? null : json["XL"],
        xxl: json["XXL"] == null ? null : json["XXL"],
      );

  Map<String, dynamic> toJson() => {
        "28": the28 == null ? null : the28,
        "30": the30 == null ? null : the30,
        "32": the32 == null ? null : the32,
        "34": the34 == null ? null : the34,
        "36": the36 == null ? null : the36,
        "38": the38 == null ? null : the38,
        "40": the40 == null ? null : the40,
        "42": the42 == null ? null : the42,
        "LEN": len == null ? null : len,
        "2XL": the2Xl == null ? null : the2Xl,
        "L": l == null ? null : l,
        "M": m == null ? null : m,
        "S": s == null ? null : s,
        "XL": xl == null ? null : xl,
        "XXL": xxl == null ? null : xxl,
      };
}

enum Fit {
  BRUCE,
  ANTON,
  TRAVIS,
  RODEO,
  ERIC,
  ARVIN,
  MICK,
  SLIM,
  COMFORT,
  SHORTS,
  SKANDERS,
  BOSTIN,
  MILLARD,
  VEGAS,
  REDDING,
  LOOSE_CARPENTER,
  JOGGER,
  REGULAR,
  RESORT,
  OVERSHIRT,
  JOGGERS,
  VINTAGE
}

final fitValues = EnumValues({
  "Anton": Fit.ANTON,
  "Arvin": Fit.ARVIN,
  "Bostin": Fit.BOSTIN,
  "Bruce": Fit.BRUCE,
  "Comfort": Fit.COMFORT,
  "Eric": Fit.ERIC,
  "Jogger": Fit.JOGGER,
  "Joggers": Fit.JOGGERS,
  "Loose Carpenter": Fit.LOOSE_CARPENTER,
  "Mick": Fit.MICK,
  "Millard": Fit.MILLARD,
  "Overshirt": Fit.OVERSHIRT,
  "Redding": Fit.REDDING,
  "Regular": Fit.REGULAR,
  "Resort": Fit.RESORT,
  "Rodeo": Fit.RODEO,
  "Shorts": Fit.SHORTS,
  "Skanders": Fit.SKANDERS,
  "Slim": Fit.SLIM,
  "Travis": Fit.TRAVIS,
  "Vegas": Fit.VEGAS,
  "Vintage": Fit.VINTAGE
});

enum Gender { MENS }

final genderValues = EnumValues({"Mens": Gender.MENS});

enum OfferMonth { JAN, FEB, APR, MAR, MARCH, APRIL }

final offerMonthValues = EnumValues({
  "Apr": OfferMonth.APR,
  "April": OfferMonth.APRIL,
  "Feb": OfferMonth.FEB,
  "Jan": OfferMonth.JAN,
  "Mar": OfferMonth.MAR,
  "March": OfferMonth.MARCH
});

enum Season { SS22 }

final seasonValues = EnumValues({"SS22": Season.SS22});

enum Technology {
  EMPTY,
  EXTREME_MOTION,
  FLO,
  SMILEY,
  TRAVELER,
  WE_CARE,
  TRAVELERLITE,
  THE_75_TH_ANNIVERSARY
}

final technologyValues = EnumValues({
  "": Technology.EMPTY,
  "Extreme Motion": Technology.EXTREME_MOTION,
  "FLO": Technology.FLO,
  "Smiley": Technology.SMILEY,
  "75th Anniversary": Technology.THE_75_TH_ANNIVERSARY,
  "TRAVELER": Technology.TRAVELER,
  "TRAVELERLITE": Technology.TRAVELERLITE,
  "WE CARE": Technology.WE_CARE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(
    this.map,
  );

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
// To parse this JSON data, do

//     final producModal = producModal.FromMap(jsonString);