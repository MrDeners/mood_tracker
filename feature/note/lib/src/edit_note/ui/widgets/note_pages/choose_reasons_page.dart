import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';
import '../../../bloc/note_processor_bloc.dart';

class ChooseReasonsPage extends StatefulWidget {
  final Future<void> Function() goNext;

  const ChooseReasonsPage({
    super.key,
    required this.goNext,
  });

  @override
  State<ChooseReasonsPage> createState() => _ChooseReasonsPageState();
}

class _ChooseReasonsPageState extends State<ChooseReasonsPage> {
  final TextEditingController _searchController = TextEditingController();
  String searchRequest = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        searchRequest = _searchController.text;
      });
    });
  }

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
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.contentPadding16,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Text(
                      LocaleKeys.noteProcessing_chooseReasons.watchTr(context),
                      style: AppFonts.heading1.copyWith(
                        color: context.theme.colors.primaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: AppDimens.contentPadding16,
                    ),
                    Text(
                      LocaleKeys.noteProcessing_selectReasons.watchTr(context),
                      style: AppFonts.subText2Regular.copyWith(
                        color: context.theme.colors.primaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: AppDimens.contentPadding16,
                      ),
                    ),
                    AppSearchField(
                      controller: _searchController,
                      hintText: LocaleKeys.noteProcessing_searchReasons.watchTr(context),
                    ),
                    if (state.selectedReasonsId.isNotEmpty) ...<Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${LocaleKeys.general_selected.watchTr(context)} ${state.selectedReasonsId.length})',
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
                              context
                                  .read<NoteProcessorBloc>()
                                  .add(const ClearSelectedReasonsEvent());
                            },
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: AppDimens.contentPadding12,
                        runSpacing: AppDimens.contentPadding12,
                        children: List<Widget>.generate(
                          state.selectedReasonsId.length,
                          (int index) {
                            return AppTextElementButton(
                              text: state.reasons
                                  .firstWhere(
                                    (ReasonModel obj) => obj.id == state.selectedReasonsId[index],
                                  )
                                  .name,
                              isShort: true,
                              isActive: true,
                              onDelete: () {
                                final List<int> selectedReasonsId = state.selectedReasonsId;
                                selectedReasonsId.removeAt(index);
                                context.read<NoteProcessorBloc>().add(
                                      ChangeSelectedReasonsEvent(
                                        selectedReasonsId: selectedReasonsId,
                                      ),
                                    );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                    if (state.recentlyReasonsId.isNotEmpty) ...<Widget>[
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: AppDimens.contentPadding16,
                        ),
                      ),
                      Text(
                        LocaleKeys.general_recentlyUsed.watchTr(context),
                        style: AppFonts.subText2Regular.copyWith(
                          color: context.theme.colors.primaryText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: AppDimens.contentPadding16,
                        ),
                      ),
                      Wrap(
                        spacing: AppDimens.contentPadding12,
                        runSpacing: AppDimens.contentPadding12,
                        children: List<Widget>.generate(
                          state.recentlyReasonsId.length,
                          (int index) {
                            return AppTextElementButton(
                              text: state.reasons
                                  .firstWhere(
                                    (ReasonModel obj) => obj.id == state.recentlyReasonsId[index],
                                  )
                                  .name,
                              isActive: true,
                              onTap: () {
                                final int currentReasonId = state.recentlyReasonsId[index];
                                final List<int> selectedReasonsId = state.selectedReasonsId;
                                selectedReasonsId.contains(currentReasonId)
                                    ? selectedReasonsId.remove(currentReasonId)
                                    : selectedReasonsId.add(currentReasonId);
                                context.read<NoteProcessorBloc>().add(
                                      ChangeSelectedReasonsEvent(
                                        selectedReasonsId: selectedReasonsId,
                                      ),
                                    );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: AppDimens.contentPadding16,
                      ),
                    ),
                    Text(
                      LocaleKeys.noteProcessing_allReasons.watchTr(context),
                      style: AppFonts.subText2Regular.copyWith(
                        color: context.theme.colors.primaryText,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: AppDimens.contentPadding16,
                      ),
                    ),
                    Wrap(
                      spacing: AppDimens.contentPadding12,
                      runSpacing: AppDimens.contentPadding12,
                      children: List<Widget>.generate(
                        state.reasons.length,
                        (int index) {
                          return searchRequest == '' ||
                                  state.reasons[index].name.contains(_searchController.text)
                              ? AppTextElementButton(
                                  text: state.reasons[index].name,
                                  isActive: state.selectedReasonsId.contains(
                                    state.reasons[index].id,
                                  ),
                                  onTap: () {
                                    final int currentReasonId = state.reasons[index].id;
                                    final List<int> selectedReasonsId = List<int>.from(
                                      state.selectedReasonsId,
                                    );
                                    selectedReasonsId.contains(currentReasonId)
                                        ? selectedReasonsId.remove(currentReasonId)
                                        : selectedReasonsId.add(currentReasonId);
                                    context.read<NoteProcessorBloc>().add(
                                          ChangeSelectedReasonsEvent(
                                            selectedReasonsId: selectedReasonsId,
                                          ),
                                        );
                                  },
                                )
                              : const SizedBox.shrink();
                        },
                      ),
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
