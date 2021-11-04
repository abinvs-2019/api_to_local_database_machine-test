import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({
    this.Name,
    this.subcatrgory,
    this.gender,
    this.fir,
    this.finidh,
    this.theme,
    this.mood,
    this.offMonth,
    Key? key,
    this.technologyImageUrl,
    this.imgURl,
    this.option,
    this.likeability,
    this.qrCode,
    this.mrp,
    this.brand,
    this.category,
    this.collection,
  }) : super(key: key);
  final String? technologyImageUrl,
      imgURl,
      option,
      qrCode,
      mrp,
      brand,
      category,
      gender,
      Name,
      subcatrgory,
      fir,
      theme,
      finidh,
      offMonth,
      mood,
      collection;
  num? likeability;

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            productContainer(),
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    detailsContianer(
                        context,
                        widget.brand!.toString().split('.').last,
                        widget.category!.toString().split('.').last,
                        widget.collection!.toString().split('.').last),
                    detailsContianer(
                        context,
                        widget.gender!.toString().split('.').last,
                        widget.Name!.toString().split('.').last,
                        widget.subcatrgory!.toString().split('.').last),
                    detailsContianer(
                        context,
                        widget.fir!.toString().split('.').last,
                        widget.theme!.toString().split('.').last,
                        widget.finidh!.toString().split('.').last),
                    detailsContianer(context,
                        widget.offMonth!.toString().split('.').last, "", ""),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container detailsContianer(BuildContext context, String text, text2, text3) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Text("$text - "),
          Text("$text2 - "),
          Text("$text3 - "),
        ],
      ),
      margin: EdgeInsets.all(5),
      height: 50,
      width: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: Colors.white,
          border: Border.all(width: 1)),
    );
  }

  Expanded productContainer() {
    return Expanded(
      flex: 1,
      child: Container(
        child: GridView.builder(
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, snapshot) {
              return Container(
                height: 100,
                width: 100,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              height: 160,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://cf.shopee.ph/file/6907c52b5698df501bf2fd83e803d6d2')))),
                          FractionalTranslation(
                            translation: const Offset(0, -0.5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  )),
                              width: 160,
                              height: 50,
                              child: Column(
                                children: [
                                  Text(
                                    widget.option!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.qrCode!,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    widget.mrp!,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    starRating()
                  ],
                ),
              );
            }),
      ),
    );
  }

  Container starRating() {
    return Container(
      alignment: Alignment.center,
      height: 20,
      width: 300,
      child: RatingBar.builder(
        itemSize: 20,
        initialRating: widget.likeability!.toDouble(),
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}
