class ItemModel {
  final int itemId;
  final String itemName;
  final String itemNameAr;
  final String itemDesc;
  final String itemDescAr;
  final String itemImage;
  final int itemCount;
  final int itemActive;
  final double itemPrice;
  final int itemDiscount;
  final String itemDate;
  final int itemCategory;

  ItemModel({
    required this.itemId,
    required this.itemName,
    required this.itemNameAr,
    required this.itemDesc,
    required this.itemDescAr,
    required this.itemImage,
    required this.itemCount,
    required this.itemActive,
    required this.itemPrice,
    required this.itemDiscount,
    required this.itemDate,
    required this.itemCategory,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      itemId: int.parse(json['item_id'].toString()),

      itemName: json['item_name'],

      itemNameAr: json['item_name_ar'],

      itemDesc: json['item_desc'],

      itemDescAr: json['item_desc_ar'],

      itemImage: json['item_image'],

      itemCount: int.parse(json['item_count'].toString()),

      itemActive: int.parse(json['item_active'].toString()),

      itemPrice: double.parse(json['item_price'].toString()),

      itemDiscount: int.parse(json['item_discount'].toString()),

      itemDate: json['item_date'],

      itemCategory: int.parse(json['item_category'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item_id': itemId,
      'item_name': itemName,
      'item_name_ar': itemNameAr,
      'item_desc': itemDesc,
      'item_desc_ar': itemDescAr,
      'item_image': itemImage,
      'item_count': itemCount,
      'item_active': itemActive,
      'item_price': itemPrice,
      'item_discount': itemDiscount,
      'item_date': itemDate,
      'item_category': itemCategory,
    };
  }
}
