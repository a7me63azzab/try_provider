import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loginprovider/src/pages/HomePage/model.dart';

class AllProductsWidget extends StatelessWidget {
  final Product product;
  final Function removeFav;
  const AllProductsWidget({Key key, this.product, this.removeFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 150,
          width: 130,
          child: Stack(
            children: <Widget>[
              Container(
                height: 150,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                    image: NetworkImage(product.image == null
                        ? "https://cdn.pixabay.com/photo/2016/01/19/17/19/young-woman-1149643_1280.jpg"
                        : "https://five-starsupplies.com/users/images/${product.image.image}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    removeFav(product.id);
                  },
                  child: product.favorited == 0
                      ? Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: product.offer == 1
                    ? Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: 15,
                      )
                    : Container(),
              ),
              product.discountprice == null || product.discountprice == 0
                  ? Container()
                  : Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 80,
                        height: 30,
                        margin:  EdgeInsets.fromLTRB(8, 8, 0, 17),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:  BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                        ),
                        child: Center(
                          child: product.discountprice == null
                              ? Container()
                              : Text(
                                  "${(((product.price - product.discountprice) / product.price) * 100).floor()} % }",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.bottomRight,
                child: RatingBarIndicator(
                  rating: double.parse(product.rate.toString()),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                  direction: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 80,
          child: Center(
            child: AutoSizeText(
              product.title ?? "اسم المنتج",
              maxLines: 2,
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
          ),
        ),
        Center(
          child: product.discountprice == null || product.discountprice == 0
              ? Text(
                  "${product.price} ريال",
                  style: TextStyle(color: Colors.red, fontSize: 13),
                )
              : Row(
                  children: <Widget>[
                    Text(
                      "${product.price} ريال",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 13,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "${product.discountprice} ريال",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}