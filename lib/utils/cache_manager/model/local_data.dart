class BaseLocal {
  DateTime time;
  String model;

  BaseLocal({required this.time, required this.model});

  static BaseLocal fromJson(Map<String, dynamic> json) {
    DateTime time = DateTime.parse(json['time']);
    String model = json['model'];

    return BaseLocal(time: time, model: model);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time.toString();
    data['model'] = model;
    return data;
  }
}
