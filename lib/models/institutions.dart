import 'package:flutter/material.dart';

class Institution {
  final int id;
  final String name;
  final String descript;
  final int iban;

  Institution(this.id, this.name, this.descript, this.iban);

  Institution.fromJson(Map<String, dynamic> json)
      : id = json['Institution_Id'],
        name = json['Name'],
        descript = json['Descript'],
        iban = json['Iban'];

  Map<String, dynamic> toJson() =>
      {'Institution_Id': id, 'Name': name, 'Descript': descript, 'Iban': iban};
}
