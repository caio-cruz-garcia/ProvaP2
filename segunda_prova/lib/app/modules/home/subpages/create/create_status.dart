enum CreateStatus { loading, success, error, none }

extension CreateStatusExt on CreateStatus {
  static var _value;
  get value => _value;
  set value(value) => _value = value;
}