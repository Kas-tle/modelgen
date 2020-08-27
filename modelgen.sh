printf "\e[36mThis script will help you generte a custom model data JSON file for a Minecraft resource pack. Simply press enter for bracketed default values.\e[m\n"
echo
printf "What item are you trying to remodel? (a-z,_ only) \e[33m[diamond]\e[m\n"
read -p 'Item Name: ' itemname
echo
printf "What is the desired parent of your model file? (e.g. item/generated) \e[33m[item/generated]\e[m\n"
read -p 'Parent Path: ' parent
echo
printf "How many custom model entries would you like to create? \e[33m[1]\e[m\n"
read -p '# of Entries: ' entrynum
echo
printf "What is the file path of the custom models? (e.g. item/custom) \e[33m[item/custom]\e[m\n"
read -p 'File Path: ' filepath
echo
printf "What is the namespace of this model? (e.g. minecraft) \e[33m[minecraft]\e[m\n"
read -p 'Namespace: ' namespace
echo
printf "\e[37mGenerating Custom Model JSON with settings:\e[m\n"
echo "Item: ${itemname:=diamond}"
echo "Entries: ${entrynum:=1}"
echo "File Path: ${filepath:=item/custom}"
echo "Namespace: ${namespace:=minecraft}"
echo "Parent: ${parent:=item/generated}"
if [ $itemname == 'bow' ]
then
  cat > $itemname.json << ENDOFFILE
{
    "parent": "$namespace:$parent",
    "textures": {
          "layer0": "item/bow"
      },
      "display": {
          "thirdperson_righthand": {
              "rotation": [ -80, 260, -40 ],
              "translation": [ -1, -2, 2.5 ],
              "scale": [ 0.9, 0.9, 0.9 ]
          },
          "thirdperson_lefthand": {
              "rotation": [ -80, -280, 40 ],
              "translation": [ -1, -2, 2.5 ],
              "scale": [ 0.9, 0.9, 0.9 ]
          },
          "firstperson_righthand": {
              "rotation": [ 0, -90, 25 ],
              "translation": [ 1.13, 3.2, 1.13],
              "scale": [ 0.68, 0.68, 0.68 ]
          },
          "firstperson_lefthand": {
              "rotation": [ 0, 90, -25 ],
              "translation": [ 1.13, 3.2, 1.13],
              "scale": [ 0.68, 0.68, 0.68 ]
          }
      },
      "overrides": [
        {"predicate": {"damage": 0 }, "model": "item/bow" },
        {"predicate": {"damage": 0, "pulling": 1 }, "model": "item/bow_pulling_0"},
        {"predicate": {"damage": 0, "pulling": 1, "pull": 0.5}, "model": "item/bow_pulling_1"},
        {"predicate": {"damage": 0, "pulling": 1, "pull": 1.0}, "model": "item/bow_pulling_2"},
ENDOFFILE
  for i in $(seq 1 $entrynum)
  do
     echo "        {\"predicate\": {\"custom_model_data\": $i, \"pulling\": 1, \"pull\": 0},\"model\": \"$namespace:$filepath/${itemname}_${i}_0\"}," >> $itemname.json
     echo "        {\"predicate\": {\"custom_model_data\": $i, \"pulling\": 1, \"pull\": 0.5},\"model\": \"$namespace:$filepath/${itemname}_${i}_1\"}," >> $itemname.json
     echo "        {\"predicate\": {\"custom_model_data\": $i, \"pulling\": 1, \"pull\": 1},\"model\": \"$namespace:$filepath/${itemname}_${i}_2\"}," >> $itemname.json
  done
elif [ $itemname == 'crossbow' ]
then
  cat > $itemname.json << ENDOFFILE
{
      "parent": "item/$namespace:$parent",
      "textures": {
          "layer0": "item/crossbow_standby"
      },
      "display": {
          "thirdperson_righthand": {
              "rotation": [ -90, 0, -60 ],
              "translation": [ 2, 0.1, -3 ],
              "scale": [ 0.9, 0.9, 0.9 ]
          },
          "thirdperson_lefthand": {
              "rotation": [ -90, 0, 30 ],
              "translation": [ 2, 0.1, -3 ],
              "scale": [ 0.9, 0.9, 0.9 ]
          },
          "firstperson_righthand": {
              "rotation": [ -90, 0, -55 ],
              "translation": [ 1.13, 3.2, 1.13],
              "scale": [ 0.68, 0.68, 0.68 ]
          },
          "firstperson_lefthand": {
              "rotation": [ -90, 0, 35 ],
              "translation": [ 1.13, 3.2, 1.13],
              "scale": [ 0.68, 0.68, 0.68 ]
          }
      },
      "overrides": [
          {"predicate": {"pulling": 1}, "model": "item/crossbow_pulling_0"},
          {"predicate": {"pulling": 1, "pull": 0.58}, "model": "item/crossbow_pulling_1"},
          {"predicate": {"pulling": 1, "pull": 1.0}, "model": "item/crossbow_pulling_2"},
          {"predicate": {"charged": 1}, "model": "item/crossbow_arrow"},
          {"predicate": {"charged": 1, "firework": 1}, "model": "item/crossbow_firework"},
ENDOFFILE
  for i in $(seq 1 $entrynum)
  do
     echo "        {\"predicate\": {\"custom_model_data\": $i, \"pulling\": 1, \"pull\": 0},\"model\": \"$namespace:$filepath/${itemname}_${i}_0\"}," >> $itemname.json
     echo "        {\"predicate\": {\"custom_model_data\": $i, \"pulling\": 1, \"pull\": 0.58},\"model\": \"$namespace:$filepath/${itemname}_${i}_1\"}," >> $itemname.json
     echo "        {\"predicate\": {\"custom_model_data\": $i, \"pulling\": 1, \"pull\": 1.0},\"model\": \"$namespace:$filepath/${itemname}_${i}_2\"}," >> $itemname.json
     echo "        {\"predicate\": {\"custom_model_data\": $i, \"charged\": 1},\"model\": \"$namespace:$filepath/${itemname}_${i}_arrow\"}," >> $itemname.json
     echo "        {\"predicate\": {\"custom_model_data\": $i, \"charged\": 1, \"firework\": 1},\"model\": \"$namespace:$filepath/${itemname}_${i}_firework\"}," >> $itemname.json
  done
elif [ $itemname == 'clock' ]
then
  cat > $itemname.json << ENDOFFILE
{
  	"parent": "item/generated",
  	"textures": {
  		"layer0": "item/clock"
  	},
  	"overrides": [
  		  {"predicate": {"time": 0}, "model": "item/clock"},
  	    {"predicate": {"time": 0.015625}, "model": "item/clock1"},
  	    {"predicate": {"time": 0.03125}, "model": "item/clock2"},
  	    {"predicate": {"time": 0.046875}, "model": "item/clock3"},
  	    {"predicate": {"time": 0.0625}, "model": "item/clock4"},
  	    {"predicate": {"time": 0.078125}, "model": "item/clock5"},
  	    {"predicate": {"time": 0.09375}, "model": "item/clock6"},
  	    {"predicate": {"time": 0.109375}, "model": "item/clock7"},
  	    {"predicate": {"time": 0.125}, "model": "item/clock8"},
  	    {"predicate": {"time": 0.140625}, "model": "item/clock9"},
  	    {"predicate": {"time": 0.15625}, "model": "item/clock10"},
  	    {"predicate": {"time": 0.171875}, "model": "item/clock11"},
  	    {"predicate": {"time": 0.1875}, "model": "item/clock12"},
  	    {"predicate": {"time": 0.203125}, "model": "item/clock13"},
  	    {"predicate": {"time": 0.21875}, "model": "item/clock14"},
  	    {"predicate": {"time": 0.234375}, "model": "item/clock15"},
  	    {"predicate": {"time": 0.25}, "model": "item/clock16"},
  	    {"predicate": {"time": 0.265625}, "model": "item/clock17"},
  	    {"predicate": {"time": 0.28125}, "model": "item/clock18"},
  	    {"predicate": {"time": 0.296875}, "model": "item/clock19"},
  	    {"predicate": {"time": 0.3125}, "model": "item/clock20"},
  	    {"predicate": {"time": 0.328125}, "model": "item/clock21"},
  	    {"predicate": {"time": 0.34375}, "model": "item/clock22"},
  	    {"predicate": {"time": 0.359375}, "model": "item/clock23"},
  	    {"predicate": {"time": 0.375}, "model": "item/clock24"},
  	    {"predicate": {"time": 0.390625}, "model": "item/clock25"},
  	    {"predicate": {"time": 0.40625}, "model": "item/clock26"},
  	    {"predicate": {"time": 0.421875}, "model": "item/clock27"},
  	    {"predicate": {"time": 0.4375}, "model": "item/clock28"},
  	    {"predicate": {"time": 0.453125}, "model": "item/clock29"},
  	    {"predicate": {"time": 0.46875}, "model": "item/clock30"},
  	    {"predicate": {"time": 0.484375}, "model": "item/clock31"},
  	    {"predicate": {"time": 0.5}, "model": "item/clock32"},
  	    {"predicate": {"time": 0.515625}, "model": "item/clock33"},
  	    {"predicate": {"time": 0.53125}, "model": "item/clock34"},
  	    {"predicate": {"time": 0.546875}, "model": "item/clock35"},
  	    {"predicate": {"time": 0.5625}, "model": "item/clock36"},
  	    {"predicate": {"time": 0.578125}, "model": "item/clock37"},
  	    {"predicate": {"time": 0.59375}, "model": "item/clock38"},
  	    {"predicate": {"time": 0.609375}, "model": "item/clock39"},
  	    {"predicate": {"time": 0.625}, "model": "item/clock40"},
  	    {"predicate": {"time": 0.640625}, "model": "item/clock41"},
  	    {"predicate": {"time": 0.65625}, "model": "item/clock42"},
  	    {"predicate": {"time": 0.671875}, "model": "item/clock43"},
  	    {"predicate": {"time": 0.6875}, "model": "item/clock44"},
  	    {"predicate": {"time": 0.703125}, "model": "item/clock45"},
  	    {"predicate": {"time": 0.71875}, "model": "item/clock46"},
  	    {"predicate": {"time": 0.734375}, "model": "item/clock47"},
  	    {"predicate": {"time": 0.75}, "model": "item/clock48"},
  	    {"predicate": {"time": 0.765625}, "model": "item/clock49"},
  	    {"predicate": {"time": 0.78125}, "model": "item/clock50"},
  	    {"predicate": {"time": 0.796875}, "model": "item/clock51"},
  	    {"predicate": {"time": 0.8125}, "model": "item/clock52"},
  	    {"predicate": {"time": 0.828125}, "model": "item/clock53"},
  	    {"predicate": {"time": 0.84375}, "model": "item/clock54"},
  	    {"predicate": {"time": 0.859375}, "model": "item/clock55"},
  	    {"predicate": {"time": 0.875}, "model": "item/clock56"},
  	    {"predicate": {"time": 0.890625}, "model": "item/clock57"},
  	    {"predicate": {"time": 0.90625}, "model": "item/clock58"},
  	    {"predicate": {"time": 0.921875}, "model": "item/clock59"},
  	    {"predicate": {"time": 0.9375}, "model": "item/clock60"},
  	    {"predicate": {"time": 0.953125}, "model": "item/clock61"},
  	    {"predicate": {"time": 0.96875}, "model": "item/clock62"},
  	    {"predicate": {"time": 0.984375}, "model": "item/clock63"},
ENDOFFILE
for i in $(seq 1 $entrynum)
do
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0},\"model\": \"$namespace:$filepath/${itemname}_${i}\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.015625},\"model\": \"$namespace:$filepath/${itemname}_${i}_1\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.03125},\"model\": \"$namespace:$filepath/${itemname}_${i}_2\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.046875},\"model\": \"$namespace:$filepath/${itemname}_${i}_3\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.0625},\"model\": \"$namespace:$filepath/${itemname}_${i}_4\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.078125},\"model\": \"$namespace:$filepath/${itemname}_${i}_5\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.09375},\"model\": \"$namespace:$filepath/${itemname}_${i}_6\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.109375},\"model\": \"$namespace:$filepath/${itemname}_${i}_7\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.125},\"model\": \"$namespace:$filepath/${itemname}_${i}_8\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.140625},\"model\": \"$namespace:$filepath/${itemname}_${i}_9\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.15625},\"model\": \"$namespace:$filepath/${itemname}_${i}_10\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.171875},\"model\": \"$namespace:$filepath/${itemname}_${i}_11\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.1875},\"model\": \"$namespace:$filepath/${itemname}_${i}_12\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.203125},\"model\": \"$namespace:$filepath/${itemname}_${i}_13\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.21875},\"model\": \"$namespace:$filepath/${itemname}_${i}_14\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.234375},\"model\": \"$namespace:$filepath/${itemname}_${i}_15\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.25},\"model\": \"$namespace:$filepath/${itemname}_${i}_16\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.265625},\"model\": \"$namespace:$filepath/${itemname}_${i}_17\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.28125},\"model\": \"$namespace:$filepath/${itemname}_${i}_18\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.296875},\"model\": \"$namespace:$filepath/${itemname}_${i}_19\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.3125},\"model\": \"$namespace:$filepath/${itemname}_${i}_20\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.328125},\"model\": \"$namespace:$filepath/${itemname}_${i}_21\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.34375},\"model\": \"$namespace:$filepath/${itemname}_${i}_22\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.359375},\"model\": \"$namespace:$filepath/${itemname}_${i}_23\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.375},\"model\": \"$namespace:$filepath/${itemname}_${i}_24\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.390625},\"model\": \"$namespace:$filepath/${itemname}_${i}_25\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.40625},\"model\": \"$namespace:$filepath/${itemname}_${i}_26\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.421875},\"model\": \"$namespace:$filepath/${itemname}_${i}_27\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.4375},\"model\": \"$namespace:$filepath/${itemname}_${i}_28\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.453125},\"model\": \"$namespace:$filepath/${itemname}_${i}_29\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.46875},\"model\": \"$namespace:$filepath/${itemname}_${i}_30\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.484375},\"model\": \"$namespace:$filepath/${itemname}_${i}_31\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.5},\"model\": \"$namespace:$filepath/${itemname}_${i}_32\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.515625},\"model\": \"$namespace:$filepath/${itemname}_${i}_33\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.53125},\"model\": \"$namespace:$filepath/${itemname}_${i}_34\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.546875},\"model\": \"$namespace:$filepath/${itemname}_${i}_35\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.5625},\"model\": \"$namespace:$filepath/${itemname}_${i}_36\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.578125},\"model\": \"$namespace:$filepath/${itemname}_${i}_37\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.59375},\"model\": \"$namespace:$filepath/${itemname}_${i}_38\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.609375},\"model\": \"$namespace:$filepath/${itemname}_${i}_39\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.625},\"model\": \"$namespace:$filepath/${itemname}_${i}_40\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.640625},\"model\": \"$namespace:$filepath/${itemname}_${i}_41\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.65625},\"model\": \"$namespace:$filepath/${itemname}_${i}_42\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.671875},\"model\": \"$namespace:$filepath/${itemname}_${i}_43\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.6875},\"model\": \"$namespace:$filepath/${itemname}_${i}_44\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.703125},\"model\": \"$namespace:$filepath/${itemname}_${i}_45\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.71875},\"model\": \"$namespace:$filepath/${itemname}_${i}_46\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.734375},\"model\": \"$namespace:$filepath/${itemname}_${i}_47\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.75},\"model\": \"$namespace:$filepath/${itemname}_${i}_48\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.765625},\"model\": \"$namespace:$filepath/${itemname}_${i}_49\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.78125},\"model\": \"$namespace:$filepath/${itemname}_${i}_50\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.796875},\"model\": \"$namespace:$filepath/${itemname}_${i}_51\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.8125},\"model\": \"$namespace:$filepath/${itemname}_${i}_52\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.828125},\"model\": \"$namespace:$filepath/${itemname}_${i}_53\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.84375},\"model\": \"$namespace:$filepath/${itemname}_${i}_54\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.859375},\"model\": \"$namespace:$filepath/${itemname}_${i}_55\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.875},\"model\": \"$namespace:$filepath/${itemname}_${i}_56\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.890625},\"model\": \"$namespace:$filepath/${itemname}_${i}_57\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.90625},\"model\": \"$namespace:$filepath/${itemname}_${i}_58\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.921875},\"model\": \"$namespace:$filepath/${itemname}_${i}_59\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.9375},\"model\": \"$namespace:$filepath/${itemname}_${i}_60\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.953125},\"model\": \"$namespace:$filepath/${itemname}_${i}_61\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.96875},\"model\": \"$namespace:$filepath/${itemname}_${i}_62\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"time\": 0.984375},\"model\": \"$namespace:$filepath/${itemname}_${i}_63\"}," >> $itemname.json
done
elif [ $itemname == 'compass' ]
then
  cat > $itemname.json << ENDOFFILE
  {
      "parent": "item/generated",
      "textures": {
          "layer0": "item/compass_16"
      },
      "overrides": [
  	    {"predicate": {"angle": 0.000000}, "model": "item/compass"},
        {"predicate": {"angle": 0.015625}, "model": "item/compass_17"},
        {"predicate": {"angle": 0.046875}, "model": "item/compass_18"},
        {"predicate": {"angle": 0.078125}, "model": "item/compass_19"},
        {"predicate": {"angle": 0.109375}, "model": "item/compass_20"},
        {"predicate": {"angle": 0.140625}, "model": "item/compass_21"},
        {"predicate": {"angle": 0.171875}, "model": "item/compass_22"},
        {"predicate": {"angle": 0.203125}, "model": "item/compass_23"},
        {"predicate": {"angle": 0.234375}, "model": "item/compass_24"},
        {"predicate": {"angle": 0.265625}, "model": "item/compass_25"},
        {"predicate": {"angle": 0.296875}, "model": "item/compass_26"},
        {"predicate": {"angle": 0.328125}, "model": "item/compass_27"},
        {"predicate": {"angle": 0.359375}, "model": "item/compass_28"},
        {"predicate": {"angle": 0.390625}, "model": "item/compass_29"},
        {"predicate": {"angle": 0.421875}, "model": "item/compass_30"},
        {"predicate": {"angle": 0.453125}, "model": "item/compass_31"},
        {"predicate": {"angle": 0.484375}, "model": "item/compass_00"},
        {"predicate": {"angle": 0.515625}, "model": "item/compass_01"},
        {"predicate": {"angle": 0.546875}, "model": "item/compass_02"},
        {"predicate": {"angle": 0.578125}, "model": "item/compass_03"},
        {"predicate": {"angle": 0.609375}, "model": "item/compass_04"},
        {"predicate": {"angle": 0.640625}, "model": "item/compass_05"},
        {"predicate": {"angle": 0.671875}, "model": "item/compass_06"},
        {"predicate": {"angle": 0.703125}, "model": "item/compass_07"},
        {"predicate": {"angle": 0.734375}, "model": "item/compass_08"},
        {"predicate": {"angle": 0.765625}, "model": "item/compass_09"},
        {"predicate": {"angle": 0.796875}, "model": "item/compass_10"},
        {"predicate": {"angle": 0.828125}, "model": "item/compass_11"},
        {"predicate": {"angle": 0.859375}, "model": "item/compass_12"},
        {"predicate": {"angle": 0.890625}, "model": "item/compass_13"},
        {"predicate": {"angle": 0.921875}, "model": "item/compass_14"},
        {"predicate": {"angle": 0.953125}, "model": "item/compass_15"},
        {"predicate": {"angle": 0.984375}, "model": "item/compass"},
ENDOFFILE
for i in $(seq 1 $entrynum)
do
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.000000},\"model\": \"$namespace:$filepath/${itemname}_${i}\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.015625},\"model\": \"$namespace:$filepath/${itemname}_${i}_17\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.046875},\"model\": \"$namespace:$filepath/${itemname}_${i}_18\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.078125},\"model\": \"$namespace:$filepath/${itemname}_${i}_19\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.109375},\"model\": \"$namespace:$filepath/${itemname}_${i}_20\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.140625},\"model\": \"$namespace:$filepath/${itemname}_${i}_21\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.171875},\"model\": \"$namespace:$filepath/${itemname}_${i}_22\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.203125},\"model\": \"$namespace:$filepath/${itemname}_${i}_23\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.234375},\"model\": \"$namespace:$filepath/${itemname}_${i}_24\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.265625},\"model\": \"$namespace:$filepath/${itemname}_${i}_25\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.296875},\"model\": \"$namespace:$filepath/${itemname}_${i}_26\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.328125},\"model\": \"$namespace:$filepath/${itemname}_${i}_27\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.359375},\"model\": \"$namespace:$filepath/${itemname}_${i}_28\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.390625},\"model\": \"$namespace:$filepath/${itemname}_${i}_29\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.421875},\"model\": \"$namespace:$filepath/${itemname}_${i}_30\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.453125},\"model\": \"$namespace:$filepath/${itemname}_${i}_31\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.484375},\"model\": \"$namespace:$filepath/${itemname}_${i}_00\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.515625},\"model\": \"$namespace:$filepath/${itemname}_${i}_01\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.546875},\"model\": \"$namespace:$filepath/${itemname}_${i}_02\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.578125},\"model\": \"$namespace:$filepath/${itemname}_${i}_03\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.609375},\"model\": \"$namespace:$filepath/${itemname}_${i}_04\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.640625},\"model\": \"$namespace:$filepath/${itemname}_${i}_05\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.671875},\"model\": \"$namespace:$filepath/${itemname}_${i}_06\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.703125},\"model\": \"$namespace:$filepath/${itemname}_${i}_07\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.734375},\"model\": \"$namespace:$filepath/${itemname}_${i}_08\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.765625},\"model\": \"$namespace:$filepath/${itemname}_${i}_09\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.796875},\"model\": \"$namespace:$filepath/${itemname}_${i}_10\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.828125},\"model\": \"$namespace:$filepath/${itemname}_${i}_11\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.859375},\"model\": \"$namespace:$filepath/${itemname}_${i}_12\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.890625},\"model\": \"$namespace:$filepath/${itemname}_${i}_13\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.921875},\"model\": \"$namespace:$filepath/${itemname}_${i}_14\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.953125},\"model\": \"$namespace:$filepath/${itemname}_${i}_15\"}," >> $itemname.json
  echo "        {\"predicate\": {\"custom_model_data\": $i, \"angle\": 0.984375},\"model\": \"$namespace:$filepath/${itemname}_${i}\"}," >> $itemname.json
done
else
  cat > $itemname.json << ENDOFFILE
  {
    "parent": "$namespace:$parent",
    "textures": {
      "layer0": "minecraft:item/$itemname"
    },
    "overrides": [
ENDOFFILE
  for i in $(seq 1 $entrynum)
  do
     echo "    {\"predicate\": {\"custom_model_data\": $i},\"model\": \"$namespace:$filepath/${itemname}_$i\"}," >> $itemname.json
  done
fi
printf '%s\n' '$' 's/.$//' wq | ex $itemname.json
echo " 	]" >> $itemname.json
echo "}" >> $itemname.json
printf "\e[32m$itemname.json has been successfully generated with $entrynum custom model data entries.\e[m\n"
