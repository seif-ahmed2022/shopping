class UpdateFavourites{
  bool? status;
  String? message;

  UpdateFavourites.fromJson(Map<String,dynamic> json)
  {
    status =json["status"];
    message =json["message"];
  }
}