class ShoppingItemModel{
  // 이름
  final String name;
  // 갯수
  final int quantity;
  // 구매했는지
  final bool hasBought;
  // 매운지
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });

  ShoppingItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }){
    // 파라미터의 입력된 값들만 새로운 값들로 변경. 입력되지 않은건 원래 있던 값들이 들어감
    return ShoppingItemModel(
        name: name ?? this.name, // 입력받지 않았으면 this.name. null이 아니면 입력받은 값으로 변경
        quantity: quantity ?? this.quantity,
        hasBought: hasBought ?? this.hasBought,
        isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}