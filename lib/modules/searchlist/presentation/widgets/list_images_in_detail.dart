import 'package:flutter/material.dart';

class ListImagesDetail extends StatefulWidget {
  final List<String> listImages;

  const ListImagesDetail({Key? key, required this.listImages})
      : super(key: key);

  @override
  State<ListImagesDetail> createState() => _ListImagesDetailState();
}

class _ListImagesDetailState extends State<ListImagesDetail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listImages.length,
          itemBuilder: (_, index) {
            return Image.network(widget.listImages[index]);
          }),
    );
  }
}
