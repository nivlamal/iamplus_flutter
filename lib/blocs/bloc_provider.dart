import 'package:flutter/material.dart';
import 'package:iamplus_flutter/blocs/bloc.dart';

// A provider class that stores an implementation of bloc
class BlocProvider<T extends Bloc> extends StatefulWidget {
  const BlocProvider({Key key, @required this.bloc, @required this.child})
    : super(key: key);

  // "of" method allows descendant in the widget tree to access the BlocProvider
  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T> provider = context.findAncestorWidgetOfExactType();
    return provider.bloc;
  }

  final Widget child;
  final T bloc;

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider<Bloc>> {
  @override
  Widget build(BuildContext context) => widget.child;

  // When this widget is disposed, it will dispose the bloc's controller stream
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}