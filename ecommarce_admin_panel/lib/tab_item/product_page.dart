import 'package:ecommarce_admin_panel/http/custom_http_request.dart';
import 'package:ecommarce_admin_panel/provider/product_provider.dart';
import 'package:ecommarce_admin_panel/screen/add_product.dart';
import 'package:ecommarce_admin_panel/screen/edit_products.dart';
import 'package:ecommarce_admin_panel/widget/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    // TODO: implement initState

    // getAllOrders();
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    print("skfjghkjfhgkjfhjkg");

    return Scaffold(
      body: Center(
        child: ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            strokeWidth: 5,
          ),
          inAsyncCall: onProgress == true,
          child: Container(
              width: double.infinity,
              child: product.productList.isNotEmpty
                  ? NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        setState(() {
                          if (notification.direction ==
                              ScrollDirection.forward) {
                            _buttonVisiable = true;
                          } else if (notification.direction ==
                              ScrollDirection.reverse) {
                            _buttonVisiable = false;
                          }
                        });
                        return true;
                      },
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 250,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: product.productList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              alignment: Alignment.center,
                              height: 250,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://apihomechef.antopolis.xyz/images/${product.productList[index].image ?? ""}"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${product.productList[index].name ?? ""}',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                width: 0.1),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(5)),
                                          ),
                                          child: TextButton(
                                            child: Icon(
                                              Icons.edit,
                                              size: 15,
                                              color: aTextColor,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditProduct(
                                                            productModel: product
                                                                    .productList[
                                                                index],
                                                          )));
                                            },
                                          ),
                                        )),
                                        Container(
                                          height: 30,
                                          width: 0.5,
                                          color: Colors.grey,
                                        ),
                                        Expanded(
                                            child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                width: 0.1),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(5)),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Are you sure ?'),
                                                      titleTextStyle: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: aTextColor),
                                                      titlePadding:
                                                          EdgeInsets.only(
                                                              left: 35,
                                                              top: 25),
                                                      content: Text(
                                                          'Once you delete, the item will gone permanently.'),
                                                      contentTextStyle:
                                                          TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  aTextColor),
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 35,
                                                              top: 10,
                                                              right: 40),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        15,
                                                                    vertical:
                                                                        10),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                                border: Border.all(
                                                                    color:
                                                                        aTextColor,
                                                                    width:
                                                                        0.2)),
                                                            child: Text(
                                                              'CANCEL',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      aTextColor),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        15,
                                                                    vertical:
                                                                        10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .redAccent
                                                                  .withOpacity(
                                                                      0.2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                            ),
                                                            child: Text(
                                                              'Delete',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      aPriceTextColor),
                                                            ),
                                                          ),
                                                          onPressed: () async {
                                                            setState(() {
                                                              onProgress = true;
                                                            });
                                                            await CustomHttpRequest
                                                                .deleteProduct(product
                                                                    .productList[
                                                                        index]
                                                                    .id!
                                                                    .toInt());

                                                            setState(() {
                                                              onProgress =
                                                                  false;
                                                              product
                                                                  .productList
                                                                  .removeAt(
                                                                      index);
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                            /*    CustomHttpRequest.deleteCategoryItem(
                                                      context,
                                                      categories
                                                          .categoriesList[
                                                      index]
                                                          .id)
                                                      .then((value) =>
                                                  value);
                                                  setState(() {
                                                    categories
                                                        .categoriesList
                                                        .removeAt(
                                                        index);
                                                  });
                                                  Navigator.pop(
                                                      context);*/
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              size: 15,
                                              color: Colors.red,
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                            ;
                          }),
                    )
                  : CircularProgressIndicator()),
        ),
      ),
      floatingActionButton: _buttonVisiable
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddProduct()))
                    .then((value) =>
                        Provider.of<ProductProvider>(context, listen: false));
              },
              backgroundColor: aBlackCardColor,
              child: Icon(
                Icons.add,
                size: 30,
                color: aPrimaryColor,
              ),
            )
          : null,
    );
  }

  bool onProgress = false;

  bool _buttonVisiable = true;
  ScrollController? _scrollController;
}
