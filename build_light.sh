#!/bin/sh

ARMAKE="tools/armake";
VALIDATOR="tools/sqf_validator.py";
DEST="@CoopRLight/addons"
KEYS="@CoopRLight/keys"

python $VALIDATOR

rm -rf @CoopRLight
mkdir -p $DEST
mkdir -p $KEYS

$ARMAKE build -p -f addons/core $DEST/core.pbo
$ARMAKE build -p -f addons/persistence $DEST/persistence.pbo
$ARMAKE build -p -f addons/integration $DEST/integration.pbo
$ARMAKE build -p -f addons/lobby $DEST/lobby.pbo

cp mod.cpp @CoopRLight/mod.cpp
cp keys/cooprlight.bikey @CoopRLight/keys/
