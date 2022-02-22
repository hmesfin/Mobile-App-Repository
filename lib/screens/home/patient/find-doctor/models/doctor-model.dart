class DoctorModel {
  String name, type1, location, availability, degree;
  List type2;
  double rating;

  int fee;
  int exp;
  String user_id;
  String pic;
  String totalReviews;

  DoctorModel({this.availability,
    this.totalReviews,
    this.degree,
    this.exp,
    this.fee,
    this.user_id,
    this.location,
    this.name,
    this.type1,
    this.type2,
    this.rating,
    this.pic});
}
