class PatientTransactionsModel {
  int amount;
  String transactionNote;
  int transactionStatus;
  String paymentRefId;
  String txnType;
  String createdAt;
  String updatedAt;

  PatientTransactionsModel(
      {this.amount,
      this.transactionNote,
      this.transactionStatus,
      this.paymentRefId,
      this.txnType,
      this.createdAt,
      this.updatedAt});

  PatientTransactionsModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    transactionNote = json['transaction_note'];
    transactionStatus = json['transaction_status'];
    paymentRefId = json['payment_ref_id'];
    txnType = json['txn_type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['transaction_note'] = this.transactionNote;
    data['transaction_status'] = this.transactionStatus;
    data['payment_ref_id'] = this.paymentRefId;
    data['txn_type'] = this.txnType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
