class ExploreCardDetailModel {
  ExploreCardDetailModel(
      this.imageUrl, this.city, this.price, this.roms, this.direction);
  final String imageUrl;
  final String city;
  final int price;
  final int roms;
  final String direction;
}

class ExploreCardSimpleModel {
  ExploreCardSimpleModel(this.imageUrl, this.city);
  final String imageUrl;
  final String city;
}
