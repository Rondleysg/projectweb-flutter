class Sistema {
  int? _sisNrId;
  String? _sisTxNome;
  String? _sisTxStatus;

  Sistema({int? sisNrId, String? sisTxNome, String? sisTxStatus}) {
    if (sisNrId != null) {
      this._sisNrId = sisNrId;
    }
    if (sisTxNome != null) {
      this._sisTxNome = sisTxNome;
    }
    if (sisTxStatus != null) {
      this._sisTxStatus = sisTxStatus;
    }
  }

  int? get sisNrId => _sisNrId;
  set sisNrId(int? sisNrId) => _sisNrId = sisNrId;
  String? get sisTxNome => _sisTxNome;
  set sisTxNome(String? sisTxNome) => _sisTxNome = sisTxNome;
  String? get sisTxStatus => _sisTxStatus;
  set sisTxStatus(String? sisTxStatus) => _sisTxStatus = sisTxStatus;

  Sistema.fromJson(Map<String, dynamic> json) {
    _sisNrId = json['sisNrId'];
    _sisTxNome = json['sisTxNome'];
    _sisTxStatus = json['sisTxStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sisNrId'] = this._sisNrId;
    data['sisTxNome'] = this._sisTxNome;
    data['sisTxStatus'] = this._sisTxStatus;
    return data;
  }
}
