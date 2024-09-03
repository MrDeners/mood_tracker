import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../bloc/note_processor_bloc.dart';
import 'note_pages/note_pages.dart';

class NoteProcessingContent extends StatefulWidget {
  const NoteProcessingContent({super.key});

  @override
  State<NoteProcessingContent> createState() => _NoteProcessingContentState();
}

class _NoteProcessingContentState extends State<NoteProcessingContent> {
  final PageController _controller = PageController();
  int currentPage = 1;

  static const int amountOfPages = 4;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteProcessorBloc, NoteProcessorState>(
      builder: (BuildContext context, NoteProcessorState state) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(AppDimens.contentPadding12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppIcons.backArrow.call(
                    size: AppDimens.littleIconSize,
                    onTap: () {
                      context.read<NoteProcessorBloc>().add(
                            GoPreviousSteepEvent(
                              goBack: () => _controller.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              ),
                            ),
                          );
                    },
                  ),
                  Text(
                    '${state.currentPage}/$amountOfPages',
                    style: AppFonts.heading2.copyWith(
                      color: context.theme.colors.primaryText,
                    ),
                  ),
                  AppIcons.close.call(
                    onTap: () {
                      context.read<NoteProcessorBloc>().add(
                            const CloseEditingEvent(),
                          );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: AppDimens.processingNotePageViewPadding,
                  ),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _controller,
                      children: <Widget>[
                        MoodNowPage(
                          goNext: goNext,
                        ),
                        ChooseEmotionPage(
                          goNext: goNext,
                        ),
                        ChooseReasonsPage(
                          goNext: goNext,
                        ),
                        const CommentPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> goNext() async {
    await _controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
