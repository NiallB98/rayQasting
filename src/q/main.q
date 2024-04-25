system"l constants.q";
system"l colour.q";
system"l raycast.q";

DEBUG_NO_CLS:0b;

CHAR_HEIGHT:30;
CHAR_WIDTH:80;

WALL_CHAR:"@";

FOV:60;

posX:1;
posY:1;

rotation:45*DEG_TO_RAD;

rotationSpeed:15*DEG_TO_RAD;
moveSpeed:0.1;

grid:(
  1 1 1 1 1;
  1 0 0 0 1;
  1 0 1 0 1;
  1 0 0 0 1;
  1 0 1 0 1;
  1 0 0 0 1;
  1 0 0 1 1;
  1 0 1 1 1;
  1 1 1 1 1
 );

playing:1b;

yxList:flip cross[til CHAR_HEIGHT;til CHAR_WIDTH]

DISTANCE_CHAR_MAP:([]
  distance:-1,0.1+0.15*til count GREYSCALE_CODES;
  formattedChar:enlist[enlist" "],colour256'[;WALL_CHAR]each reverse GREYSCALE_CODES
 );

resetFrameData:{[]
  `frameData set (
    [
      x:last yxList;
      y:first yxList
    ]
    distance:#[CHAR_WIDTH*CHAR_HEIGHT;`float$-100]
  );
 };

draw:{[frameData]
  frameData:aj[`distance;frameData;DISTANCE_CHAR_MAP];

  frameData:frameData uj (
    [
      x:CHAR_HEIGHT#CHAR_WIDTH;
      y:til CHAR_HEIGHT
    ]
    distance:CHAR_HEIGHT#`float$-1;
    formattedChar:(-1 _ CHAR_HEIGHT#enlist "\n"),enlist " "
  );

  lvl:.utility.centreLvl raze exec formattedChar from `y`x xasc frameData;

  .utility.cls[];
  -1 lvl;
 };

readInput:{[]
  input:first first system"bash -c 'read -n 1 x;echo $x'";

  $[
    input~"q";exit 0;
    input in "ws";tryMove[input~"w"];
    input in "ad";`rotation set rotation+$[input~"a";-1;1]*rotationSpeed;
    ()
  ];
 };

tryMove:{[goForward]
  dX:$[goForward;1;-1]*moveSpeed*cos rotation;
  dY:$[goForward;1;-1]*moveSpeed*sin rotation;
  
  if[not grid[`long$posY+dY;`long$posX+dX];
    `posX set posX+dX;
    `posY set posY+dY;
  ];
 };

-1"\033[48;5;16m";  // Setting background colour to black

while[playing;
  resetFrameData[];
  raycast[];
  draw frameData;
  .Q.gc[];
  1 .utility.centreLvl"Quit [Q], Forward/Back/Left/Right [W/S/A/D] > ";
  readInput[];
 ];
