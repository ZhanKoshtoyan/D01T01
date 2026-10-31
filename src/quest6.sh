#!/bin/bash
cd ./ai_help
chmod +x keygen.sh
./keygen.sh
rm key/file{1..300}
head key/*.key
chmod +x unifier.sh
./unifier.sh
