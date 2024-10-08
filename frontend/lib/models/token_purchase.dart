class TokenPurchase {
  final int amount;

  TokenPurchase({required this.amount});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
    };
  }
}
