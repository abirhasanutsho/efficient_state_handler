sealed class DS<T> {
  final T? valueOrNull;
  final Object? error;
  final DataState dataState;

  DS({this.valueOrNull, this.error, required this.dataState});

  T get value => valueOrNull!;

  R onState<R>({
    required R Function(T data) fetched,
    required R Function(Object error) failed,
    required R Function() loading,
  }) {
    if (dataState.isFailed) {
      return failed(error!);
    } else if (dataState.isLoading) {
      return loading();
    } else {
      return fetched(valueOrNull as T);
    }
  }
}



class Fetched<T> extends DS<T> {
  final T data;
  Fetched(this.data) : super(dataState: DataState.fetched, valueOrNull: data);
}

class Loading<T> extends DS<T> {
  Loading() : super(dataState: DataState.loading);
}

class Failed<T> extends DS<T> {
  final Object error;
  Failed(this.error) : super(dataState: DataState.failed, error: error);
}

enum DataState {
  fetched,
  loading,
  failed;

  bool get isFetched => this == DataState.fetched;
  bool get isLoading => this == DataState.loading;
  bool get isFailed => this == DataState.failed;
}
