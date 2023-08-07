#!/bin/bash
cd ~
rm -r tmp
mkdir tmp
cd tmp
git clone git@github.com:azad71/Library-Management-System.git
cd Library-Management-System
npm install
npm start