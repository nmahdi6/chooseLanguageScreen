part of 'language_cubit.dart';

abstract class LanguageState extends Equatable {
  final String next;
  final int n;

  const LanguageState(
    this.next,
    this.n,
  );

  @override
  List<Object> get props => [];
}

class English extends LanguageState {
  const English({
    required String next,
    required int n,
  }) : super(next, n);
}

class Farsi extends LanguageState {
  const Farsi({
    required String next,
    required int n,
  }) : super(next, n);
}

class Arabic extends LanguageState {
  const Arabic({
    required String next,
    required int n,
  }) : super(next, n);
}

class Turkish extends LanguageState {
  const Turkish({
    required String next,
    required int n,
  }) : super(next, n);
}
