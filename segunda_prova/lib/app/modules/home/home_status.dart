enum HomeStatus { loading, sucess, error, none }

extension HomeStatusExt on HomeStatus{
  static var _value;
  get value => value;
  set value(value) => value = value;
}