import 'Sistema.dart';

class Servico {
  int? _serNrId;
  Sistema? _sisNrId;
  String? _serTxNome;
  String? _serTxUrl;
  String? _serTxStatus;

  Servico(
      {int? serNrId,
        Sistema? sisNrId,
        String? serTxNome,
        String? serTxUrl,
        String? serTxStatus}) {
    if (serNrId != null) {
      this._serNrId = serNrId;
    }
    if (sisNrId != null) {
      this._sisNrId = sisNrId;
    }
    if (serTxNome != null) {
      this._serTxNome = serTxNome;
    }
    if (serTxUrl != null) {
      this._serTxUrl = serTxUrl;
    }
    if (serTxStatus != null) {
      this._serTxStatus = serTxStatus;
    }
  }

  int? get serNrId => _serNrId;
  set serNrId(int? serNrId) => _serNrId = serNrId;
  Sistema? get sisNrId => _sisNrId;
  set sisNrId(Sistema? sisNrId) => _sisNrId = sisNrId;
  String? get serTxNome => _serTxNome;
  set serTxNome(String? serTxNome) => _serTxNome = serTxNome;
  String? get serTxUrl => _serTxUrl;
  set serTxUrl(String? serTxUrl) => _serTxUrl = serTxUrl;
  String? get serTxStatus => _serTxStatus;
  set serTxStatus(String? serTxStatus) => _serTxStatus = serTxStatus;

  Servico.fromJson(Map<String, dynamic> json) {
    _serNrId = json['serNrId'];
    _sisNrId =
    json['sisNrId'] != null ? new Sistema.fromJson(json['sisNrId']) : null;
    _serTxNome = json['serTxNome'];
    _serTxUrl = json['serTxUrl'];
    _serTxStatus = json['serTxStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serNrId'] = this._serNrId;
    if (this._sisNrId != null) {
      data['sisNrId'] = this._sisNrId!.toJson();
    }
    data['serTxNome'] = this._serTxNome;
    data['serTxUrl'] = this._serTxUrl;
    data['serTxStatus'] = this._serTxStatus;
    return data;
  }
}
