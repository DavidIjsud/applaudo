import 'dart:developer';

import 'package:applaudo/modules/searchlist/presentation/blocs/bloc_search_list/searchlist_bloc.dart';
import 'package:debounce_builder/debounce_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnQueryChanged = void Function(String query);

class TextFieldSearch extends StatefulWidget {
  const TextFieldSearch({
    Key? key,
    required this.onQueryChanged,
  }) : super(key: key);

  final OnQueryChanged onQueryChanged;

  @override
  State<TextFieldSearch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  late FocusNode _focusNodeTextField;

  @override
  void initState() {
    super.initState();
    _focusNodeTextField = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _listenToKeyBoard();
    });
  }

  _listenToKeyBoard() {
    _focusNodeTextField.addListener(() {
      if (_focusNodeTextField.hasFocus) {
        context
            .read<SearchlistBloc>()
            .add(OnChangeKeyBoardStatus(isVisibleKeyBoard: true));
      } else {
        context
            .read<SearchlistBloc>()
            .add(OnChangeKeyBoardStatus(isVisibleKeyBoard: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DebounceBuilder(
      delay: const Duration(milliseconds: 700),
      builder: (_, debounce) {
        return TextField(
          focusNode: _focusNodeTextField,
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
            if (query.isNotEmpty) {
              context.read<SearchlistBloc>().add(SearchListEvent(query));
            }
          },
          onChanged: (String query) {
            if (query.isNotEmpty) {
              widget.onQueryChanged(query);
              debounce(() {
                FocusScope.of(context).unfocus();
                context.read<SearchlistBloc>().add(SearchListEvent(query));
              });
            }
          },
        );
      },
    );
  }
}
