part of 'searchlist_bloc.dart';

@immutable
abstract class SearchlistEvent extends Equatable {}

class SearchListEvent extends SearchlistEvent {
  final String query;

  SearchListEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class OnChangeKeyBoardStatus extends SearchlistEvent {
  final bool isVisibleKeyBoard;

  OnChangeKeyBoardStatus({
    required this.isVisibleKeyBoard,
  });

  @override
  List<Object?> get props => [];
}
