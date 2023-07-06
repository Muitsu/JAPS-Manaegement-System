class GangModel {
  int? id;
  int? harvesterId;
  String? gangNo;
  String? noHarvester;
  String? noCutter;
  String? evitMethod;
  String? targetMt;
  String? balanceMtToday;
  String? balanceMtPrev;
  String? totalBin;
  String? cutTotHect;
  String? cutTotDispt;
  String? harvTotHect;
  String? harvTotDispt;

  GangModel(
      {this.id,
      this.harvesterId,
      this.gangNo,
      this.noHarvester,
      this.noCutter,
      this.evitMethod,
      this.targetMt,
      this.balanceMtToday,
      this.balanceMtPrev,
      this.totalBin,
      this.cutTotHect,
      this.cutTotDispt,
      this.harvTotHect,
      this.harvTotDispt});

  GangModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    harvesterId = json['harvester_id'];
    gangNo = json['gang_no'];
    noHarvester = json['no_harvester'];
    noCutter = json['no_cutter'];
    evitMethod = json['evit_method'];
    targetMt = json['target_mt'];
    balanceMtToday = json['balance_mt_today'];
    balanceMtPrev = json['balance_mt_prev'];
    totalBin = json['total_bin'];
    cutTotHect = json['cutTotHect'];
    cutTotDispt = json['cutTotDispt'];
    harvTotHect = json['harvTotHect'];
    harvTotDispt = json['harvTotDispt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['harvester_id'] = harvesterId;
    data['gang_no'] = gangNo;
    data['no_harvester'] = noHarvester;
    data['no_cutter'] = noCutter;
    data['evit_method'] = evitMethod;
    data['target_mt'] = targetMt;
    data['balance_mt_today'] = balanceMtToday;
    data['balance_mt_prev'] = balanceMtPrev;
    data['total_bin'] = totalBin;
    data['cutTotHect'] = cutTotHect;
    data['cutTotDispt'] = cutTotDispt;
    data['harvTotHect'] = harvTotHect;
    data['harvTotDispt'] = harvTotDispt;
    return data;
  }

  GangModel copyWith({
    int? id,
    int? harvesterId,
    String? gangNo,
    String? noHarvester,
    String? noCutter,
    String? evitMethod,
    String? targetMt,
    String? balanceMtToday,
    String? balanceMtPrev,
    String? totalBin,
    String? cutTotHect,
    String? cutTotDispt,
    String? harvTotHect,
    String? harvTotDispt,
  }) {
    return GangModel(
      id: id ?? this.id,
      harvesterId: harvesterId ?? this.harvesterId,
      gangNo: gangNo ?? this.gangNo,
      noHarvester: noHarvester ?? this.noHarvester,
      noCutter: noCutter ?? this.noCutter,
      evitMethod: evitMethod ?? this.evitMethod,
      targetMt: targetMt ?? this.targetMt,
      balanceMtToday: balanceMtToday ?? this.balanceMtToday,
      balanceMtPrev: balanceMtPrev ?? this.balanceMtPrev,
      totalBin: totalBin ?? this.totalBin,
      cutTotHect: cutTotHect ?? this.cutTotHect,
      cutTotDispt: cutTotDispt ?? this.cutTotDispt,
      harvTotHect: harvTotHect ?? this.harvTotHect,
      harvTotDispt: harvTotDispt ?? this.harvTotDispt,
    );
  }
}
