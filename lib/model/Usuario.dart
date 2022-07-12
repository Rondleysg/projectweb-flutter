import 'Perfil.dart';

class Usuario {
  int? _usuNrId;
  Perfil? _perNrId;
  String? _usuTxSenha;
  String? _usuTxNome;
  String? _usuTxLogin;
  String? _usuTxStatus;
  String? _usuDtCadastro;
  String? _usuTxToken;

  Usuario(
      {int? usuNrId,
        Perfil? perNrId,
        String? usuTxSenha,
        String? usuTxNome,
        String? usuTxLogin,
        String? usuTxStatus,
        String? usuDtCadastro,
        String? usuTxToken}) {
    if (usuNrId != null) {
      this._usuNrId = usuNrId;
    }
    if (perNrId != null) {
      this._perNrId = perNrId;
    }
    if (usuTxSenha != null) {
      this._usuTxSenha = usuTxSenha;
    }
    if (usuTxNome != null) {
      this._usuTxNome = usuTxNome;
    }
    if (usuTxLogin != null) {
      this._usuTxLogin = usuTxLogin;
    }
    if (usuTxStatus != null) {
      this._usuTxStatus = usuTxStatus;
    }
    if (usuDtCadastro != null) {
      this._usuDtCadastro = usuDtCadastro;
    }
    if (usuTxToken != null) {
      this._usuTxToken = usuTxToken;
    }
  }

  int? get usuNrId => _usuNrId;
  set usuNrId(int? usuNrId) => _usuNrId = usuNrId;
  Perfil? get perNrId => _perNrId;
  set perNrId(Perfil? perNrId) => _perNrId = perNrId;
  String? get usuTxSenha => _usuTxSenha;
  set usuTxSenha(String? usuTxSenha) => _usuTxSenha = usuTxSenha;
  String? get usuTxNome => _usuTxNome;
  set usuTxNome(String? usuTxNome) => _usuTxNome = usuTxNome;
  String? get usuTxLogin => _usuTxLogin;
  set usuTxLogin(String? usuTxLogin) => _usuTxLogin = usuTxLogin;
  String? get usuTxStatus => _usuTxStatus;
  set usuTxStatus(String? usuTxStatus) => _usuTxStatus = usuTxStatus;
  String? get usuDtCadastro => _usuDtCadastro;
  set usuDtCadastro(String? usuDtCadastro) => _usuDtCadastro = usuDtCadastro;
  String? get usuTxToken => _usuTxToken;
  set usuTxToken(String? usuTxToken) => _usuTxToken = usuTxToken;

  Usuario.fromJson(Map<String, dynamic> json) {
    _usuNrId = json['usuNrId'];
    _perNrId =
    json['perNrId'] != null ? new Perfil.fromJson(json['perNrId']) : null;
    _usuTxSenha = json['usuTxSenha'];
    _usuTxNome = json['usuTxNome'];
    _usuTxLogin = json['usuTxLogin'];
    _usuTxStatus = json['usuTxStatus'];
    _usuDtCadastro = json['usuDtCadastro'];
    _usuTxToken = json['usuTxToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usuNrId'] = this._usuNrId;
    if (this._perNrId != null) {
      data['perNrId'] = this._perNrId!.toJson();
    }
    data['usuTxSenha'] = this._usuTxSenha;
    data['usuTxNome'] = this._usuTxNome;
    data['usuTxLogin'] = this._usuTxLogin;
    data['usuTxStatus'] = this._usuTxStatus;
    data['usuDtCadastro'] = this._usuDtCadastro;
    data['usuTxToken'] = this._usuTxToken;
    return data;
  }
}