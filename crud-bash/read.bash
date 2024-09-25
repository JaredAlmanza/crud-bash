read -p "Enter an item number: " item_number
if [[ -e "data/$item_number.item" ]]; then
cat < data/$item_number.item
echo "Item Name: "
echo "Simple Name: "
echo "Item Number: "
echo "Qty: "
echo "Description: "
else
echo "ERROR: item not found"
fi
