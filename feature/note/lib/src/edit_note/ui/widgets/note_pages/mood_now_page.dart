import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../bloc/note_processor_bloc.dart';
import '../painters/mood_now_choice_painter.dart';

class MoodNowPage extends StatelessWidget {
  final Future<void> Function() goNext;

  const MoodNowPage({
    super.key,
    required this.goNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.contentPadding16,
          ),
          child: Column(
            children: <Widget>[
              Text(
                LocaleKeys.noteProcessing_moodNow.watchTr(context),
                style: AppFonts.heading1.copyWith(color: context.theme.colors.primaryText),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimens.contentPadding16),
              Text(
                LocaleKeys.noteProcessing_selectMood.watchTr(context),
                style: AppFonts.subText2Regular.copyWith(color: context.theme.colors.primaryText),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: AppDimens.contentPadding16,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: AppDimens.noteProcessingSelectorPadding),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              const Spacer(),
              SizedBox(
                height: 200,
                child: Stack(
                  children: <Widget>[
                    CustomPaint(
                      size: const Size(double.infinity, 200),
                      painter: MoodNowChoicePainter(
                        context: context,
                        selectedFigure: context.read<NoteProcessorBloc>().state.todayMood,
                      ),
                    ),
                    SizedBox(
                      height: double.infinity,
                      child: Row(
                        children: <Widget>[
                          const Spacer(flex: 100),
                          AppImages.poutingFace.callSquare(
                            size: context.read<NoteProcessorBloc>().state.todayMood ==
                                    MoodType.theWorstMood
                                ? AppDimens.bigIconSize
                                : AppDimens.mediumIconSize,
                            onTap: () {
                              context.read<NoteProcessorBloc>().add(
                                    const ChangeTodayMoodEvent(
                                      todayMood: MoodType.theWorstMood,
                                    ),
                                  );
                            },
                          ),
                          const Spacer(flex: 120),
                          AppImages.sadFace.callSquare(
                            size: context.read<NoteProcessorBloc>().state.todayMood ==
                                    MoodType.badMood
                                ? AppDimens.bigIconSize
                                : AppDimens.mediumIconSize,
                            onTap: () {
                              context.read<NoteProcessorBloc>().add(
                                    const ChangeTodayMoodEvent(
                                      todayMood: MoodType.badMood,
                                    ),
                                  );
                            },
                          ),
                          const Spacer(flex: 120),
                          AppImages.neutralFace.callSquare(
                            size: context.read<NoteProcessorBloc>().state.todayMood ==
                                    MoodType.normalMood
                                ? AppDimens.bigIconSize
                                : AppDimens.mediumIconSize,
                            onTap: () {
                              context.read<NoteProcessorBloc>().add(
                                    const ChangeTodayMoodEvent(
                                      todayMood: MoodType.normalMood,
                                    ),
                                  );
                            },
                          ),
                          const Spacer(flex: 120),
                          AppImages.happyFace.callSquare(
                            size: context.read<NoteProcessorBloc>().state.todayMood ==
                                    MoodType.goodMood
                                ? AppDimens.bigIconSize
                                : AppDimens.mediumIconSize,
                            onTap: () {
                              context.read<NoteProcessorBloc>().add(
                                    const ChangeTodayMoodEvent(
                                      todayMood: MoodType.goodMood,
                                    ),
                                  );
                            },
                          ),
                          const Spacer(flex: 120),
                          AppImages.lovedFace.callSquare(
                            size: context.read<NoteProcessorBloc>().state.todayMood ==
                                    MoodType.theBestMood
                                ? AppDimens.bigIconSize
                                : AppDimens.mediumIconSize,
                            onTap: () {
                              context.read<NoteProcessorBloc>().add(
                                    const ChangeTodayMoodEvent(
                                      todayMood: MoodType.theBestMood,
                                    ),
                                  );
                            },
                          ),
                          const Spacer(flex: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: AppDimens.noteProcessingSelectorPadding),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.contentPadding16,
          ),
          child: AppButton(
            text: LocaleKeys.general_continue.watchTr(context),
            onTap: () {
              context.read<NoteProcessorBloc>().add(
                    GoNextSteepEvent(
                      goNext: goNext,
                    ),
                  );
            },
          ),
        ),
      ],
    );
  }
}
