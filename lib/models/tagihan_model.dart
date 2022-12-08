final List<String> status = ['Lunas', 'Asuransi', 'Belum Lunas'];

class TagihanModel {
  final String? idTagihan;

  final String? status;
  final DateTime? tanggalDibuat;

  TagihanModel({this.idTagihan, this.status, this.tanggalDibuat});
}
