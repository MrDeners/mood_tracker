import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../bloc/note_processor_bloc.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({
    super.key,
  });

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.contentPadding16),
      child: Column(
        children: <Widget>[
          Text(
            LocaleKeys.noteProcessing_addComment.watchTr(context),
            style: AppFonts.heading1.copyWith(color: context.theme.colors.primaryText),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppDimens.contentPadding16,
          ),
          Text(
            LocaleKeys.noteProcessing_selectComment.watchTr(context),
            style: AppFonts.subText2Regular.copyWith(color: context.theme.colors.primaryText),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppDimens.contentPadding16,
          ),
          AppInputField(
            controller: _commentController,
            maxLines: 10,
            textAlign: TextAlign.start,
            maxLength: 500,
          ),
          const Spacer(),
          AppButton(
            text: LocaleKeys.general_save.watchTr(context),
            onTap: () {
              context.read<NoteProcessorBloc>().add(
                    SaveNoteEvent(comment: _commentController.text),
                  );
            },
          ),
          AppButton(
            text: LocaleKeys.noteProcessing_skipAndSave.watchTr(context),
            textColor: context.theme.colors.accent,
            isBackgroundless: true,
            onTap: () {
              context.read<NoteProcessorBloc>().add(
                    SaveNoteEvent(comment: _commentController.text),
                  );
            },
          ),
        ],
      ),
    );
  }
}
