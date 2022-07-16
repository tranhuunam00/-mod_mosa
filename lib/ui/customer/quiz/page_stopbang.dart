import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/custommer/customer_bloc.dart';
import 'package:mod_do_an/blocs/custommer/customer_event.dart';
import 'package:mod_do_an/blocs/custommer/customer_state.dart';
import 'package:mod_do_an/component/styles/appbar.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/repositories/customer_repository.dart';
import 'package:mod_do_an/services/toast.service.dart';
import 'package:mod_do_an/ui/components/button/inkwell_custom.dart';
import 'package:mod_do_an/ui/components/table/table_pageStopbang.dart';
import 'package:mod_do_an/ui/customer/quiz/quiz_screen.dart';
import 'package:mod_do_an/utils/loading_helper.dart';

class PageStopbangScreen extends StatefulWidget {
  const PageStopbangScreen({Key? key}) : super(key: key);

  static CustomerRepository customerRepository = CustomerRepository();
  static CustomerBloc customerBloc =
      CustomerBloc(customerRepository: customerRepository);

  @override
  State<PageStopbangScreen> createState() => _PageStopbangScreenState();
}

class _PageStopbangScreenState extends State<PageStopbangScreen> {
  @override
  void initState() {
    super.initState();
    PageStopbangScreen.customerBloc..add(GetStopBangEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarStyle("Tổng hợp câu trả lời "),
        body: BlocListener<CustomerBloc, CustomerState>(
          listener: (context, state) {
            if (state is CustomerLoadingState) {
              print("loadding");
              LoadingHelper.showLoading(context);
            }
            if (state is GetStopbangSuccess) {
              LoadingHelper.hideLoading(context);
            }
            if (state is GetStopbangFail) {
              LoadingHelper.hideLoading(context);
              ToastService.showToast(
                  msg: state.message,
                  backgroundColor: AppColors.errorBackgroundColor);
            }
          },
          child: SingleChildScrollView(
            child: Column(children: [
              TableStopbangAll(),
              InkwellStyle(
                label: "Trả lời mới",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                },
                width: 200,
              )
            ]),
          ),
        ));
  }
}
