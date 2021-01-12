class RecentlyViewModels {
  final String image;
  final String title;
  final String price;

  RecentlyViewModels({this.image, this.title, this.price});
}

List<RecentlyViewModels> listrecentlyViewModels = [
  RecentlyViewModels(
    image: "assets/armchair1.png",
    price: "\$ 123",
    title: "Nestudio Sofa",
  ),
  RecentlyViewModels(
    image: "assets/armchair2.png",
    price: "\$ 243",
    title: "Picasso Sofa Emma",
  ),
  RecentlyViewModels(
    image: "assets/armchair3.png",
    price: "\$ 89",
    title: "Xena Sofa",
  ),
];
