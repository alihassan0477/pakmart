part of 'receive_leads_bloc.dart';

class ReceiveLeadsState extends Equatable {
  const ReceiveLeadsState({
    this.totalLeadsCount = 0,
    this.getApiStatus = GetApiStatus.loading,
    this.receivedLeads = const [],
  });
  final int totalLeadsCount;
  final GetApiStatus getApiStatus;
  final List<RFQ> receivedLeads;

  ReceiveLeadsState copyWith({
    int? totalLeadsCount,
    GetApiStatus? getApiStatus,
    List<RFQ>? receivedLeads,
  }) {
    return ReceiveLeadsState(
      totalLeadsCount: totalLeadsCount ?? this.totalLeadsCount,
      getApiStatus: getApiStatus ?? this.getApiStatus,
      receivedLeads: receivedLeads ?? this.receivedLeads,
    );
  }

  @override
  List<Object> get props => [totalLeadsCount, getApiStatus, receivedLeads];
}
