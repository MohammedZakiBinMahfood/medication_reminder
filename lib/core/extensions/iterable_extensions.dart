extension IterableExtensions<T> on Iterable<T> {
  /// Returns the first element matching the predicate, or null if no element matches.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  /// Maps the elements to a list, allowing index access within the map function.
  List<R> mapIndexed<R>(R Function(int index, T element) convert) {
    var index = 0;
    return map((element) => convert(index++, element)).toList();
  }
}
