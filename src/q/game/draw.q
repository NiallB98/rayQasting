system"l constants.q";
system"l game/draw/utility.q";
system"l game/draw/raycast.q";
system"l game/draw/colour.q";


DISTANCE_BRIGHTNESS_MAP:([]
  distance:-1, .draw.utility.getDistanceStep each til 256;
  brightness:0,reverse til 256
 );

NEWLINES:(
  [
    x:CHAR_HEIGHT#CHAR_WIDTH;
    y:til CHAR_HEIGHT
  ]
  distance:CHAR_HEIGHT#`float$-1;
  formattedChar:(-1 _ CHAR_HEIGHT#enlist "\n"),enlist " "
 );


draw:{[]
  .raycast.resetFrameData[];
  .raycast.updateFrameData[];

  `frameData set aj[`distance;frameData;DISTANCE_BRIGHTNESS_MAP];
  `frameData set update formattedChar:.colour.colourGreyscale\:[brightness;WALL_CHAR] from frameData;
  `frameData set frameData uj NEWLINES;

  .utility.draw raze exec formattedChar from `y`x xasc frameData;

  .Q.gc[];
 };
