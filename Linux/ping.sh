#!/bin/bash

for i in {240..255}
do
fping 15.199.95.$i
fping 15.199.94.$i
fping 11.199.158.$i
fping 11.199.141.$i
done


