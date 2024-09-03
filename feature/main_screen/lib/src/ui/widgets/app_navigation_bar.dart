import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../../bloc/main_screen_bloc.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (BuildContext context, MainScreenState state) {
        return BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: context.theme.colors.yellowTip),
          selectedItemColor: context.theme.colors.blackBackground,
          unselectedItemColor: context.theme.colors.blackBackground.withOpacity(0.54),
          selectedLabelStyle: AppFonts.heading3,
          unselectedLabelStyle: AppFonts.heading3,
          currentIndex: context.read<MainScreenBloc>().state.currentPageIndex,
          onTap: (int index) {
            index == 2
                ? showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    context: context,
                    clipBehavior: Clip.hardEdge,
                    builder: (BuildContext context) => const NoteProcessingScreen(),
                  )
                : context.read<MainScreenBloc>().add(
                      ChangeCurrentPageEvent(currentPageIndex: index),
                    );
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: AppIcons.home.call(
                size: AppDimens.navigationBarIconSize,
              ),
              label: LocaleKeys.navigationBar_home.watchTr(context),
            ),
            BottomNavigationBarItem(
              icon: AppIcons.stats.call(
                size: AppDimens.navigationBarIconSize,
              ),
              label: LocaleKeys.navigationBar_stats.watchTr(context),
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: AppDimens.veryBigIconSize,
                height: AppDimens.veryBigIconSize,
                decoration: BoxDecoration(
                  color: context.theme.colors.accent,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: context.theme.colors.blackBackground.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: FittedBox(
                  fit: BoxFit.none,
                  child: AppIcons.plus.call(
                    size: AppDimens.navigationBarIconSize,
                    color: context.theme.colors.whiteBackground,
                  ),
                ),
              ),
              label: LocaleKeys.navigationBar_addMood.watchTr(context),
            ),
            BottomNavigationBarItem(
              icon: AppIcons.note.call(
                size: AppDimens.navigationBarIconSize,
              ),
              label: LocaleKeys.navigationBar_history.watchTr(context),
            ),
            BottomNavigationBarItem(
              icon: AppIcons.settings.call(
                size: AppDimens.navigationBarIconSize,
              ),
              label: LocaleKeys.navigationBar_setting.watchTr(context),
            ),
          ],
        );
      },
    );
  }
}
