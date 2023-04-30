// To parse this JSON data, do
//
//     final covidModel = covidModelFromJson(jsonString);

import 'dart:convert';

CovidModel covidModelFromJson(String str) => CovidModel.fromJson(json.decode(str));

String covidModelToJson(CovidModel data) => json.encode(data.toJson());

class CovidModel {
  CovidModel({
    this.length,
    this.maxPageLimit,
    this.totalRecords,
    this.data,
    this.requestPayload,
    this.pagination,
  });

  int? length;
  int? maxPageLimit;
  int? totalRecords;
  List<Datum>? data;
  RequestPayload? requestPayload;
  Pagination? pagination;

  factory CovidModel.fromJson(Map<String, dynamic> json) => CovidModel(
    length: json["length"],
    maxPageLimit: json["maxPageLimit"],
    totalRecords: json["totalRecords"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    requestPayload: RequestPayload.fromJson(json["requestPayload"]),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "length": length,
    "maxPageLimit": maxPageLimit,
    "totalRecords": totalRecords,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "requestPayload": requestPayload!.toJson(),
    "pagination": pagination!.toJson(),
  };
}

class Datum {
  Datum({
    this.date,
    this.areaName,
    this.areaCode,
    this.confirmedRate,
    this.latestBy,
    this.confirmed,
    this.deathNew,
    this.death,
    this.deathRate,
  });

  DateTime? date;
  AreaName? areaName;
  AreaCode? areaCode;
  double? confirmedRate;
  int? latestBy;
  int? confirmed;
  int? deathNew;
  int? death;
  double? deathRate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    date: DateTime.parse(json["date"]),
    areaName: areaNameValues.map![json["areaName"]],
    areaCode: areaCodeValues.map![json["areaCode"]],
    confirmedRate: json["confirmedRate"] == null ? null : json["confirmedRate"].toDouble(),
    latestBy: json["latestBy"],
    confirmed: json["confirmed"],
    deathNew: json["deathNew"] == null ? null : json["deathNew"],
    death: json["death"] == null ? null : json["death"],
    deathRate: json["deathRate"] == null ? null : json["deathRate"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "areaName": areaNameValues.reverse[areaName],
    "areaCode": areaCodeValues.reverse[areaCode],
    "confirmedRate": confirmedRate == null ? null : confirmedRate,
    "latestBy": latestBy,
    "confirmed": confirmed,
    "deathNew": deathNew == null ? null : deathNew,
    "death": death == null ? null : death,
    "deathRate": deathRate == null ? null : deathRate,
  };
}

enum AreaCode { K02000001 }

final areaCodeValues = EnumValues({
  "K02000001": AreaCode.K02000001
});

enum AreaName { UNITED_KINGDOM }

final areaNameValues = EnumValues({
  "United Kingdom": AreaName.UNITED_KINGDOM
});

class Pagination {
  Pagination({
    this.current,
    this.next,
    this.previous,
    this.first,
    this.last,
  });

  String? current;
  dynamic next;
  dynamic previous;
  String? first;
  String? last;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    current: json["current"],
    next: json["next"],
    previous: json["previous"],
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "current": current,
    "next": next,
    "previous": previous,
    "first": first,
    "last": last,
  };
}

class RequestPayload {
  RequestPayload({
    this.structure,
    this.filters,
    this.page,
  });

  Structure? structure;
  List<Filter>? filters;
  int? page;

  factory RequestPayload.fromJson(Map<String, dynamic> json) => RequestPayload(
    structure: Structure.fromJson(json["structure"]),
    filters: List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
    page: json["page"],
  );

  Map<String, dynamic> toJson() => {
    "structure": structure!.toJson(),
    "filters": List<dynamic>.from(filters!.map((x) => x.toJson())),
    "page": page,
  };
}

class Filter {
  Filter({
    this.identifier,
    this.filterOperator,
    this.value,
  });

  String? identifier;
  String? filterOperator;
  String? value;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    identifier: json["identifier"],
    filterOperator: json["operator"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "operator": filterOperator,
    "value": value,
  };
}

class Structure {
  Structure({
    this.date,
    this.areaName,
    this.areaCode,
    this.confirmedRate,
    this.confirmedNew,
    this.confirmed,
    this.deathNew,
    this.death,
    this.deathRate,
    this.latestBy,
  });

  String? date;
  String? areaName;
  String? areaCode;
  String? confirmedRate;
  String? confirmedNew;
  String? confirmed;
  String? deathNew;
  String? death;
  String? deathRate;
  String? latestBy;

  factory Structure.fromJson(Map<String, dynamic> json) => Structure(
    date: json["date"],
    areaName: json["areaName"],
    areaCode: json["areaCode"],
    confirmedRate: json["confirmedRate"],
    confirmedNew: json["confirmedNew"],
    confirmed: json["confirmed"],
    deathNew: json["deathNew"],
    death: json["death"],
    deathRate: json["deathRate"],
    latestBy: json["latestBy"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "areaName": areaName,
    "areaCode": areaCode,
    "confirmedRate": confirmedRate,
    "confirmedNew": confirmedNew,
    "confirmed": confirmed,
    "deathNew": deathNew,
    "death": death,
    "deathRate": deathRate,
    "latestBy": latestBy,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
