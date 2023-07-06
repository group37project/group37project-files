class FormDataModel {
  String age;
  String gender;
  String bmi;
  int children;
  String region;
  bool isSmoker;

  FormDataModel({
    required this.age,
    required this.children,
    required this.region,
    required this.bmi,
    required this.gender,
    required this.isSmoker,
  });

  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'children': children,
      'bmi': bmi,
      'region': region,
      'sex': gender,
      'smoker': isSmoker
    };
  }
}
