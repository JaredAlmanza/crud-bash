read -p "Enter Item number to update: " item_number

if [[ -e "data/$item_number.item" ]]; then

read -p "Simple name (string with no whitespace): " simple_name
read -p "Item name(string): " item_name
read -p "Current quantity(integer): " current_quantity
read -p "Maximum quantity (integer): " max_quantity
read -p "Description (string): " description

echo "$simple_name $item_name" > "data/$item_number.item"
echo "$current_quantity $max_quantity" >> "data/$item_number.item"
echo "$description" >> "data/$item_number.item"
echo "UPDATED: $simple_name - $(date)" >> "data/queries.log"

else
	echo "ERROR: item not found"
fi
