RESET_FG:"\033[39m";
GREYSCALE_CODES:16,(232+til 24),15;


.colour.colourGreyscale:{[brightness;msg]
  str:string brightness;
  :"\033[38;2;",str,";",str,";",str,"m",msg,RESET_FG;
 };
