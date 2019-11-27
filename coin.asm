INCLUDE mymacros.inc
.MODEL LARGE 
.STACK 64
.DATA

black EQU 0
background_color EQU 0fH ;default white
byellow EQU 5ch
yellow EQU 2bH
red EQU 4H
d equ 6           ;the width of the pixel
                  ;if you want to change it 
				  ;do it in the macro too
startx equ 100
starty equ 50


.CODE
MAIN PROC FAR
MOV AX,@DATA
MOV DS,AX
;;;;;;;open the video mode;;;;;;;;
MOV AH,0
MOV AL,13h
INT 10H 
;;;;;;;clear the back ground;;;;;;
mov ax,0600h
mov bh,background_color
mov cx,0
mov dx,184FH
int 10h

;ClearBackGround startx,starty,14,16,background_color
;;;;;;;;;;;;;;draw a coin;;;;;;;;;;;;;;;;;;;;
;the function takes x1,x2,startx,;;;;;;;;;;;;
;starty,color,number of pixels to draw in x,;
;;;;;;;;number of pixel to draw in y ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DrawPixel 4*d   ,0  ,startx,starty,black           ,6,1


DrawPixel 2*d   ,1*d  ,startx,starty,black           ,3,1
DrawPixel 5*d   ,1*d  ,startx,starty,byellow         ,3,1
DrawPixel 8*d   ,1*d  ,startx,starty,black           ,4,1


DrawPixel 1*d   ,2*d  ,startx,starty,black           ,2,1
DrawPixel 3*d   ,2*d  ,startx,starty,byellow         ,2,1
DrawPixel 5*d   ,2*d  ,startx,starty,yellow          ,5,1
DrawPixel 10*d  ,2*d  ,startx,starty,black           ,2,1


DrawPixel 1*d   ,3*d  ,startx,starty,black           ,1,1
DrawPixel 2*d   ,3*d  ,startx,starty,byellow         ,1,2
DrawPixel 3*d   ,3*d  ,startx,starty,yellow          ,2,10

DrawPixel 5*d   ,3*d  ,startx,starty,byellow         ,1,9
DrawPixel 6*d   ,3*d  ,startx,starty,byellow         ,2,1

DrawPixel 8*d   ,3*d  ,startx,starty,black           ,1,10

DrawPixel 9*d   ,3*d  ,startx,starty,yellow          ,2,10
DrawPixel 11*d  ,3*d  ,startx,starty,black           ,2,2


DrawPixel 0     ,4*d  ,startx,starty,black           ,1,8
DrawPixel 1*d   ,4*d  ,startx,starty,black           ,1,1
DrawPixel 6*d   ,4*d  ,startx,starty,yellow          ,2,8


DrawPixel 1*d   ,5*d  ,startx,starty,byellow         ,1,6
DrawPixel 2*d   ,5*d  ,startx,starty,yellow          ,1,6
DrawPixel 11*d  ,5*d  ,startx,starty,yellow          ,1,6
DrawPixel 12*d  ,5*d  ,startx,starty,black           ,2,6


DrawPixel 1*d   ,11*d  ,startx,starty,black            ,1,3
DrawPixel 2*d   ,11*d  ,startx,starty,byellow          ,1,2
DrawPixel 11*d  ,11*d  ,startx,starty,black            ,2,2
DrawPixel 5*d   ,12*d  ,startx,starty,black            ,3,1


DrawPixel 2*d   ,13*d  ,startx,starty,black            ,1,1
DrawPixel 3*d   ,13*d  ,startx,starty,byellow          ,1,1
DrawPixel 4*d   ,13*d  ,startx,starty,yellow           ,6,1
DrawPixel 10*d  ,13*d  ,startx,starty,black            ,2,2


DrawPixel 2*d   ,14*d  ,startx,starty,black            ,3,1
DrawPixel 5*d   ,14*d  ,startx,starty,yellow           ,3,1
DrawPixel 8*d   ,14*d  ,startx,starty,black            ,2,2


DrawPixel 4*d   ,15*d  ,startx,starty,black            ,6,1




mov ah,0AH            
int 21h


MAIN ENDP
END MAIN