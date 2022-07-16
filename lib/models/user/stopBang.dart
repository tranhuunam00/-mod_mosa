class StopBangQuestionModel {
  final String title;
  final String content;
  final String urlImg;
  StopBangQuestionModel(
      {required this.title, required this.content, required this.urlImg});
}

class StopBangModel {
  final String snoring;
  final String tired;
  final String observed;
  final String height;
  final String pressure;
  final String weight;
  final String necksize;
  final String? customer;
  final String? createdAt;

  StopBangModel(
      {required this.snoring,
      required this.tired,
      this.customer,
      this.createdAt,
      required this.observed,
      required this.height,
      required this.pressure,
      required this.weight,
      required this.necksize});

  Map<String, dynamic> toJson() => {
        'snoring': snoring,
        'tired': tired,
        'observed': observed,
        'height': height,
        'pressure': pressure,
        'weight': weight,
        'necksize': necksize,
        "customer": customer
      };
}
