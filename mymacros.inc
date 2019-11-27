DrawPixel MACRO x1,y1,x_start,y_start,color,no_of_pixels_in_x,no_of_pixels_in_y
local back
d Equ 6                        ;the width of the pixel

mov cx,x1
add cx,x_start                 ;CX=X1+X_START

mov bx,cx
add bx,no_of_pixels_in_x*d     ;BX=X1+X_START+d   the end of the pixels

mov dx,y1       
add dx,y_start                 ;DX=Y1+Y_START

mov di,dx
add di,no_of_pixels_in_y*d     ;DI=Y1+Y_START+d   the end of the pixels

mov al,color         
mov ah,0ch     

back:   int 10h 
        inc cx
        cmp cx,bx
        jnz back
          
        mov cx,x1
		add cx,x_start
        inc dx 
        cmp dx,di
        jnz back
ENDM DrawPixel
 
ClearBackGround MACRO x_start,y_start,no_of_pixels_in_x,no_of_pixels_in_y,color
local clear
d Equ 6  

mov cx,x_start

mov bx,cx
add bx,no_of_pixels_in_x*d  ;bx=x_start+no_of_pixels_in_x*d

mov dx,y_start

mov di,dx                   ;di=y_start+no_of_pixels_in_y*d
add di,no_of_pixels_in_y*d

mov al,color         
mov ah,0ch     


clear:   int 10h 
        inc cx
        cmp cx,bx
        jnz clear
          
        mov cx,x_start
        inc dx 
        cmp dx,di
        jnz clear

ENDM ClearBackGround
