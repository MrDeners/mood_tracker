import 'package:domain/domain.dart';

class DbMapper {
  static const String uidKey = 'uid';
  static const String moodTypeKey = 'moodType';
  static const String emotionsKey = 'emotions';
  static const String reasonsKey = 'reasons';
  static const String commentKey = 'comment';
  static const String tipKey = 'tip';
  static const String titleKey = 'title';
  static const String descriptionKey = 'description';
  static const String dateOfCreationKey = 'dateOfCreation';

  static Map<String, dynamic> noteToMap(NoteModel note) {
    return <String, dynamic>{
      uidKey: note.uid,
      moodTypeKey: note.todayMood.index,
      emotionsKey: note.emotions.map((EmotionModel emotion) => emotion.id).toList(),
      reasonsKey: note.reasons.map((ReasonModel reason) => reason.id).toList(),
      commentKey: note.comment,
      tipKey: <String, String>{titleKey: note.tip.title, descriptionKey: note.tip.description},
      dateOfCreationKey: note.dateOfCreation,
    };
  }

  static Map<String, dynamic> noteToMap(NoteModel note) {
    return <String, dynamic>{
      uidKey: note.uid,
      moodTypeKey: note.todayMood.index,
      emotionsKey: note.emotions.map((EmotionModel emotion) => emotion.id).toList(),
      reasonsKey: note.reasons.map((ReasonModel reason) => reason.id).toList(),
      commentKey: note.comment,
      tipKey: <String, String>{titleKey: note.tip.title, descriptionKey: note.tip.description},
      dateOfCreationKey: note.dateOfCreation,
    };
  }
}
