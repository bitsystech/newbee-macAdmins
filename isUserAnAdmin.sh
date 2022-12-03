if groups <username> | grep -q -w admin; 
then 
echo "Is admin"; 
else 
echo "Not admin"; 
fi 