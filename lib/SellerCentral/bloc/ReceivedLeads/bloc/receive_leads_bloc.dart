import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pakmart/Model/RFQModel.dart';
import 'package:pakmart/SellerCentral/repository/received_leads.dart/receive_leads_repo.dart';
import 'package:pakmart/SellerCentral/utils/enums.dart';

part 'receive_leads_event.dart';
part 'receive_leads_state.dart';

class ReceiveLeadsBloc extends Bloc<ReceiveLeadsEvent, ReceiveLeadsState> {
  ReceiveLeadsRepository receiveLeadsRepository;
  ReceiveLeadsBloc(this.receiveLeadsRepository)
    : super(const ReceiveLeadsState()) {
    on<FetchReceivedLeadsEvent>(_fetchReceivedLeadsEvent);
  }

  void _fetchReceivedLeadsEvent(
    FetchReceivedLeadsEvent event,
    Emitter<ReceiveLeadsState> emit,
  ) async {
    emit(state.copyWith(getApiStatus: GetApiStatus.loading));

    await receiveLeadsRepository
        .fetchReceivedLeads()
        .then((List<RFQ> leads) {
          emit(
            state.copyWith(
              totalLeadsCount: leads.length,
              getApiStatus: GetApiStatus.completed,
              receivedLeads: leads,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(getApiStatus: GetApiStatus.error));
        });
  }
}
