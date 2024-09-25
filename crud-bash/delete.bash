read -p "Enter an item number: " item_number

if [[ -e "data/$item_number.item" ]]; then

rm "data/$item_number.item"

echo "DELETED: $item_number - $(date)" >> "data/queries.log"
echo "$item_number was successfully deleted"
else
echo "ERROR: item not found"
fi 
