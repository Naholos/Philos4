# aoteo-be@student.42madrid.com

# Estos tests son solo para versión obligatoria de philosophers.

clear
echo "*********************************************************************"
echo "*                 Tests Philosophers                                *"
echo "*********************************************************************"

echo "$(tput setaf 3)*****************************************************"
echo "*             Pruebas de Makefile                   *"
echo "*****************************************************"

echo "$(tput setaf 5)1) Se ejecuta make"
echo "$(tput setaf 8)\c"
make
read foo

echo "$(tput setaf 5)2) Se ejecuta make de nuevo"
echo "$(tput setaf 8)\c"
make
read foo

echo "$(tput setaf 5)3) Se ejecuta make re"
echo "$(tput setaf 8)\c"
make re
read foo

echo "$(tput setaf 5)\n4) Se ejecuta make clean"
echo "$(tput setaf 8)\c"
make clean
read foo

echo "$(tput setaf 5)5) Se ejecuta make fclean"
echo "$(tput setaf 8)\c"
make fclean
read foo

echo "$(tput setaf 5)6) Se ejecuta make una vez más para comenzar las pruebas"
echo "$(tput setaf 8)\c"
make
read foo

echo "$(tput setaf 3)*****************************************************"
echo "*             Pruebas de la norma                   *"
echo "*****************************************************"

echo "$(tput setaf 5)1) Sobre ficheros fuente"
echo "$(tput setaf 8)\c"
norminette *.c
read foo

echo "$(tput setaf 5)2) Sobre ficheros cabecera"
echo "$(tput setaf 8)\c"
norminette ./include/*.h
read foo

echo "$(tput setaf 3)*****************************************************"
echo "*            Errores en uso del programa            *"
echo "*****************************************************"

echo "$(tput setaf 5)\n1) Prueba sin parámetros de entrada: ./philo"
echo "$(tput setaf 8)\c"
./philo
read foo

echo "$(tput setaf 5)\n2) Prueba con menos de 4 parámetros de entrada: ./philo 5 800 200"
echo "$(tput setaf 8)\c"
./philo 5 800 200
read foo

echo "$(tput setaf 5)\n3) Prueba con más de 5 parámetros de entrada: ./philo 5 800 200 200 1 2"
echo "$(tput setaf 8)\c"
./philo 5 800 200 200 1 200
read foo

echo "$(tput setaf 5)\n4) Prueba con parámetros no numéricos (1): ./philo 5 80A 200 200 1"
echo "$(tput setaf 8)\c"
./philo 5 80A 200 200 1
read foo

echo "$(tput setaf 5)\n5) Prueba con parámetros no numéricos (2): ./philo 5 800 200 B 1"
echo "$(tput setaf 8)\c"
./philo 5 B 200 200 1
read foo

echo "$(tput setaf 5)\n6) Prueba con parámetros negativos (1): ./philo 5 800 200 -200 1"
echo "$(tput setaf 8)\c"
./philo 5 800 200 -200 1
read foo

echo "$(tput setaf 5)\n7) Prueba con parámetros negativos (2): ./philo -5 800 200 200 1"
echo "$(tput setaf 8)\c"
./philo -5 800 200 200 1
read foo

echo "$(tput setaf 5)\n8) Prueba con parámetros negativos (3): ./philo 5 800 200 200 -1"
echo "$(tput setaf 8)\c"
./philo 5 800 200 200 -1
read foo
echo "\n"

echo "$(tput setaf 3)*****************************************************"
echo "*   Distintas format de meter los datos de entrada  *"
echo "*****************************************************"

echo "$(tput setaf 5)\n1) Prueba con parámetros de entrada agrupados en distintas formas (1): ./philo  '+5 800 200'    +200 1"
echo "$(tput setaf 8)\c"
./philo  "+5 800 200"    +200 1
read foo

echo "$(tput setaf 5)\n2) Prueba con parámetros de entrada agrupados en distintas formas (2): ./philo  '   5 800' ' 200 200 1"
echo "$(tput setaf 8)\c"
./philo  "   5 800" " 200 200 1"
read foo

echo "$(tput setaf 3)*****************************************************"
echo "*                 Casos especiales                  *"
echo "*****************************************************"

echo "$(tput setaf 5)\n1) Prueba con 0 filósofos: ./philo 0 800 200 200"
echo "$(tput setaf 8)\c"
./philo 0 800 200 200
read foo

echo "$(tput setaf 5)\n2) Prueba con 0 filósofos y 2 raciones: ./philo 0 800 200 200 2"
echo "$(tput setaf 8)\c"
./philo 0 800 200 200 2
read foo

echo "$(tput setaf 5)\n3) CASO PROPUESTO EN LA CORRECCIÓN: Prueba con 1 filósofo y raciones sin límite: ./philo 1 800 200 200"
echo "$(tput setaf 8)\c"
./philo 1 800 200 200
read foo

echo "$(tput setaf 5)\n4) Prueba con 1 filósofo y 5 raciones: ./philo 1 800 200 200 5"
echo "$(tput setaf 8)\c"
./philo 1 800 200 200
read foo

echo "$(tput setaf 3)*****************************************************"
echo "*            Pruebas generales cortas               *"
echo "*****************************************************"

echo "$(tput setaf 5)\n1) CASO PROPUESTO EN LA CORRECCIÓN: Prueba con 5 filósofos, 7 raciones. Deben sobrevivir: ./philo 5 800 200 200 7"
echo "$(tput setaf 8)\c"
read foo
./philo 5 800 200 200 7
read foo

echo "$(tput setaf 5)\n2) Prueba con 2 filósofos, 2 raciones (1). Deben sobrevivir: ./philo 2 130 60 60 2"
echo "$(tput setaf 8)\c"
read foo
./philo 2 130 60 60 2
read foo

echo "$(tput setaf 5)\n3) Prueba con 2 filósofos, 2 raciones (2). Deben sobrevivir: ./philo 2 410 200 200 2"
echo "$(tput setaf 8)\c"
read foo
./philo 2 410 200 200 2
read foo

echo "$(tput setaf 5)\n4) Prueba con 2 filósofos, 2 raciones. Debe morir uno: ./philo 2 110 60 60 2"
echo "$(tput setaf 8)\c"
read foo
./philo 2 110 60 60 2
read foo

echo "$(tput setaf 5)\n5) Prueba con 2 filósofos, sin límite de raciones. Debe morir uno: ./philo 2 110 60 60 "
echo "$(tput setaf 8)\c"
read foo
./philo 2 110 60 60
read foo

echo "$(tput setaf 5)\n6) Prueba con 3 filósofos, con 2 raciones (1). Debe morir uno: ./philo 3 130 60 60 2"
echo "$(tput setaf 8)\c"
read foo
./philo 3 130 60 60 2

echo "$(tput setaf 5)\n7) Prueba con 3 filósofos, con 2 raciones (2). Debe morir uno: ./philo 3 130 100 100 2"
echo "$(tput setaf 8)\c"
read foo
./philo 3 130 100 100 2
read foo

echo "$(tput setaf 5)\n8) Prueba con 3 filósofos, sin límite de raciones (1). Debe morir uno: ./philo 3 130 60 60"
echo "$(tput setaf 8)\c"
read foo
./philo 3 130 60 60
read foo

echo "$(tput setaf 5)\n9) Prueba con 3 filósofos, sin límite de raciones (2). Debe morir uno: ./philo 3 130 100 100"
echo "$(tput setaf 8)\c"
read foo
./philo 3 130 100 100
read foo

echo "$(tput setaf 5)\n10) Prueba con 3 filósofos, con 4 raciones (2). Debe morir uno: ./philo 3 130 100 100 4"
echo "$(tput setaf 8)\c"
read foo
./philo 3 300 100 100 4
read foo

echo "$(tput setaf 5)\n11) Prueba con 4 filósofos, con 2 raciones (1). Deben sobrevivir: ./philo 4 410 200 200 2"
echo "$(tput setaf 8)\c"
read foo
./philo 4 410 200 200 2
read foo

echo "$(tput setaf 5)\n12) Prueba con 4 filósofos, con 2 raciones (2). Debe morir uno: ./philo 4 310 200 100 2"
echo "$(tput setaf 8)\c"
read foo
./philo 4 310 200 100 2
read foo

echo "$(tput setaf 5)\n13) Prueba con 6 filósofos, con 2 raciones (2). Deben sobrevivir: ./philo 6 800 200 100 2"
echo "$(tput setaf 8)\c"
read foo
./philo 6 800 200 100 2
read foo

echo "$(tput setaf 5)\n14) CASO PROPUESTO EN LA CORRECCIÓN: Prueba con 4 filósofos, sin límite de raciones. Debe morir uno: ./philo 4 310 200 100"
echo "$(tput setaf 8)\c"
read foo
./philo 4 310 200 100
read foo
