class StateModel {
  StateModel({required this.name,required this.code, this.isCheck = false});
  final String code;
  final String name;
   bool isCheck;

  @override
  String toString() => name;
}