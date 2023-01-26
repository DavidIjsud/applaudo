import 'package:applaudo/modules/searchlist/domain/entities/product_detail_entity.dart';
import 'package:flutter/material.dart';

class ListRecentlyVisited extends StatefulWidget {
  const ListRecentlyVisited({Key? key, required this.listVisited})
      : super(key: key);

  final List<ProductDetailEntity> listVisited;

  @override
  State<ListRecentlyVisited> createState() => _ListRecentlyVisitedState();
}

class _ListRecentlyVisitedState extends State<ListRecentlyVisited> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Five products recently visited",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: widget.listVisited.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(widget.listVisited[index].title!),
                  subtitle: Text(
                      "${widget.listVisited[index].price} ${widget.listVisited[index].currency}"),
                  leading:
                      Image.network(widget.listVisited[index].listUrlImages[0]),
                );
              }),
        )
      ],
    );
  }
}
