import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_do_an/blocs/custommer/customer_bloc.dart';
import 'package:mod_do_an/blocs/custommer/customer_event.dart';
import 'package:mod_do_an/blocs/custommer/customer_state.dart';

import 'package:mod_do_an/component/card/card_common.dart';
import 'package:mod_do_an/component/styles/appbar.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/models/stateModel.dart';
import 'package:mod_do_an/models/user/user.dart';
import 'package:mod_do_an/repositories/customer_repository.dart';
import 'package:mod_do_an/services/toast.service.dart';
import 'package:mod_do_an/storage/secure_storge.dart';
import 'package:mod_do_an/utils/dialog_helper.dart';
import 'package:mod_do_an/utils/loading_helper.dart';

class ChangeUserScreen extends StatefulWidget {
  const ChangeUserScreen({Key? key}) : super(key: key);

  @override
  State<ChangeUserScreen> createState() => _ChangeUserScreenState();
}

class _ChangeUserScreenState extends State<ChangeUserScreen> {
  CustomerRepository customerRepository = new CustomerRepository();
  int hoverIndex = -1;
  List<ProfileUser> listUser = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CustomerBloc>(context).add(GetUserOtherEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStyle("Danh sách người dùng"),
      body: BlocListener<CustomerBloc, CustomerState>(
        listener: (context, state) {
          if (state is CustomerLoadingState) {
            LoadingHelper.showLoading(context);
          }
          if (state is GetUserOtherSuccess) {
            LoadingHelper.hideLoading(context);
            setState(() {
              listUser = state.listUser;
            });
          }
          if (state is GetUserOtherFail) {
            LoadingHelper.hideLoading(context);
            ToastService.showToast(
                msg: state.message,
                backgroundColor: AppColors.errorBackgroundColor);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: listUser.length > 0
              ? GridView.builder(
                  itemCount: listUser.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 16 / 4,
                      crossAxisCount: 1,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.amber,
                      child: InkWell(
                          onTapDown: (e) {
                            setState(() {
                              hoverIndex = index;
                            });
                          },
                          onTapUp: (e) {
                            setState(() {
                              hoverIndex = -1;
                            });
                          },
                          onTap: () async {
                            final a = await DialogHelper.showSelectDialog(
                                context: context,
                                items: [
                                  new StateModel(
                                      name: listUser[index].firstName +
                                          " " +
                                          listUser[index].lastName,
                                      code: "code")
                                ],
                                title: "Chuyển người dùng ?",
                                itemSelected:
                                    new StateModel(name: "true", code: "code"));
                            await SecureStorage()
                                .saveCustomer(user: listUser[index]);
                            Navigator.pop(context);
                            ToastService.showToast(msg: "Thành công");
                          },
                          child: CardCommon(
                            colorC: Colors.black,
                            heading: listUser[index].firstName +
                                " " +
                                listUser[index].lastName,
                            backgroudC:
                                hoverIndex == index ? Colors.amber : null,
                            subHeading: listUser[index].gender,
                          )),
                    );
                  })
              : Container(),
        ),
      ),
    );
  }
}
