import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../bloc/history_bloc.dart';
import 'note_view.dart';

class HistoryScreenContent extends StatelessWidget {
  const HistoryScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (BuildContext context, HistoryState state) {
        return AppGradientWrapper(
          gradientType: GradientBackgroundType.bottomSheetBackground,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.contentPadding16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        LocaleKeys.historyScreen_yourHistory.watchTr(context),
                        style: AppFonts.heading1.copyWith(color: context.theme.colors.primaryText),
                      ),
                      const Spacer(),
                      Text(
                        context.read<HistoryBloc>().state.date.getMonthNameAndYear(),
                        style: AppFonts.heading2.copyWith(color: context.theme.colors.primaryText),
                      ),
                      AppIcons.previousSteepArrow.call(
                        onTap: () => context.read<HistoryBloc>().add(
                              const DecreaseMonthEvent(),
                            ),
                      ),
                      AppIcons.nextSteepArrow.call(
                        onTap: () => context.read<HistoryBloc>().add(
                              const IncreaseMonthEvent(),
                            ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    itemCount: state.notes?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NoteView(
                        note: state.notes![index],
                        previousNote: state.notes?[index - 1],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
