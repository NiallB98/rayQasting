system"l colour.q";

CHAR_HEIGHT:20;
CHAR_WIDTH:60;

CHARS:" @#%+*.` ";

FOV:60;

yxList:flip cross[til CHAR_HEIGHT;til CHAR_WIDTH]

frameData:(
  [
    x:last yxList;
    y:first yxList
  ]
  distance:#[CHAR_WIDTH*CHAR_HEIGHT;`float$0];
  colour:#[CHAR_WIDTH*CHAR_HEIGHT;`]
 );

frameData:frameData lj (
  [
    x:0 10 11 12 59;
    y:0 10 10 12 19
  ]
  distance:`float$4 1 2 3 5;
  colour:`green`red`white`blue`yellow
 );

DISTANCE_CHAR_MAP:([]
  distance:`float$til count CHARS;
  character:CHARS
 );

draw:{[frameData]
  frameData:aj[`distance;frameData;DISTANCE_CHAR_MAP];

  frameData:frameData uj (
    [
      x:CHAR_HEIGHT#CHAR_WIDTH;
      y:til CHAR_HEIGHT
    ]
    distance:CHAR_HEIGHT#`float$-1;
    colour:(-1 _ CHAR_HEIGHT#`),`default;
    character:(-1 _ CHAR_HEIGHT#"\n")," "
  );

  frameData:update formattedChar:(,')[COLOUR_CODES colour;character] from frameData;  // Apply colours

  -1 raze exec formattedChar from `y`x xasc aj[`distance;frameData;DISTANCE_CHAR_MAP];
 };

system"echo";

draw[frameData];
