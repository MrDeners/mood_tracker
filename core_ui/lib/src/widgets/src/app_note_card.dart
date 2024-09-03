import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation/navigation.dart';

class AppNoteCart extends StatefulWidget {
  final NoteModel note;
  final Function() onDelete;

  static const String tipKey = 'Tip';

  const AppNoteCart({
    super.key,
    required this.note,
    required this.onDelete,
  });

  @override
  State<AppNoteCart> createState() => _AppNoteCartState();
}

class _AppNoteCartState extends State<AppNoteCart> {
  int? commentMaxLine = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colors.whiteBackground,
        borderRadius: BorderRadius.circular(AppDimens.formBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.contentPadding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppMoodWidget(
                  mood: widget.note.todayMood,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: AppDimens.contentPadding12),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.note.todayMood.title,
                      style: AppFonts.subText1Bold.copyWith(
                        color: context.theme.colors.primaryText,
                      ),
                    ),
                    Text(
                      widget.note.dateOfCreation.getFullDateTime(),
                      style: AppFonts.subText3Regular.copyWith(
                        color: context.theme.colors.primaryText,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: context.theme.colors.primaryText.withOpacity(0.18),
                      ),
                    ),
                  ),
                  child: AppButton(
                    text: LocaleKeys.general_delete.watchTr(context),
                    textStyle: AppFonts.heading3.copyWith(color: context.theme.colors.errorRed),
                    isBackgroundless: true,
                    textColor: context.theme.colors.errorRed,
                    onTap: widget.onDelete,
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: AppButton(
                    text: LocaleKeys.general_edit.watchTr(context),
                    textStyle: AppFonts.heading3.copyWith(
                      color: context.theme.colors.accent,
                    ),
                    isBackgroundless: true,
                    onTap: navigateToEdit,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: AppDimens.contentPadding12,
              ),
            ),
            RichText(
              text: TextSpan(
                style: AppFonts.subText1Regular.copyWith(
                  color: context.theme.colors.primaryText,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: LocaleKeys.note_youFelt.watchTr(context),
                  ),
                  TextSpan(
                    text: ' ${getEmotionsString(widget.note.emotions)}',
                    style: AppFonts.subText1Bold.copyWith(
                      color: context.theme.colors.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: AppFonts.subText1Regular.copyWith(
                  color: context.theme.colors.primaryText,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: LocaleKeys.note_becauseOf.watchTr(context),
                  ),
                  TextSpan(
                    text: ' ${getReasonsString(widget.note.reasons)}',
                    style: AppFonts.subText1Bold.copyWith(
                      color: context.theme.colors.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: AppDimens.contentPadding12),
            ),
            RichText(
              maxLines: commentMaxLine,
              overflow: commentMaxLine == null ? TextOverflow.clip : TextOverflow.ellipsis,
              text: TextSpan(
                style: AppFonts.subText1Regular.copyWith(
                  color: context.theme.colors.primaryText,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: '${LocaleKeys.note_note.watchTr(context)}: ',
                    style: AppFonts.subText1Bold.copyWith(
                      color: context.theme.colors.primaryText,
                    ),
                  ),
                  TextSpan(
                    text: widget.note.comment,
                  ),
                ],
              ),
            ),
            AppButton(
              text: commentMaxLine == null
                  ? LocaleKeys.general_hide.watchTr(context)
                  : LocaleKeys.general_readMore.watchTr(context),
              textColor: context.theme.colors.accent,
              isBackgroundless: true,
              isExpanded: false,
              icon: AppIcons.plus,
              iconSize: AppDimens.veryLittleIconSize,
              onTap: () {
                setState(() {
                  (commentMaxLine == null) ? commentMaxLine = 2 : commentMaxLine = null;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: context.theme.colors.primaryText.withOpacity(0.16),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: AppDimens.contentPadding12),
            ),
            Row(
              children: <Widget>[
                Text(
                  widget.note.tip.title,
                  style: AppFonts.heading2.copyWith(
                    color: context.theme.colors.primaryText,
                  ),
                ),
                const Spacer(),
                AppIcons.bulb.call(),
                Text(
                  AppNoteCart.tipKey,
                  style: AppFonts.heading2.copyWith(
                    color: context.theme.colors.yellowTip,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: AppDimens.contentPadding8),
            ),
            Text(
              widget.note.tip.description,
              style: AppFonts.subText1Regular.copyWith(
                color: context.theme.colors.primaryText.withOpacity(0.74),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getEmotionsString(List<EmotionModel> emotions) {
    return emotions.map((EmotionModel emotion) => emotion.name).join(', ');
  }

  String getReasonsString(List<ReasonModel> reasons) {
    return reasons.map((ReasonModel reasons) => reasons.name).join(', ');
  }

  void navigateToEdit() {
    appLocator.get<AppRouter>().push(
          AddNoteRoute(
            note: widget.note,
          ),
        );
  }
}
