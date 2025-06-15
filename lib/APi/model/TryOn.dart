/// message : "✅ الصورة اتحفظت بنجاح"
/// result_id : 52
/// result_image_url : "http://monsef74.pythonanywhere.com/media/tryon_results/output_PMnlUCC.jpg"

class TryOn {
  TryOn({
      this.message, 
      this.resultId, 
      this.resultImageUrl,});

  TryOn.fromJson(dynamic json) {
    message = json['message'];
    resultId = json['result_id'];
    resultImageUrl = json['result_image_url'];
  }
  String? message;
  int? resultId;
  String? resultImageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['result_id'] = resultId;
    map['result_image_url'] = resultImageUrl;
    return map;
  }

}