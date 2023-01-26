import 'package:applaudo/modules/searchlist/presentation/blocs/bloc_search_list/searchlist_bloc.dart';
import 'package:debounce_builder/debounce_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldSearch extends StatefulWidget {
  const TextFieldSearch({Key? key}) : super(key: key);

  @override
  State<TextFieldSearch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  @override
  Widget build(BuildContext context) {
    return DebounceBuilder(
      delay: const Duration(milliseconds: 700),
      builder: (_, debounce) {
        return TextField(
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: const InputDecoration(
            hintText: 'Search Product',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          onSubmitted: (String query) {
            context.read<SearchlistBloc>().add(SearchListEvent(query));
          },
          onChanged: (String query) {
            debounce(() {
              FocusScope.of(context).unfocus();
              context.read<SearchlistBloc>().add(SearchListEvent(query));
            });
          },
        );
      },
    );
  }
}
