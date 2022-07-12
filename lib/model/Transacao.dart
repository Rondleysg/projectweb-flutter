import 'Servico.dart';
import 'Perfil.dart';

class Transacao {
  int? _traNrId;
  Perfil? _perNrId;
  Servico? _serNrId;
  String? _traTxNome;
  String? _traTxStatus;
  String? _traTxUrl;

  Transacao(
      {int? traNrId,
        Perfil? perNrId,
        Servico? serNrId,
        String? traTxNome,
        String? traTxStatus,
        String? traTxUrl}) {
    if (traNrId != null) {
      this._traNrId = traNrId;
    }
    if (perNrId != null) {
      this._perNrId = perNrId;
    }
    if (serNrId != null) {
      this._serNrId = serNrId;
    }
    if (traTxNome != null) {
      this._traTxNome = traTxNome;
    }
    if (traTxStatus != null) {
      this._traTxStatus = traTxStatus;
    }
    if (traTxUrl != null) {
      this._traTxUrl = traTxUrl;
    }
  }

  int? get traNrId => _traNrId;
  set traNrId(int? traNrId) => _traNrId = traNrId;
  Perfil? get perNrId => _perNrId;
  set perNrId(Perfil? perNrId) => _perNrId = perNrId;
  Servico? get serNrId => _serNrId;
  set serNrId(Servico? serNrId) => _serNrId = serNrId;
  String? get traTxNome => _traTxNome;
  set traTxNome(String? traTxNome) => _traTxNome = traTxNome;
  String? get traTxStatus => _traTxStatus;
  set traTxStatus(String? traTxStatus) => _traTxStatus = traTxStatus;
  String? get traTxUrl => _traTxUrl;
  set traTxUrl(String? traTxUrl) => _traTxUrl = traTxUrl;

  Transacao.fromJson(Map<String, dynamic> json) {
    _traNrId = json['traNrId'];
    _perNrId =
    json['perNrId'] != null ? new Perfil.fromJson(json['perNrId']) : null;
    _serNrId =
    json['serNrId'] != null ? new Servico.fromJson(json['serNrId']) : null;
    _traTxNome = json['traTxNome'];
    _traTxStatus = json['traTxStatus'];
    _traTxUrl = json['traTxUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['traNrId'] = this._traNrId;
    if (this._perNrId != null) {
      data['perNrId'] = this._perNrId!.toJson();
    }
    if (this._serNrId != null) {
      data['serNrId'] = this._serNrId!.toJson();
    }
    data['traTxNome'] = this._traTxNome;
    data['traTxStatus'] = this._traTxStatus;
    data['traTxUrl'] = this._traTxUrl;
    return data;
  }
}