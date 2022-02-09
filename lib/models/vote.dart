class Vote {
  final String image_id;
  final int value;

  Vote(this.image_id, this.value);

  Map<String, dynamic> toJson() => {
    'image_id': image_id,
    'value': value,
  };
}