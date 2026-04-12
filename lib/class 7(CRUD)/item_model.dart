class Item_Model{
  final String name;
  final int id;
  final bool favourite;
  Item_Model({required this.name,required this.id,required this.favourite});
  Item_Model copyWith({String? name, int? id, bool? favourite}){
    return Item_Model(name: name??this.name, id: id??this.id, favourite: favourite??this.favourite);
  }
}