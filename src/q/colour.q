RESET_FG:"\033[39m";
GREYSCALE_CODES:16,(232+til 24),15;


colour256:{[code;msg]
  :"\033[38;5;",string[code],"m",msg,RESET_FG;
 };

colourGreyscale:{[brightness;msg]
  str:string brightness;
  :"\033[38;2;",str,";",str,";",str,"m",msg,RESET_FG;
 };
