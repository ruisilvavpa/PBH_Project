class Institution {
  final int? id;
  final String name;
  final String descript;
  final String iban;

  Institution(this.id, this.name, this.descript, this.iban);

  Institution.fromJson(Map<String, dynamic> json)
      : id = json['institution_Id'],
        name = json['name'],
        descript = json['descript'],
        iban = json['iban'];
}
