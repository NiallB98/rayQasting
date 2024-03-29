system"l constants.q";
system"l utility.q";

RAY_INCREMENT:0.02;

raycast:{[]
  {[columnX;rotationStep]
    incrementX:RAY_INCREMENT*cos rotationStep;
    incrementY:RAY_INCREMENT*sin rotationStep;

    n:1;
    doLoop:1b;

    while[doLoop;
      if[grid[`long$posY+incrementY*n;`long$posX+incrementX*n];
        dist:RAY_INCREMENT*n;
        halfWallHeight:`long$0.5*floor CHAR_HEIGHT*clip[1%dist;0;1];
        `frameData set update distance:dist,
                              colour:`default
                       from frameData
                       where x=columnX,
                             y<halfWallHeight+CHAR_HEIGHT%2,
                             y>=(-1*halfWallHeight)+CHAR_HEIGHT%2;
        doLoop:0b;
      ];

      n+:1;
    ];
  }'[til CHAR_WIDTH;rotation+DEG_TO_RAD* *[FOV%CHAR_WIDTH;til CHAR_WIDTH]-FOV%2];
 };
