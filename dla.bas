10 REM ***DIFFUSSION LIMITED AGGREGATION***
20 PRINT CHR$(125)
30 POSITION 0,0:PRINT "ENTER PARTICLES: ":INPUT PARTICLES
40 PRINT CHR$(125)
50 GRAPHICS 8: COLOR 1:PLOT 160,96:XO=160:YO=96
59 REM ***MAIN LOOP***
60 GOSUB 200
70 GOSUB 400
80 IF PARTS<=PARTICLES THEN GOTO 60
100 END
199 REM ***SEED PARTICLE***
200 FI = 360*RND(1): STICK=0
210 IF PARTS < 100 THEN R=15:X=160+R*COS(FI):Y=96+R*SIN(FI):RETURN
220 IF PARTS < 300 THEN R=30:X=160+R*COS(FI):Y=96+R*SIN(FI):RETURN
230 IF PARTS < 600 THEN R=45:X=160+R*COS(FI):Y=96+R*SIN(FI):RETURN
240 R=75:X=160+R*COS(FI):Y=96+R*SIN(FI):RETURN
399 REM ***BROWNIAN MOTION***
400 DICE = RND(1)
405 OLDX=X:OLDY=Y
406 COLOR 1
410 IF DICE<0.25 THEN X=X-1: PLOT X,Y:GOTO 450
420 IF DICE<0.5 THEN X=X+1: PLOT X,Y:GOTO 450
430 IF DICE<0.75 THEN Y=Y-1: PLOT X,Y:GOTO 450
440 Y=Y+1: PLOT X,Y
450 GOSUB 600
460 IF STICK=1 THEN RETURN
470 IF ABS(X-XO)>130 OR ABS(Y-YO)>85 THEN COLOR 0:PLOT X,Y: GOTO 60
480 GOTO 400
599 REM ***CHECK IF PARTICLE STICKS***
600 COLOR 0: PLOT OLDX,OLDY
610 LOCATE X+1,Y,COL1:LOCATE X-1,Y,COL2:LOCATE X,Y+1,COL3:LOCATE X,Y-1,COL4
620 IF COL1+COL2+COL3+COL4>0 THEN COLOR 1:PLOT X,Y: PARTS=PARTS+1:STICK=1:GOTO 60
630 RETURN
