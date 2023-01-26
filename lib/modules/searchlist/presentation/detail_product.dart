import 'package:applaudo/modules/searchlist/presentation/blocs/bloc_detail_product/detail_product_bloc.dart';
import 'package:applaudo/modules/searchlist/presentation/widgets/list_images_in_detail.dart';
import 'package:applaudo/modules/searchlist/presentation/widgets/list_visited.dart';
import 'package:applaudo/modules/searchlist/presentation/widgets/shimmers/shimmer_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DetailProductPage extends StatefulWidget {
  final String idProduct;

  const DetailProductPage({Key? key, required this.idProduct})
      : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context
        .read<DetailProductBloc>()
        .add(OnSearchDetailProduct(idProduct: widget.idProduct));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Product'),
        backgroundColor: const Color(0xFF121167),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocConsumer<DetailProductBloc, DetailProductState>(
                buildWhen: (previous, current) =>
                    current is DetailProductInitial ||
                    current is DetailProductLoading ||
                    current is DetailProductLoaded,
                builder: (_, state) {
                  if (state is DetailProductLoaded &&
                      state.productDetailEntity != null) {
                    context
                        .read<DetailProductBloc>()
                        .add(const OnOnbtaingVisitedProduct());
                    context.read<DetailProductBloc>().add(OnSaveVisitedProduct(
                        productDetailEntity: state.productDetailEntity!));
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            state.productDetailEntity!.title!,
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(state.productDetailEntity!.price.toString()),
                              const SizedBox(
                                width: 3.0,
                              ),
                              Text(state.productDetailEntity!.currency!),
                            ],
                          ),
                          ListImagesDetail(
                              listImages:
                                  state.productDetailEntity!.listUrlImages),
                          BlocBuilder<DetailProductBloc, DetailProductState>(
                              builder: (_, state) {
                            if (state is VisitedListLoaded) {
                              return ListRecentlyVisited(
                                  listVisited: state.listVisited);
                            }
                            return Container();
                          }),
                        ],
                      ),
                    );
                  }
                  return Shimmer.fromColors(
                    baseColor: const Color(0xffe0e4e7),
                    highlightColor: Colors.white,
                    child: const DetailShimmer(),
                  );
                },
                listenWhen: (previous, current) =>
                    current is DetailProductError || current is NoInternetState,
                listener: (_, state) {
                  if (state is DetailProductError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }

                  if (state is NoInternetState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No internet connection"),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
