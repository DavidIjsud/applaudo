import 'package:applaudo/modules/searchlist/domain/entities/product_entity.dart';
import 'package:applaudo/modules/searchlist/presentation/detail_product.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  final List<ProductEntity> products;

  const ListProduct({Key? key, required this.products}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailProductPage(
                  idProduct: widget.products[index].id,
                );
              }));
            },
            child: ListTile(
              title: Text(widget.products[index].title),
              subtitle: Text(
                  "${widget.products[index].price} ${widget.products[index].currency}"),
              leading: Image.network(widget.products[index].thumbNail),
            ),
          );
        },
        childCount: widget.products.length,
      ),
    );
  }
}

// (_, int index) {
//           return InkWell(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) {
//                 return DetailProductPage(
//                   idProduct: widget.products[index].id,
//                 );
//               }));
//             },
//             child: ListTile(
//               title: Text(widget.products[index].title),
//               subtitle: Text(
//                   "${widget.products[index].price} ${widget.products[index].currency}"),
//               leading: Image.network(widget.products[index].thumbNail),
//             ),
//           );
//         }