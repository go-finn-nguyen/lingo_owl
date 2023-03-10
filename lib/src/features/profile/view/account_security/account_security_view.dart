import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../utils/async_value_ui.dart';
import '../widgets/profile_view_header.dart';
import 'change_password_controller.dart';
import 'change_password_form.dart';

class AccountSecurityView extends ConsumerWidget {
  const AccountSecurityView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(changePasswordControllerProvider,
        (previous, next) {
      next.showErrorLoadingSuccessState(
        context,
        previousState: previous,
        successMessage: 'Your password has been changed!',
      );
    });
    return Column(
      children: [
        Table(
          border: UiParameters.tableBorder,
          children: [
            const TableRow(
              children: [
                ProfileViewHeader(
                  title: 'Account',
                  subTitle:
                      'Edit your account settings and change your password here.',
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: UiParameters.rowContentPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ChangePasswordForm(),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        Gaps.h32,
      ],
    );
  }
}
