# aoteo-be@student.42madrid.com

# Estos tests son solo para versión obligatoria de philosophers.

clear
echo "*********************************************************************"
echo "*                 Tests Philosophers                                *"
echo "*********************************************************************"


echo "$(tput setaf 5)\n1) Prueba con 3 filósofos, sin límite de raciones. Deben sobrevivir: ./philo 3 300 100 100"
echo "$(tput setaf 8)\c"
read foo
./philo 3 300 100 100
read foo
