import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/settings/app_settings.dart';
import '../../../../router/app_router.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/common/scaffold.dart';
import '../../../../widgets/dialog/alert_dialog.dart';
import '../../../../widgets/state/error.dart';
import '../../../authentication/data/authentication_repository.dart';
import '../../../profile/data/user_repository.dart';
import '../../../profile/view/widgets/profile_avatar_name_email.dart';
import '../../model/setting.dart';
import 'settings_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(settingsControllerProvider, (previous, next) {
      next.showError(context);
      next.showLoadingDialog(context, previous);
    });

    // TODO: Implement not log in case
    final uid = ref.watch(uidProvider)!;
    final user = ref.watch(userStreamProvider(uid));
    return LScaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              user.when(
                data: (user) => ProfileAvatarNameEmail(user: user),
                error: (error, stackTrace) => const ErrorState(),
                loading: () => const ProfileAvatarNameEmail(isLoading: true),
              ),
              Gaps.h32,
              ...List.generate(
                AppSettings.settingList.length,
                (index) => SettingSection(
                  settingSection: AppSettings.settingList[index],
                ),
              ),
              Gaps.h20,
              TextButton(
                onPressed: () async {
                  final isConfirmed = await showAlertDialog(
                    context: context,
                    title: 'Sign Out',
                    content: 'Sign out from LingoOwl?',
                    defaultActionText: 'Sign Out',
                    cancelActionText: 'Cancel',
                  );

                  if (isConfirmed ?? false) {
                    ref
                        .read(settingsControllerProvider.notifier)
                        .signOut()
                        .then((isSuccess) {
                      if (isSuccess) {
                        context.goNamed(LRoute.welcome.name);
                      }
                    });
                  }
                },
                child: const Text('Sign out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
    required this.settingSection,
  });

  final LSettingSection settingSection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: UiParameters.screenPadding,
          child: Text(
            settingSection.sectionName,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        ...List.generate(
          settingSection.options.length,
          (index) {
            final option = settingSection.options[index];
            return ListTile(
              contentPadding: UiParameters.screenPadding,
              onTap: () => context.pushNamed(option.route.name),
              title: Text(option.name),
              trailing: const Icon(Icons.arrow_forward_ios),
            );
          },
        ),
        Gaps.h24,
      ],
    );
  }
}