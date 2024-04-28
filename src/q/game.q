system"l constants.q";
system"l utility.q";
system"l game/draw.q";
system"l game/input.q";


.game.grid:(
  1 1 1 1 1 1 1;
  1 0 0 0 0 0 1;
  1 0 1 0 1 0 1;
  1 0 0 0 0 0 1;
  1 0 1 0 1 0 1;
  1 0 0 0 1 0 1;
  1 0 0 0 1 0 1;
  1 0 1 0 0 0 1;
  1 0 1 1 1 0 1;
  1 0 0 0 0 0 1;
  1 1 1 1 1 1 1
 );

.game.posX:1;
.game.posY:1;
.game.rotation:45*DEG_TO_RAD;

.game.playing:1b;


.game.startGame:{[]
  -1"\033[48;5;16m";
  draw[];
  .game.gameLoop[];
 };

.game.gameLoop:{[]
  while[.game.playing;
    .input.read[];
    draw[];
  ];
 };
