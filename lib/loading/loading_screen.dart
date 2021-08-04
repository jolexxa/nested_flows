import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested_flows/loading/bloc/loading_bloc.dart';
import 'package:nested_flows/utility/utility.dart';

typedef SuccessCallback<T> = void Function(BuildContext, T);
typedef ErrorCallback = void Function(BuildContext, Object?);

class LoadingScreen<T> extends StatelessWidget {
  const LoadingScreen({
    Key? key,
    required this.load,
    required this.onSuccess,
    required this.onError,
  }) : super(key: key);

  final ValueGetter<Future<T>> load;
  final SuccessCallback<T> onSuccess;
  final ErrorCallback onError;

  static Page<void> page<T>({
    required ValueGetter<Future<T>> load,
    required SuccessCallback<T> onSuccess,
    required ErrorCallback onError,
  }) {
    return PageWithoutAnimation<void>(
      key: UniqueKey(),
      child: LoadingScreen<T>(
        load: load,
        onSuccess: onSuccess,
        onError: onError,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingBloc<T>()..add(Load(load: load)),
      child: BlocListener<LoadingBloc<T>, LoadingState<T>>(
        listener: (context, state) {
          if (state is LoadingError<T>) {
            onError(context, state.error as Exception);
          } else if (state is LoadingState<T>) {
            onSuccess(context, state.data as T);
          }
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
