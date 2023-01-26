import 'package:applaudo/modules/searchlist/data/data_sources/data_source_search_list_impl.dart';
import 'package:applaudo/modules/searchlist/data/repository/repository_search_list_impl.dart';
import 'package:applaudo/modules/searchlist/domain/usecases/search_list_case_impl.dart';
import 'package:applaudo/modules/searchlist/domain/usecases/visited_products_impl.dart';
import 'package:applaudo/modules/searchlist/presentation/blocs/bloc_detail_product/detail_product_bloc.dart';
import 'package:applaudo/modules/searchlist/presentation/blocs/bloc_search_list/searchlist_bloc.dart';
import 'package:applaudo/modules/searchlist/presentation/search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthFlow extends StatelessWidget {
  const AuthFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchListCaseImpl searchListCaseImpl = SearchListCaseImpl(
        repository:
            RepositorySearchListImpl(dataSource: SearchSourceListImpl()));

    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => DetailProductBloc(
                  searchListCase: searchListCaseImpl,
                  visitedProductsCase: VisitedProductsImpl())),
          BlocProvider(
              create: (_) =>
                  SearchlistBloc(searchListCase: searchListCaseImpl)),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ListProducts(),
        ));
  }
}
