import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../widgets/widgets.dart';
import '../../../bloc/note_processor_bloc.dart';

class ChooseEmotionPage extends StatefulWidget {
  final Future<void> Function() goNext;

  const ChooseEmotionPage({
    super.key,
    required this.goNext,
  });

  @override
  State<ChooseEmotionPage> createState() => _ChooseEmotionPageState();
}

class _ChooseEmotionPageState extends State<ChooseEmotionPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteProcessorBloc, NoteProcessorState>(
      builder: (BuildContext context, NoteProcessorState state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.contentPadding16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Text(
                      LocaleKeys.noteProcessing_chooseEmotions.watchTr(context),
                      style: AppFonts.heading1.copyWith(color: context.theme.colors.primaryText),
                      textAlign: TextAlign.center,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: AppDimens.contentPadding16),
                    ),
                    Text(
                      LocaleKeys.noteProcessing_selectEmotions.watchTr(context),
                      style: AppFonts.subText2Regular
                          .copyWith(color: context.theme.colors.primaryText),
                      textAlign: TextAlign.center,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: AppDimens.contentPadding16),
                    ),
                    AppSearchField(
                      controller: _searchController,
                      hintText: LocaleKeys.noteProcessing_searchEmotions.watchTr(context),
                    ),
                    if (state.selectedEmotionsId.isNotEmpty) ...<Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${LocaleKeys.general_selected.watchTr(context)} '
                            '(${state.selectedEmotionsId.length})',
                            style: AppFonts.subText2Regular.copyWith(
                              color: context.theme.colors.primaryText,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          AppButton(
                            text: LocaleKeys.general_clearAll.watchTr(context),
                            isBackgroundless: true,
                            textStyle: AppFonts.subText2Regular.copyWith(
                              color: context.theme.colors.primaryText,
                            ),
                            onTap: () {
                              context.read<NoteProcessorBloc>().add(
                                    const ClearSelectedEmotionsEvent(),
                                  );
                            },
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: AppDimens.contentPadding12,
                        runSpacing: AppDimens.contentPadding12,
                        children: List<Widget>.generate(
                          state.selectedEmotionsId.length,
                          (int index) {
                            return AppTextElementButton(
                              text: state.emotions
                                  .firstWhere(
                                    (EmotionModel obj) => obj.id == state.selectedEmotionsId[index],
                                  )
                                  .name,
                              isShort: true,
                              isActive: true,
                              onDelete: () {
                                final List<int> selectedEmotionsId = state.selectedEmotionsId;
                                selectedEmotionsId.removeAt(index);
                                context.read<NoteProcessorBloc>().add(
                                      ChangeSelectedEmotionsEvent(
                                        selectedEmotionsId: selectedEmotionsId,
                                      ),
                                    );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                    const Padding(
                      padding: EdgeInsets.only(bottom: AppDimens.contentPadding16),
                    ),
                    if (state.recentlyEmotionsId
                        .isNotEmpty) ...<Widget>[
                      Text(
                        LocaleKeys.general_recentlyUsed.watchTr(context),
                        style: AppFonts.subText2Regular
                            .copyWith(color: context.theme.colors.primaryText),
                        textAlign: TextAlign.center,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          vertical: AppDimens.contentPadding12,
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemCount: state.recentlyEmotionsId.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AppIconElementButton(
                            text: state.emotions
                                .firstWhere(
                                  (EmotionModel obj) =>
                                      obj.id == state.recentlyEmotionsId[index],
                                )
                                .name,
                            icon: state.emotions
                                .firstWhere(
                                  (EmotionModel obj) =>
                                      obj.id == state.recentlyEmotionsId[index],
                                )
                                .icon,
                            isActive: true,
                            onTap: () {
                              final int currentEmotionId = state.recentlyEmotionsId[index];
                              final List<int> selectedEmotionsId = state.selectedEmotionsId;
                              selectedEmotionsId.contains(currentEmotionId)
                                  ? selectedEmotionsId.remove(currentEmotionId)
                                  : selectedEmotionsId.add(currentEmotionId);
                              context.read<NoteProcessorBloc>().add(
                                    ChangeSelectedEmotionsEvent(
                                      selectedEmotionsId: selectedEmotionsId,
                                    ),
                                  );
                            },
                          );
                        },
                      ),
                    ],
                    Text(
                      LocaleKeys.noteProcessing_allEmotions.watchTr(context),
                      style: AppFonts.subText2Regular
                          .copyWith(color: context.theme.colors.primaryText),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDimens.contentPadding12,
                      ),
                      itemCount: state.emotions.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.75,
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return _searchController.text == '' ||
                                state.emotions[index]
                                    .name
                                    .contains(_searchController.text)
                            ? AppIconElementButton(
                                text: state.emotions[index].name,
                                icon: state.emotions[index].icon,
                                isActive: state.selectedEmotionsId
                                    .contains(
                                  state.emotions[index].id,
                                ),
                                onTap: () {
                                  final int currentEmotionId = state.emotions[index].id;
                                  final List<int> selectedEmotionsId = List<int>.from(
                                    state.selectedEmotionsId,
                                  );
                                  selectedEmotionsId.contains(currentEmotionId)
                                      ? selectedEmotionsId.remove(currentEmotionId)
                                      : selectedEmotionsId.add(currentEmotionId);
                                  context.read<NoteProcessorBloc>().add(
                                        ChangeSelectedEmotionsEvent(
                                          selectedEmotionsId: selectedEmotionsId,
                                        ),
                                      );
                                },
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
              AppButton(
                text: LocaleKeys.general_continue.watchTr(context),
                onTap: () {
                  context.read<NoteProcessorBloc>().add(
                        GoNextSteepEvent(
                          goNext: widget.goNext,
                        ),
                      );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
