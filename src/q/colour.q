RESET_FG:"\033[39m";
GREYSCALE_CODES:16,(232+til 24),15;


colour256:{[code;msg]
  :"\033[38;5;",string[code],"m",msg,RESET_FG;
 };
