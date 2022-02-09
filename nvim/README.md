## SCRIPTS

### Faster keys

`#!/bin/bash`

### Increase key speed via a rate change

`xset r rate 300 50`

### Set vi on bash and use ctrl + L for cleaning screan

`set -o vi`  
`bind -m vi-command 'Control-l: clear-screen`  
`bind -m vi-insert 'Control-l: clear-screen`

**For zsh - ohmyzsh**

`VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true`
`VI_MODE_SET_CURSOR=true`

## Comando básicos

```
inset mode: ‘inset mode’ i
Salir del inset mode: escape

(cualquier comando que venga precedido por : hay que hacerlo efectivo con enter)
salir de un doc con vim: :q   |   :q!  | ZQ
salir de un doc con vim guardano: :wq  | ZZ
ayuda: :h
Si ponemos : luego podemos navegar con las flechas.
:! : ejecuta comandos de consola
:ctrl+d: ayuda con los comandos que pueden ponerse con lo que se lleva escrito
:grep
133g: ir a la linea 133 (tambien :133)
```

## MOVIMIENTO

```
k: línea arriba
j: línea abajo
h: izq
l: dch

w: ‘word’ se mueve hasta la palabra siguiente
W: se mueve hasta la siguiente palabra sin tener en cuenta signos de puntuacion
e: se mueve hasta el final de la palabra
E: se mueve hasta el final de la palabra sin tener en cuenta signos de puntuacion
b: ‘beginning’ palabra hacia atrás
B: palabra hacia atrás sin tener en cuenta signos de puntuacion
{: se mueve un párrafo atrás
}: se mueve un párrafo adelante
%: va hasta donde acaben (), [], {}
^: principio de la linea (igual que regex)
0: lo mismo que la anterior
$: final de la linea (igual que regex)
gg: inicio fichero
G: final del fichero
gi: va al ultimo sitio donde se haya estado en insert mode
gv: va al ultimo sitio donde se haya estado en normal mode
ctrl + b: retrocede una página
ctrl + f: avanza una página
ctrl + u: retrocede media página
ctrl + d: avanza media página
t: ‘to’ -> tx : hasta la siguiente x (quedandose uno antes)
T: igual que t pero hacia atrás
f: ‘find’ -> tx : hasta la siguiente x
F: igual que f pero hacia atrás
,: repite f o t
;: repite F o T
*: busca la siguiente palabra igual a la que tengas debajo del cursor
#: busca la anterior palabra igual a la que tengas debajo del cursor
/: busca la siguiente x -> /x | n busca el siguiente N el anterior
?: busca la anterior x -> ?x  | n busca el siguiente N el anterior
%: salta al ({[]}) pareja del actual


>>: tab
<<: untab

zz: centra el puntero
zt: pone el puntero en la parte de arriba
zb: pone el puntero en la parte de abajo
```

## Edición

```
d:  ‘delete’ borrar -> dw borrar palabra | dtx borra hasta la siguiente x
dd: ‘delete’ borrar linea, se guarda en el portapapeles
da: 'delete arround' -> da[ borra [] y lo que haya dentro
daw -> borra la palabra estando en medio | dap para borrar un parrafo
di: 'delete inside' -> di( borra lo de dentro de ()
diw -> borra la palabra estando en medio pero dejando los espacios
D: ‘delete’ borra hasta el final de la linea
c: ‘change’ igual que d pero te deja en inset mode
cc: ‘change’ igual que dd pero te deja en inset mode
C: ‘change’ igual que D pero te deja en inset mode
r: como c pero para una sola letra, despues de escribir esa letra salta a NORMAL MODE
R: 'replace mode' desaconsejado, te pone en modo insert, a medida que escribes borras lo siguiente
s: 'sustitute' igual que r pero te deja en insert mode
S: borra la linea entera dejandote bien tabulado y en insert mode
x: borra una letra
p: ‘paste’ pegar portapapeles en la siguiente linea
P: ‘paste’ pegar portapapeles en la linea anterior
y: copiar -> yw copia la palabra siguiente

J: quita el \n de  final de linea

o: nueva linea debajo y entra en inset mode
O: nueva linea encima y entra en inset mode

a: inset mode pero 1 a la dch
A: inset mode al final de la linea
I: inset mode al principio de la linea

u: ‘undo’ deshacer
ctrl + r: ‘redo’ rehacer
:earlier: hace un undo por minutos -> :earlier 10m vuelve 10 min al pasado
:later: lo opuesto
g-: deshace pasos

~: cambiar mayus/minus   (alt gr + 4) (easy word remaped to ctrl+u)
.: rehace la ultima serie de acciones

v: visual mode, permite seleccionar letra a letra
V: visual mode, permite seleccionar varias lineas a la vez
ctrl + v: visual mode en varias columnas. Para luego entrar en inset -> I, A
gv: vuelve a seleccionar una seleccion anterior
ctrl + a: aumentar los numeros en una seleccion -> 5 ctrl + a  (aumenta en 5 todos los numeros de la seleccion)
ctrl + x: el contrario que la anterior
g ctrl + a: (vale igual para x) aumenta cada linea n en 1 + n


:s/: replace -> :s/x/y     -> sutitucion de la primera palabra
               :s/.../g   -> de la linea
               :%s/.../g  -> de todo el documento
               :%s/.../gc -> de todo el documento pero preguntando
               :#,#s/...  -> lo mismo entre los numeros de linea ##

:g/: 'global' aplicacion de un comando al documento, sigue una estructura parecida a :s/:
                :%g/^*4*$/d -> borra las lineas con un 4 en alguna posicion (regex)
                :6,20g/^*4*$/norm @4 -> aplica la macro 4 a todas las lineas entre la 6 y la 20


:sort: ordena la seleccion por lineas, si no se selecciona nada, ordena todo
:sort u: ordena la seleccion quedandose con las no repetidas
:!: ejecuta comandos de consola
:ter abre una terminal

:ab: abreviaturas -> :ab hte the    cada vez que se escriba hte se cambia automaticamente por the
```

## MACROS

```
1. q: grabar macro en letra -> qx guarda la macro en la letra x
2. Grabar macro
3. @: llamar a la macro grabada -> @w
```

## REGISTROS

```
1. "x: seleccionar un registro x -> "x donde x [0-9][a-z]
2. Realizar la accion e.g. yy (se puede hacer uso de visual mode antes del paso 1)
3. Acceso al registro para pegar -> "xp
4. Para ver los registros :reg
```

Automaticamente si no se pone nada los registros se van moviendo del 0 al 9

## BUFFERS

Son los documentos cargados en memoria

```
:e myfile: abre myfile | :e /home/\*\*/myfile busca lo que se parezca, lo mejor es usar un fuzzy finder
:Ex: abre un explorador de archivos (los hay mejores como nrtree)
:bw: close buffer
:buffers: ver buffers abiertos

Tab: para cambiar entre los window buffer (es posible que este remapeado)
gf: go to file, abre el path sobre el que estés en un buffer nuevo

ctrl + o: jumplist next. Sitios donde ha estado el cursor (diferentes viewpoints tambien) (remaped to tab)
ctrl + i: jumplist previous. Sitios donde ha estado el cursor (diferentes viewpoints tambien) (remaped to tab)
ctrl+^: cambia entre los dos ultimos archivos abiertos (no se si es posible con el teclado español), mejor las anteriores
```

## MULTIPLE window splits -> viewpoints

Son partes de la pantalla en las que se visualizan los buffers

```
Controlados por ctrl + w

ctrl + w s: split horizontal
ctrl + w v: split vertical

ctrl + w q: close split

ctrl + w ctrl + w: para cambiar de splip
ctrl + w h,j,k,l: para moverse entre splits (remaped to ctrl + h,j,k,l)
Alt+h,j,k,l: para cambiar el tamaño de los splits

ctrl + w r, R: rotate splits
ctrl + w o: make the current window the only one
```

## QuickFix List

Se trata de un listado de punteros a zonas concretas en documentos.
Hay locales (location list) que solo afectan al buffer abierto o
globales (quickfix list) que afectan a todo.

```
:copen: abre quickfix list
:lopen: abre location list

:cnext y :cprev: para moverse en quickfix list
:lnext y :lprev: para moverse en location list
```

## MARKS

```
mx: pone una marca en x (recomendado usar las teclas que caigan debajo de los dedos en orden de importancia)
 | si X (mayus) entonces es una ref global, en otro caso sera local al archivo
'x: vuelve a la mark x
```
# INSTALLATION
## FONT
[FURA](https://drive.google.com/file/d/13r0Pa--w40Rn74wy3ZlJbQb_UKOOsvXv/view?usp=sharing)
## PLUGGINS
### Install Node js and npm

```
:PlugClean
:PlugInstall

:TSUpdate
```
### FZF
Hay que instalar varias cosas -> [LINK]( https://github.com/junegunn/fzf )
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## PLUGGINS

Install nvim + vim-plug(Vim-plug https://github.com/junegunn/vim-plug)  
`sudo apt install neovim`  
`mkdir ~/.config/nvim`  
`curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

Install plugs  
Añadir al .config/nvim/vim-plug/pluggins.vim  
 Plug author/repo ## Para cosas de github  
 Plug url.git ## Para el resto  
Desde el propio vim  
 1- Guardar-cerrar-abrir  
 2- usar el comando PlugInstall

Uninstall plugs  
Desde el propio vim  
 1- Quitar el comando Plug ... de la lista  
 2- Guardar-cerrar-abrir  
 3- usar el comando PlugClean
