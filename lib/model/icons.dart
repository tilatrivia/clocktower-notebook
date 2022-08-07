import 'package:flutter/material.dart';

enum ClocktowerColors {
  alignmentGood,
  alignmentEvil,
  scriptTroubleBrewing,
  scriptSectsAndViolets,
  scriptBadMoonRising,
  scriptCustom
}

extension ClocktowerColorsExt on ClocktowerColors {
  Color get data {
    switch (this) {
      case ClocktowerColors.alignmentGood: return Colors.blue;
      case ClocktowerColors.alignmentEvil: return Colors.red;
      case ClocktowerColors.scriptTroubleBrewing: return Colors.red.shade900;
      case ClocktowerColors.scriptSectsAndViolets: return Colors.purple.shade900;
      case ClocktowerColors.scriptBadMoonRising: return Colors.yellow.shade900;
      case ClocktowerColors.scriptCustom: return Colors.blue.shade900;
    }
  }

}

enum ClocktowerIcons {
  alignmentGood,
  alignmentEvil,
  scriptTroubleBrewing,
  scriptSectsAndViolets,
  scriptBadMoodRising,
  characterWasherwoman,
  characterLibrarian,
  characterInvestigator,
  characterChef,
  characterEmpath,
  characterFortuneTeller,
  characterUndertaker,
  characterMonk,
  characterRavenkeeper,
  characterVirgin,
  characterSlayer,
  characterSoldier,
  characterMayor,
  characterButler,
  characterDrunk,
  characterRecluse,
  characterSaint,
  characterPoisoner,
  characterSpy,
  characterScarlettWoman,
  characterBaron,
  characterImp,
  characterClockmaker,
  characterDreamer,
  characterSnakeCharmer,
  characterMathematician,
  characterFlowergirl,
  characterTownCrier,
  characterOracle,
  characterSavant,
  characterSeamstress,
  characterPhilosopher,
  characterArtist,
  characterJuggler,
  characterSage,
  characterMutant,
  characterSweetheart,
  characterBarber,
  characterKlutz,
  characterEvilTwin,
  characterWitch,
  characterCerenovus,
  characterPitHag,
  characterFangGu,
  characterVigormortis,
  characterNoDashii,
  characterVortox,
  characterGrandmother,
  characterSailor,
  characterChambermaid,
  characterExorcist,
  characterInnkeeper,
  characterGambler,
  characterGossip,
  characterCourtier,
  characterProfessor,
  characterMinstrel,
  characterTeaLady,
  characterPacifist,
  characterFool,
  characterGoon,
  characterLunatic,
  characterTinker,
  characterMoonchild,
  characterGodfather,
  characterDevilsAdvocate,
  characterAssassin,
  characterMastermind,
  characterZombuul,
  characterPukka,
  characterShabaloth,
  characterPo
}

extension CharactersExt on ClocktowerIcons {
  IconData get data {
    switch (this) {
      case ClocktowerIcons.alignmentGood: return Icons.thumb_up_outlined;
      case ClocktowerIcons.alignmentEvil: return Icons.thumb_down_outlined;
      case ClocktowerIcons.scriptTroubleBrewing: return Icons.water_drop_outlined;
      case ClocktowerIcons.scriptSectsAndViolets: return Icons.local_florist_outlined;
      case ClocktowerIcons.scriptBadMoodRising: return Icons.mode_night_outlined;
      case ClocktowerIcons.characterWasherwoman: return Icons.local_laundry_service_outlined;
      case ClocktowerIcons.characterLibrarian: return Icons.library_books_outlined;
      case ClocktowerIcons.characterInvestigator: return Icons.search_outlined;
      case ClocktowerIcons.characterChef: return Icons.cookie_outlined;
      case ClocktowerIcons.characterEmpath: return Icons.favorite_outline;
      case ClocktowerIcons.characterFortuneTeller: return Icons.psychology_outlined;
      case ClocktowerIcons.characterUndertaker: return Icons.cottage_outlined;
      case ClocktowerIcons.characterMonk: return Icons.church_outlined;
      case ClocktowerIcons.characterRavenkeeper: return Icons.park_outlined;
      case ClocktowerIcons.characterVirgin: return Icons.circle_outlined;
      case ClocktowerIcons.characterSlayer: return Icons.north_east_outlined;
      case ClocktowerIcons.characterSoldier: return Icons.security_outlined;
      case ClocktowerIcons.characterMayor: return Icons.account_balance_outlined;
      case ClocktowerIcons.characterButler: return Icons.supervisor_account_outlined;
      case ClocktowerIcons.characterDrunk: return Icons.sports_bar_outlined;
      case ClocktowerIcons.characterRecluse: return Icons.lightbulb_outline;
      case ClocktowerIcons.characterSaint: return Icons.auto_awesome_outlined;
      case ClocktowerIcons.characterPoisoner: return Icons.science_outlined;
      case ClocktowerIcons.characterSpy: return Icons.visibility_outlined;
      case ClocktowerIcons.characterScarlettWoman: return Icons.woman_outlined;
      case ClocktowerIcons.characterBaron: return Icons.school_outlined;
      case ClocktowerIcons.characterImp: return Icons.call_split_outlined;
      case ClocktowerIcons.characterClockmaker: return Icons.schedule_outlined;
      case ClocktowerIcons.characterDreamer: return Icons.hourglass_empty_outlined;
      case ClocktowerIcons.characterSnakeCharmer: return Icons.polymer_outlined;
      case ClocktowerIcons.characterMathematician: return Icons.calculate_outlined;
      case ClocktowerIcons.characterFlowergirl: return Icons.local_florist_outlined;
      case ClocktowerIcons.characterTownCrier: return Icons.notifications_outlined;
      case ClocktowerIcons.characterOracle: return Icons.visibility;
      case ClocktowerIcons.characterSavant: return Icons.accessible_outlined;
      case ClocktowerIcons.characterSeamstress: return Icons.content_cut_outlined;
      case ClocktowerIcons.characterPhilosopher: return Icons.smoking_rooms_outlined;
      case ClocktowerIcons.characterArtist: return Icons.brush_outlined;
      case ClocktowerIcons.characterJuggler: return Icons.scatter_plot_outlined;
      case ClocktowerIcons.characterSage: return Icons.cake_outlined;
      case ClocktowerIcons.characterMutant: return Icons.festival_outlined;
      case ClocktowerIcons.characterSweetheart: return Icons.volunteer_activism_outlined;
      case ClocktowerIcons.characterBarber: return Icons.storefront_outlined;
      case ClocktowerIcons.characterKlutz: return Icons.personal_injury_outlined;
      case ClocktowerIcons.characterEvilTwin: return Icons.people_outline;
      case ClocktowerIcons.characterWitch: return Icons.change_history_outlined;
      case ClocktowerIcons.characterCerenovus: return Icons.disabled_visible_outlined;
      case ClocktowerIcons.characterPitHag: return Icons.emoji_events_outlined;
      case ClocktowerIcons.characterFangGu: return Icons.swap_calls_outlined;
      case ClocktowerIcons.characterVigormortis: return Icons.vpn_key_outlined;
      case ClocktowerIcons.characterNoDashii: return Icons.vaccines_outlined;
      case ClocktowerIcons.characterVortox: return Icons.tornado_outlined;
      case ClocktowerIcons.characterGrandmother: return Icons.face_unlock_outlined;
      case ClocktowerIcons.characterSailor: return Icons.anchor_outlined;
      case ClocktowerIcons.characterChambermaid: return Icons.cleaning_services_outlined;
      case ClocktowerIcons.characterExorcist: return Icons.work_outline_outlined;
      case ClocktowerIcons.characterInnkeeper: return Icons.home_outlined;
      case ClocktowerIcons.characterGambler: return Icons.casino_outlined;
      case ClocktowerIcons.characterGossip: return Icons.feedback_outlined;
      case ClocktowerIcons.characterCourtier: return Icons.local_bar;
      case ClocktowerIcons.characterProfessor: return Icons.history_edu_outlined;
      case ClocktowerIcons.characterMinstrel: return Icons.theater_comedy_outlined;
      case ClocktowerIcons.characterTeaLady: return Icons.coffee_outlined;
      case ClocktowerIcons.characterPacifist: return Icons.public;
      case ClocktowerIcons.characterFool: return Icons.report_outlined;
      case ClocktowerIcons.characterGoon: return Icons.follow_the_signs_outlined;
      case ClocktowerIcons.characterLunatic: return Icons.storm_outlined;
      case ClocktowerIcons.characterTinker: return Icons.build_outlined;
      case ClocktowerIcons.characterMoonchild: return Icons.dark_mode_outlined;
      case ClocktowerIcons.characterGodfather: return Icons.spa_outlined;
      case ClocktowerIcons.characterDevilsAdvocate: return Icons.balance_outlined;
      case ClocktowerIcons.characterAssassin: return Icons.carpenter_outlined;
      case ClocktowerIcons.characterMastermind: return Icons.chair_outlined;
      case ClocktowerIcons.characterZombuul: return Icons.wash_outlined;
      case ClocktowerIcons.characterPukka: return Icons.sick_outlined;
      case ClocktowerIcons.characterShabaloth: return Icons.restaurant_menu_outlined;
      case ClocktowerIcons.characterPo: return Icons.more_outlined;
      default: return Icons.question_mark_outlined;
    }
  }
}