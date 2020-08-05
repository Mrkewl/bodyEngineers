class Account {
  final id;
  final email;
  AccountType type;
  AccountStatus status;
  String token;

  Account({this.id, this.email, this.type, this.token});

  Account.initialState({this.id, this.email, this.token}) {
    this.type = AccountType.standard;
    this.status = AccountStatus.active;
  }
}

enum AccountType { standard, premium, vip }

enum AccountStatus {
  active,
  suspended,
  banned,
  paused,
}
