#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

count="$($PSQL "SELECT COUNT(*) FROM services")"

function print_services {
  $PSQL "SELECT * FROM services" | while read row
  do
    echo $row | sed 's/|/\) /g'
  done
}

print_services
SERVICE_ID_SELECTED=$(($count + 1))

while (( SERVICE_ID_SELECTED > count ))
do
  read SERVICE_ID_SELECTED

  if [[ $((SERVICE_ID_SELECTED)) != $SERVICE_ID_SELECTED ]] 
  then
    SERVICE_ID_SELECTED=$(($count + 1))
  fi

  if (( SERVICE_ID_SELECTED > count ))
  then
    print_services
  fi
done

read CUSTOMER_PHONE

phoneCheck="$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")"

if [ -z $phoneCheck ]
then
  read CUSTOMER_NAME

  $PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');"
else
  CUSTOMER_NAME="$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")"
fi

customerID="$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")"

read SERVICE_TIME

$PSQL "INSERT INTO appointments (customer_id, service_id, time) 
  VALUES ('$customerID', $SERVICE_ID_SELECTED, '$SERVICE_TIME');"

serviceName="$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED';")"

echo "I have put you down for a $serviceName at $SERVICE_TIME, $CUSTOMER_NAME."
