import 'package:applaudo/modules/searchlist/presentation/blocs/bloc_search_list/searchlist_bloc.dart';
import 'package:applaudo/modules/searchlist/presentation/widgets/list_products.dart';
import 'package:applaudo/modules/searchlist/presentation/widgets/textfield_search.dart';
import 'package:applaudo/shared/shimmers/list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Color(0xFF121167),
            titleSpacing: 40.0,
            toolbarHeight: 150.0,
            expandedHeight: 150.0,
            floating: true,
            snap: true,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
            ),
            flexibleSpace: Padding(
              padding: EdgeInsets.all(8.0),
              child: FlexibleSpaceBar(
                title: TextFieldSearch(),
                centerTitle: true,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20.0,
            ),
          ),
          BlocConsumer<SearchlistBloc, SearchlistState>(
            listener: (context, state) {
              if (state is ErrorOnRequest) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      context.read<SearchlistBloc>().getErrorMaped(
                            state.errorType,
                          ),
                    ),
                  ),
                );
              }
            },
            listenWhen: (previous, current) => current is ErrorOnRequest,
            buildWhen: (previus, current) =>
                current is SuccessRequest ||
                current is SearchlistInitial ||
                current is LoadingRequest,
            builder: (context, state) {
              if (state is SuccessRequest) {
                return ListProduct(products: state.products);
              }

              if (state is LoadingRequest) {
                return SliverToBoxAdapter(
                  child: Shimmer.fromColors(
                    baseColor: const Color(0xffe0e4e7),
                    highlightColor: Colors.white,
                    child: const ShimmerList(),
                  ),
                );
              }

              return const SliverToBoxAdapter();
            },
          ),
        ],
      ),
    );
  }
}
