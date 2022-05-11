# aoteo-be@student.42madrid.com

# Estos tests son solo para versión obligatoria de philosophers.

clear
echo "*********************************************************************"
echo "*                 Tests Philosophers                                *"
echo "*********************************************************************"


echo "$(tput setaf 5)\n1) CASO PROPUESTO EN LA CORRECCIÓN: Prueba con 5 filósofos, sim límite de raciones. Deben sobrevivir: ./philo 5 800 200 200"
echo "$(tput setaf 8)\c"
read foo
./philo 5 800 200 200
read foo
