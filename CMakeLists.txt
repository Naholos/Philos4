cmake_minimum_required(VERSION 3.20)
project(philo C)

set(CMAKE_C_STANDARD 99)

set(CC_COVERAGE_COMPILE_FLAGS "-Wall -Wextra -Werror -pthread")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CC_COVERAGE_COMPILE_FLAGS}" )

add_executable(philo actions.c ft_atoi.c ft_split.c ft_strjoin.c memory_management.c parsing.c philo.c philo_utils.c)
