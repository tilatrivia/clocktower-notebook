import 'package:flutter/material.dart';

enum Characters {
  good,
  evil,
  washerwoman,
  librarian,
  investigator,
  chef,
  empath,
  fortuneTeller,
  undertaker,
  monk,
  ravenkeeper,
  virgin,
  slayer,
  soldier,
  mayor,
  butler,
  drunk,
  recluse,
  saint,
  poisoner,
  spy,
  scarlettWoman,
  baron,
  imp,
  clockmaker,
  dreamer,
  snakeCharmer,
  mathematician,
  flowerGirl,
  townCrier,
  oracle,
  savant,
  seamstress,
  philosopher,
  artist,
  juggler,
  sage,
  mutant,
  sweetheart,
  barber,
  klutz,
  evilTwin,
  witch,
  cerenovus,
  pitHag,
  fangGu,
  vigimortis,
  noDashii,
  vortox,
  grandmother,
  sailor,
  chambermaid,
  exorcist,
  innkeeper,
  gambler,
  gossip,
  courtier,
  professor,
  minstrel,
  teaLady,
  pacifist,
  fool,
  goon,
  lunatic,
  tinker,
  moonchild,
  godfather,
  devilsAdvocate,
  assassin,
  mastermind,
  zombuul,
  pukka,
  shabaloth,
  po
}

extension CharactersExt on Characters {
  IconData get icon {
    switch (this) {
      case Characters.good: return Icons.thumb_up_outlined;
      case Characters.evil: return Icons.thumb_down_outlined;
      case Characters.washerwoman: return Icons.local_laundry_service_outlined;
      case Characters.librarian: return Icons.library_books_outlined;
      case Characters.investigator: return Icons.search_outlined;
      case Characters.chef: return Icons.cookie_outlined;
      case Characters.empath: return Icons.favorite_outline;
      case Characters.fortuneTeller: return Icons.psychology_outlined;
      case Characters.undertaker: return Icons.cottage_outlined;
      case Characters.monk: return Icons.church_outlined;
      case Characters.ravenkeeper: return Icons.park_outlined;
      case Characters.virgin: return Icons.circle_outlined;
      case Characters.slayer: return Icons.north_east_outlined;
      case Characters.soldier: return Icons.security_outlined;
      case Characters.mayor: return Icons.account_balance_outlined;
      case Characters.butler: return Icons.supervised_user_circle_outlined;
      case Characters.drunk: return Icons.sports_bar_outlined;
      case Characters.recluse: return Icons.lightbulb_outline;
      case Characters.saint: return Icons.auto_awesome_outlined;
      case Characters.poisoner: return Icons.science_outlined;
      case Characters.spy: return Icons.visibility_outlined;
      case Characters.baron: return Icons.school_outlined;
      case Characters.scarlettWoman: return Icons.woman_outlined;
      case Characters.imp: return Icons.call_split_outlined;
      case Characters.clockmaker: return Icons.school_outlined;
      case Characters.dreamer: return Icons.hourglass_empty_outlined;
      case Characters.snakeCharmer: return Icons.polymer_outlined;
      case Characters.mathematician: return Icons.calculate_outlined;
      case Characters.flowerGirl: return Icons.local_florist_outlined;
      case Characters.townCrier: return Icons.notifications_outlined;
      case Characters.oracle: return Icons.visibility;
      case Characters.savant: return Icons.accessible_outlined;
      case Characters.seamstress: return Icons.content_cut_outlined;
      case Characters.philosopher: return Icons.smoking_rooms_outlined;
      case Characters.artist: return Icons.brush_outlined;
      case Characters.juggler: return Icons.scatter_plot_outlined;
      case Characters.sage: return Icons.cake_outlined;
      case Characters.mutant: return Icons.festival_outlined;
      case Characters.sweetheart: return Icons.volunteer_activism_outlined;
      case Characters.barber: return Icons.storefront_outlined;
      case Characters.klutz: return Icons.personal_injury_outlined;
      case Characters.evilTwin: return Icons.people_outline;
      case Characters.witch: return Icons.change_history_outlined;
      case Characters.cerenovus: return Icons.disabled_visible_outlined;
      case Characters.pitHag: return Icons.emoji_events_outlined;
      case Characters.fangGu: return Icons.swap_calls_outlined;
      case Characters.vigimortis: return Icons.vpn_key_outlined;
      case Characters.noDashii: return Icons.vaccines_outlined;
      case Characters.vortox: return Icons.tornado_outlined;
      case Characters.grandmother: return Icons.question_mark_outlined;
      case Characters.sailor: return Icons.question_mark_outlined;
      case Characters.chambermaid: return Icons.question_mark_outlined;
      case Characters.exorcist: return Icons.question_mark_outlined;
      case Characters.innkeeper: return Icons.question_mark_outlined;
      case Characters.gambler: return Icons.question_mark_outlined;
      case Characters.gossip: return Icons.question_mark_outlined;
      case Characters.courtier: return Icons.question_mark_outlined;
      case Characters.professor: return Icons.question_mark_outlined;
      case Characters.minstrel: return Icons.question_mark_outlined;
      case Characters.teaLady: return Icons.question_mark_outlined;
      case Characters.pacifist: return Icons.question_mark_outlined;
      case Characters.fool: return Icons.question_mark_outlined;
      case Characters.goon: return Icons.question_mark_outlined;
      case Characters.lunatic: return Icons.question_mark_outlined;
      case Characters.tinker: return Icons.question_mark_outlined;
      case Characters.moonchild: return Icons.question_mark_outlined;
      case Characters.godfather: return Icons.question_mark_outlined;
      case Characters.devilsAdvocate: return Icons.question_mark_outlined;
      case Characters.assassin: return Icons.question_mark_outlined;
      case Characters.mastermind: return Icons.question_mark_outlined;
      case Characters.zombuul: return Icons.question_mark_outlined;
      case Characters.pukka: return Icons.question_mark_outlined;
      case Characters.shabaloth: return Icons.question_mark_outlined;
      case Characters.po: return Icons.question_mark_outlined;
    }
  }
}