/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   philo_utils.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aoteo-be <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/13 13:06:03 by aoteo-be          #+#    #+#             */
/*   Updated: 2022/04/21 16:39:28 by aoteo-be         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "./include/philo.h"

long	get_time_ms(void)
{
	struct timeval	time;

	gettimeofday(&time, NULL);
	return (time.tv_sec * 1000 + time.tv_usec / 1000);
}

long	time_stm(void)
{
	static long		timebase;

	if (timebase == 0)
		timebase = get_time_ms();
	return (get_time_ms() - timebase);
}

void	ft_sleep(long ms)
{
	long	start;

	start = get_time_ms();
	while ((get_time_ms() - start) < ms)
		usleep(500);
}

void	pst(int st, t_philo phi)
{
	pthread_mutex_unlock(&phi.com->m_print);
	if (phi.com->repeat != phi.com->rations * phi.com->diners)
	{
		if (st == 0 && phi.com->end == 0)
			printf(SKY FORK, time_stm(), phi.id);
		else if (st == 1 && phi.com->end == 0)
			printf(GREEN EAT, time_stm(), phi.id);
		else if (st == 2 && phi.com->end == 0)
			printf(YELLOW SLEEP, time_stm(), phi.id);
		else if (st == 3 && phi.com->end == 0)
			printf(BLUE THINK, time_stm(), phi.id);
		else if (st == 4)
			printf(RED DIE, time_stm(), phi.id);
	}
	pthread_mutex_unlock(&phi.com->m_print);
}
