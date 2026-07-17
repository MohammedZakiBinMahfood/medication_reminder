enum ActionMode {
  create,
  read,
  update,
  delete,
}

enum ScreenMode {
  view,
  edit,
  create,
}

enum SortDirection {
  asc,
  desc,
}

enum FilterOperator {
  equals,
  contains,
  greaterThan,
  lessThan,
}

enum LoadState {
  initial,
  loading,
  success,
  error,
}
