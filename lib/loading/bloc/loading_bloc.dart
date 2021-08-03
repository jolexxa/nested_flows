import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class LoadingBloc<T> extends Bloc<LoadingEvent, LoadingState<T>> {
  LoadingBloc() : super(LoadingState<T>());

  @override
  Stream<LoadingState<T>> mapEventToState(
    LoadingEvent event,
  ) async* {
    if (event is Load<T>) {
      try {
        final data = await event.load();
        yield LoadingState(data: data);
      } catch (e) {
        yield LoadingError(error: e, data: state.data);
      }
    }
  }
}

@immutable
abstract class LoadingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class Load<T> extends LoadingEvent {
  Load({required this.load});
  final ValueGetter<Future<T>> load;

  @override
  List<Object?> get props => [load];
}

@immutable
class LoadingState<T> extends Equatable {
  const LoadingState({this.data});

  final T? data;

  @override
  List<Object?> get props => [data];
}

@immutable
class LoadingError<T> extends LoadingState<T> {
  const LoadingError({required this.error, T? data}) : super(data: data);

  final Object error;

  @override
  List<Object?> get props => [data, error];
}
