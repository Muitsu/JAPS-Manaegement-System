class UpkeepModel {
  int? id;
  String? fieldNo;
  String? manuFertType;
  String? manuNoWorkers;
  String? manuNoTracDriver;
  String? manuPrestMandor;
  String? manuMethod;
  String? manuHectCoverTarget;
  String? manuTotIssueBag;
  String? manuHectCoverAct;
  String? sprayChecmiType;
  String? sprayNoWorkers;
  String? sprayNoTracDriver;
  String? sprayPrestMandor;
  String? sprayMethod;
  String? sprayHectCoverTarget;
  String? sprayHectCoverAct;
  String? weedType;
  String? weedNoWorkers;
  String? weedNoTracDriver;
  String? weedPrestMandor;
  String? weedHectCoverTarget;
  String? weedHectCoverAct;
  String? pndType;
  String? pndNoWorkers;
  String? pndNoTracDriver;
  String? pndPrestMandor;
  String? pndChemi;
  String? pndHectCoverTarget;
  String? pndHectCoverAct;
  String? date;
  String? createdDate;
  String? updatedDate;

  UpkeepModel(
      {this.id,
      this.fieldNo,
      this.manuFertType,
      this.manuNoWorkers,
      this.manuNoTracDriver,
      this.manuPrestMandor,
      this.manuMethod,
      this.manuHectCoverTarget,
      this.manuTotIssueBag,
      this.manuHectCoverAct,
      this.sprayChecmiType,
      this.sprayNoWorkers,
      this.sprayNoTracDriver,
      this.sprayPrestMandor,
      this.sprayMethod,
      this.sprayHectCoverTarget,
      this.sprayHectCoverAct,
      this.weedType,
      this.weedNoWorkers,
      this.weedNoTracDriver,
      this.weedPrestMandor,
      this.weedHectCoverTarget,
      this.weedHectCoverAct,
      this.pndType,
      this.pndNoWorkers,
      this.pndNoTracDriver,
      this.pndPrestMandor,
      this.pndChemi,
      this.pndHectCoverTarget,
      this.pndHectCoverAct,
      this.date,
      this.createdDate,
      this.updatedDate});

  UpkeepModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fieldNo = json['field_no'];
    manuFertType = json['manuFertType'];
    manuNoWorkers = json['manuNoWorkers'];
    manuNoTracDriver = json['manuNoTracDriver'];
    manuPrestMandor = json['manuPrestMandor'];
    manuMethod = json['manuMethod'];
    manuHectCoverTarget = json['manuHectCoverTarget'];
    manuTotIssueBag = json['manuTotIssueBag'];
    manuHectCoverAct = json['manuHectCoverAct'];
    sprayChecmiType = json['sprayChecmiType'];
    sprayNoWorkers = json['sprayNoWorkers'];
    sprayNoTracDriver = json['sprayNoTracDriver'];
    sprayPrestMandor = json['sprayPrestMandor'];
    sprayMethod = json['sprayMethod'];
    sprayHectCoverTarget = json['sprayHectCoverTarget'];
    sprayHectCoverAct = json['sprayHectCoverAct'];
    weedType = json['weedType'];
    weedNoWorkers = json['weedNoWorkers'];
    weedNoTracDriver = json['weedNoTracDriver'];
    weedPrestMandor = json['weedPrestMandor'];
    weedHectCoverTarget = json['weedHectCoverTarget'];
    weedHectCoverAct = json['weedHectCoverAct'];
    pndType = json['pndType'];
    pndNoWorkers = json['pndNoWorkers'];
    pndNoTracDriver = json['pndNoTracDriver'];
    pndPrestMandor = json['pndPrestMandor'];
    pndChemi = json['pndChemi'];
    pndHectCoverTarget = json['pndHectCoverTarget'];
    pndHectCoverAct = json['pndHectCoverAct'];
    date = json['date'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['field_no'] = fieldNo;
    data['manuFertType'] = manuFertType;
    data['manuNoWorkers'] = manuNoWorkers;
    data['manuNoTracDriver'] = manuNoTracDriver;
    data['manuPrestMandor'] = manuPrestMandor;
    data['manuMethod'] = manuMethod;
    data['manuHectCoverTarget'] = manuHectCoverTarget;
    data['manuTotIssueBag'] = manuTotIssueBag;
    data['manuHectCoverAct'] = manuHectCoverAct;
    data['sprayChecmiType'] = sprayChecmiType;
    data['sprayNoWorkers'] = sprayNoWorkers;
    data['sprayNoTracDriver'] = sprayNoTracDriver;
    data['sprayPrestMandor'] = sprayPrestMandor;
    data['sprayMethod'] = sprayMethod;
    data['sprayHectCoverTarget'] = sprayHectCoverTarget;
    data['sprayHectCoverAct'] = sprayHectCoverAct;
    data['weedType'] = weedType;
    data['weedNoWorkers'] = weedNoWorkers;
    data['weedNoTracDriver'] = weedNoTracDriver;
    data['weedPrestMandor'] = weedPrestMandor;
    data['weedHectCoverTarget'] = weedHectCoverTarget;
    data['weedHectCoverAct'] = weedHectCoverAct;
    data['pndType'] = pndType;
    data['pndNoWorkers'] = pndNoWorkers;
    data['pndNoTracDriver'] = pndNoTracDriver;
    data['pndPrestMandor'] = pndPrestMandor;
    data['pndChemi'] = pndChemi;
    data['pndHectCoverTarget'] = pndHectCoverTarget;
    data['pndHectCoverAct'] = pndHectCoverAct;
    data['date'] = date;
    data['created_date'] = createdDate;
    data['updated_date'] = updatedDate;
    return data;
  }

  UpkeepModel copyWith({
    int? id,
    String? fieldNo,
    String? manuFertType,
    String? manuNoWorkers,
    String? manuNoTracDriver,
    String? manuPrestMandor,
    String? manuMethod,
    String? manuHectCoverTarget,
    String? manuTotIssueBag,
    String? manuHectCoverAct,
    String? sprayChecmiType,
    String? sprayNoWorkers,
    String? sprayNoTracDriver,
    String? sprayPrestMandor,
    String? sprayMethod,
    String? sprayHectCoverTarget,
    String? sprayHectCoverAct,
    String? weedType,
    String? weedNoWorkers,
    String? weedNoTracDriver,
    String? weedPrestMandor,
    String? weedHectCoverTarget,
    String? weedHectCoverAct,
    String? pndType,
    String? pndNoWorkers,
    String? pndNoTracDriver,
    String? pndPrestMandor,
    String? pndChemi,
    String? pndHectCoverTarget,
    String? pndHectCoverAct,
    String? date,
    String? createdDate,
    String? updatedDate,
  }) {
    return UpkeepModel(
      id: id ?? this.id,
      fieldNo: fieldNo ?? this.fieldNo,
      manuFertType: manuFertType ?? this.manuFertType,
      manuNoWorkers: manuNoWorkers ?? this.manuNoWorkers,
      manuNoTracDriver: manuNoTracDriver ?? this.manuNoTracDriver,
      manuPrestMandor: manuPrestMandor ?? this.manuPrestMandor,
      manuMethod: manuMethod ?? this.manuMethod,
      manuHectCoverTarget: manuHectCoverTarget ?? this.manuHectCoverTarget,
      manuTotIssueBag: manuTotIssueBag ?? this.manuTotIssueBag,
      manuHectCoverAct: manuHectCoverAct ?? this.manuHectCoverAct,
      sprayChecmiType: sprayChecmiType ?? this.sprayChecmiType,
      sprayNoWorkers: sprayNoWorkers ?? this.sprayNoWorkers,
      sprayNoTracDriver: sprayNoTracDriver ?? this.sprayNoTracDriver,
      sprayPrestMandor: sprayPrestMandor ?? this.sprayPrestMandor,
      sprayMethod: sprayMethod ?? this.sprayMethod,
      sprayHectCoverTarget: sprayHectCoverTarget ?? this.sprayHectCoverTarget,
      sprayHectCoverAct: sprayHectCoverAct ?? this.sprayHectCoverAct,
      weedType: weedType ?? this.weedType,
      weedNoWorkers: weedNoWorkers ?? this.weedNoWorkers,
      weedNoTracDriver: weedNoTracDriver ?? this.weedNoTracDriver,
      weedPrestMandor: weedPrestMandor ?? this.weedPrestMandor,
      weedHectCoverTarget: weedHectCoverTarget ?? this.weedHectCoverTarget,
      weedHectCoverAct: weedHectCoverAct ?? this.weedHectCoverAct,
      pndType: pndType ?? this.pndType,
      pndNoWorkers: pndNoWorkers ?? this.pndNoWorkers,
      pndNoTracDriver: pndNoTracDriver ?? this.pndNoTracDriver,
      pndPrestMandor: pndPrestMandor ?? this.pndPrestMandor,
      pndChemi: pndChemi ?? this.pndChemi,
      pndHectCoverTarget: pndHectCoverTarget ?? this.pndHectCoverTarget,
      pndHectCoverAct: pndHectCoverAct ?? this.pndHectCoverAct,
      date: date ?? this.date,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }
}
