import 'package:flutter/material.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (_, i) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading: Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffe0e4e7),
                ),
              ),
              title: Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                width: double.infinity,
                height: 50.0,
                decoration: const BoxDecoration(
                    color: Color(0xffe0e4e7),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
              ),
              subtitle: Container(
                width: double.infinity,
                height: 20.0,
                decoration: const BoxDecoration(
                    color: Color(0xffe0e4e7),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
              ),
            ),
          );
        });
  }
}
