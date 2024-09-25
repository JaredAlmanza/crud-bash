#!/bin/bash
w_loop=0
while [[ $w_loop ]]; do
echo "Enter one of the following actions or press CTRL-D to exit."
echo "C - create a new item"
echo "R - read an existing item"
echo "U - update an existing item"
echo "D - delete an existing item"

read action

case "$action" in

[Cc])
echo "Enter item details: "
read -p "Item number (four digit integer): " item_number
read -p "Simple name (string with no whitespace): " simple_name
read -p "Item name(string): " item_name
read -p "Current quantity(integer): " current_quantity
read -p "Maximum quantity (integer): " max_quantity
read -p "Description (string): " description

if [[ -e "data/$item_number.item" ]]; then
echo "ERROR: item already exists"
else
echo "$simple_name $item_name" > "data/$item_number.item"
echo "$current_quantity $max_quantity" >> "data/$item_number.item"
echo "$description" >> "data/$item_number.item"
echo "CREATED: $simple_name - $(date)" >> "data/queries.log"

fi
;;

[Rr])
read -p "Enter an item number" item_number
if [[ -e "data/$item_number.item" ]]; then
cat < data/$item_number.item
else
echo "ERROR: item not found"

fi
;;

[Uu])
read -p "Enter item number to update: " item_number

if [[ -e "data/$item_number.item" ]]; then
read -p "Simple name (string with no whitespace): " simple_name
read -p "Item name (string): " item_name
read -p "Current quantity (integer): " current_quantity
read -p "Maximum quantity(integer): " max_quantity
read -p "Description (string): " description

echo "$simple_name $item_name" > "data/$item_number.item"
echo "$current_quantity $max_quantity" >> "data/$item_number.item"
echo "$description" >> "data/$item_number.item"
echo "UPDATED: $simple_name - $(date)" >> "data/queries.log"
else
echo "ERROR: item not found"
fi
;;

[Dd])
read -p "Enter an item number: " item_number
if [[ -e "data/$item_number.item" ]]; then
rm "data/$item_number.item"
echo "DELETED: $item_number - $(date)" >> "data/queries.log"
echo "$item_number was successfully deleted"
else
echo "ERROR: item not found"
fi
;;

*)
echo "ERROR: invalid option"
;;

esac
done
