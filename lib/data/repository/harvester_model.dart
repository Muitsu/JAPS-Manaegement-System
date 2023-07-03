class HarvesterModel {
  int? id;
  String? fieldNo;
  String? date;
  String? createdDate;
  String? updatedDate;

  HarvesterModel(
      {this.id, this.fieldNo, this.date, this.createdDate, this.updatedDate});

  HarvesterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fieldNo = json['field_no'];
    date = json['date'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['field_no'] = fieldNo;
    data['date'] = date;
    data['created_date'] = createdDate;
    data['updated_date'] = updatedDate;
    return data;
  }

  HarvesterModel copyWith({
    int? id,
    String? fieldNo,
    String? date,
    String? createdDate,
    String? updatedDate,
  }) {
    return HarvesterModel(
      id: id ?? this.id,
      fieldNo: fieldNo ?? this.fieldNo,
      date: date ?? this.date,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }
}
