#!/bin/bash

## Script para extraer arquivos png dun ficheiro gif (que previamente fora optimizado)
## Tomado (16 de xullo de 2015) de: 
## http://tex.stackexchange.com/questions/107382/package-animate-is-great-but-could-it-have-a-better-animation-compression

wxh=$(identify -format '%Wx%H' $1[0])
fs=$(identify -format %n $1)

#for (( i=0; i<$fs; i++ ))
for i in `seq 1 112`
do
  convert -page $wxh ${1}[$i] -matte -background none -layers coalesce -quality 90 ${2/./-$i.}
  echo "::${i}x0"
done
