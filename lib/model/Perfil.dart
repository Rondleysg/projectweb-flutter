class Perfil {
  int? _perNrId;
  String? _perTxNome;
  String? _perTxStatus;

  Perfil({int? perNrId, String? perTxNome, String? perTxStatus}) {
    if (perNrId != null) {
      this._perNrId = perNrId;
    }
    if (perTxNome != null) {
      this._perTxNome = perTxNome;
    }
    if (perTxStatus != null) {
      this._perTxStatus = perTxStatus;
    }
  }

  int? get perNrId => _perNrId;
  set perNrId(int? perNrId) => _perNrId = perNrId;
  String? get perTxNome => _perTxNome;
  set perTxNome(String? perTxNome) => _perTxNome = perTxNome;
  String? get perTxStatus => _perTxStatus;
  set perTxStatus(String? perTxStatus) => _perTxStatus = perTxStatus;

  Perfil.fromJson(Map<String, dynamic> json) {
    _perNrId = json['perNrId'];
    _perTxNome = json['perTxNome'];
    _perTxStatus = json['perTxStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['perNrId'] = this._perNrId;
    data['perTxNome'] = this._perTxNome;
    data['perTxStatus'] = this._perTxStatus;
    return data;
  }
}
