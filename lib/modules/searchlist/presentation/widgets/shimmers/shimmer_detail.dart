import 'package:flutter/material.dart';

class DetailShimmer extends StatefulWidget {
  const DetailShimmer({Key? key}) : super(key: key);

  @override
  State<DetailShimmer> createState() => _DetailShimmerState();
}

class _DetailShimmerState extends State<DetailShimmer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: 20.0,
          color: const Color(0xffe0e4e7),
        ),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          child: ListView.builder(
            itemBuilder: (_, int positionIndex) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 100.0,
                color: const Color(0xffe0e4e7),
              );
            },
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        ListView.builder(
          itemBuilder: (_, int positionIndex) {
            return Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: 20.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffe0e4e7),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 10.0,
                  decoration: const BoxDecoration(
                    color: Color(0xffe0e4e7),
                  ),
                ),
              ],
            );
          },
          shrinkWrap: true,
          itemCount: 3,
        ),
      ],
    );
  }
}
