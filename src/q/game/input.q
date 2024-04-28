system"l constants.q";
system"l game/exitGame.q";


.input.read:{[]
  input:first first system"bash -c 'read -n 1 x;echo $x'";

  $[
    input~"q";exitGame[];
    input in "ws";.input.tryMove[input~"w"];
    input in "ad";`.game.rotation set .game.rotation+$[input~"a";-1;1]*ROTATION_SPEED;
    ()
  ];
 };

.input.tryMove:{[goForward]
  dX:$[goForward;1;-1]*MOVE_SPEED*cos .game.rotation;
  dY:$[goForward;1;-1]*MOVE_SPEED*sin .game.rotation;
  
  if[not .game.grid[`long$.game.posY+dY;`long$.game.posX+dX];
    `.game.posX set .game.posX+dX;
    `.game.posY set .game.posY+dY;
  ];
 };
