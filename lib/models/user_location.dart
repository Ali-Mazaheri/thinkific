class UserLocation {
  String id;
  String location;

  UserLocation(
    this.id,
    this.location,
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'location': location,
    };
  }

  factory UserLocation.fromJson(Map<String, dynamic> json) {
    return UserLocation(
      json['id'] as String,
      json['location'] as String,
    );
  }
}
