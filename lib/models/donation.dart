class Donation {
  final int bookId;
  final double donationAmount;

  Donation(this.bookId, this.donationAmount);

  Map<String, dynamic> toJson() =>
      {'bookId': bookId, 'donationAmount': donationAmount};
}
