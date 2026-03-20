#!/bin/bash
if [ -z '$1' ]; then
	exit -1
fi

AMMOCLASSNAME=""
AMMOIN=""
AMMODESC=""
AMMODMG=0
AMMOVEL=0
AMMOFIRSTING=""
AMMOSECONDING=""
AMMOFIRSTAMOUNT=0
AMMOSECONDAMOUNT=0
AMMOAMOUNT=0

echo "ammoClassName: "
read AMMOCLASSNAME
echo "ammoIngameName: "
read AMMOIN
echo "ammoDescription: "
read AMMODESC
echo "ammoDamage: "
read AMMODMG
echo "ammoVel: "
read AMMOVEL
echo "ammoFirstIngredient: "
read AMMOFIRSTING
echo "ammoFirstIngredientAmount: "
read AMMOFIRSTAMOUNT
echo "ammoSecondIngredient: "
read AMMOSECONDING
echo "ammoSecondIngredientAmount: "
read AMMOSECONDAMOUNT
echo "ammoCraftAmount: "
read AMMOAMOUNT

cat "$1" | sed "s/ammoClassName/$AMMOCLASSNAME/g" | sed "s/ammoIngameName/$AMMOIN/" | sed "s/ammoDescription/$AMMODESC/" | sed "s/ammoDamage/$AMMODMG/" | sed "s/ammoVelocity/$AMMOVEL/" | sed "s/ammoFirstIngredient/$AMMOFIRSTING/" | sed "s/ammoFirstIngredientAmount/$AMMOFIRSTAMOUNT/" | sed "s/ammoSecondIngredient/$AMMOSECONDING/" | sed "s/ammoSecondIngredientAmount/$AMMOSECONDAMOUNT/" | sed "s/ammoCraftCount/$AMMOAMOUNT/" > "Item$AMMOCLASSNAME.cs"