/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   philo.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aoteo-be <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/20 15:15:38 by aoteo-be          #+#    #+#             */
/*   Updated: 2022/04/21 16:21:28 by aoteo-be         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PHILO_H
# define PHILO_H
# include <stdio.h>
# include <stdlib.h>
# include <pthread.h>
# include <sys/time.h>
# include <string.h>
# include <unistd.h>

# define SKY "\x1b[36m"
# define GREEN "\x1b[32m"
# define YELLOW "\x1b[33m"
# define BLUE "\x1b[34m"
# define RED "\x1b[31m"

# define FORK "%lu ms, %d has taken a fork.\n"
# define EAT "%lu ms, %d is eating.\n"
# define SLEEP "%lu ms, %d is sleeping.\n"
# define THINK "%lu ms, %d is thinking.\n"
# define DIE "%lu ms, %d has died.\n"

typedef struct s_input
{
	int				end;
	int				diners;
	long			time_to_die;
	long			time_to_eat;
	long			time_to_sleep;
	long long		rations;
	long long		repeat;
	pthread_mutex_t	m_print;
	pthread_mutex_t	m_death;
}	t_input;

typedef struct s_philo
{
	int				id;
	int				*l_fork;
	int				*r_fork;
	long long		times_must_eat;
	pthread_mutex_t	m_fork;
	pthread_t		phi_th;
	struct s_philo	*prev_phi;
	long			last_meal;
	t_input			*com;
}	t_philo;

int		clean_input(t_input *input);
void	forking_a(t_philo *phi);
void	forking_b(t_philo *phi);
int		free_all(t_philo *phi, int *forks, t_input *input);
void	*ft_memcpy(void *dst, const void *src, size_t n);
int		ft_atoi(const char *nptr);
void	ft_sleep(long waiting_time);
char	**ft_split(char const *s, char c);
char	*ft_strdup(const char *s1);
char	*ft_strjoin(char const *s1, char const *s2);
long	get_time_ms(void);
long	time_stm(void);
int		manage_memory(t_philo *phi, int *forks, t_input *input);
int		parse_input(int argc, char *argv[], t_input *input);
void	pst(int st, t_philo phi);

#endif
