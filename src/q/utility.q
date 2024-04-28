system"l constants.q";


.utility.clip:{y|z&0f^x};
.utility.round:{floor 0.5+x};

.utility.draw:{[lvl]
  lvl:.utility.centreLvl lvl;
  .utility.cls[];
  -1 lvl;
  1 .utility.centreLvl"Quit [Q], Forward/Back/Left/Right [W/S/A/D] > ";
 };

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

.utility.centreMsg:{[msg]
  termSize:@[{"J"$first system x};"tput cols";0];

  spacesCount:0|(floor termSize%2)-floor count[msg]%2;

  :(spacesCount#" "),msg;
 };
