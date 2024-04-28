system"l constants.q";
system"l utility.q";


RAY_INCREMENT:0.02;
YX_LIST:flip cross[til CHAR_HEIGHT;til CHAR_WIDTH];


.raycast.updateFrameData:{[]
  {[columnX;rotationStep]
    incrementX:RAY_INCREMENT*cos rotationStep;
    incrementY:RAY_INCREMENT*sin rotationStep;

    n:1;
    doLoop:1b;

    while[doLoop;
      if[.game.grid[`long$.game.posY+incrementY*n;`long$.game.posX+incrementX*n];
        dist:RAY_INCREMENT*n;
        halfWallHeight:`long$0.5*floor CHAR_HEIGHT* .utility.clip[1%dist;0;1];
        `frameData set update distance:dist
                       from frameData
                       where x=columnX,
                             y<halfWallHeight+CHAR_HEIGHT%2,
                             y>=(-1*halfWallHeight)+CHAR_HEIGHT%2;
        doLoop:0b;
      ];

      n+:1;
    ];
  }'[til CHAR_WIDTH;.game.rotation+DEG_TO_RAD* *[FOV%CHAR_WIDTH;til CHAR_WIDTH]-FOV%2];
 };

.raycast.resetFrameData:{[]
  `frameData set (
    [
      x:last YX_LIST;
      y:first YX_LIST
    ]
    distance:#[CHAR_WIDTH*CHAR_HEIGHT;`float$-100]
  );
 };
