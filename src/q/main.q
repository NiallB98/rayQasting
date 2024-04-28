system"l debug.q";
system"l game.q";


main:{[]
  .game.startGame[];
 };


if[not DEBUG_NO_AUTO_START;main[]];
