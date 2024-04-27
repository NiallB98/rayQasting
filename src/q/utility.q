.utility.clip:{y|z&0f^x};

.utility.cls:{
  if[DEBUG_NO_CLS;-1"DEBUG Cleared screen";:()];
  
  1"\033[H\033[2J\033[3J";
 };

.utility.centreLvl:{[lvl]
  splitLvl:"\n" vs lvl;
  termSize:@[{"J"$first system x};"tput cols";0];

  spacesCount:0|(floor termSize%2)-floor CHAR_WIDTH%2;

  :"\n" sv ,[spacesCount#" "]each splitLvl;
 };

.utility.round:{floor 0.5+x};
