class Result<T> {
  final T? value;
  final String? errorMessage;
  final bool isError;

  Result.success(this.value)
      : isError = false,
        errorMessage = null;

  Result.error(this.errorMessage)
      : isError = true,
        value = null;

  @override
  String toString() {
    if (isError) {
      return 'Error: $errorMessage';
    } else {
      return value.toString();
    }
  }
}
