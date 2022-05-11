/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   philo.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aoteo-be <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/20 15:37:12 by aoteo-be          #+#    #+#             */
/*   Updated: 2022/01/21 13:58:40 by                  ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "./include/philo.h"

/*void	leaks(void)
{
	system("leaks -q philo");
}*/

static void	*actions(void *philosophers)
{
	t_philo	*phi;

	phi = (t_philo *) philosophers;
	while (phi->com->end == 0)
	{
		if (phi->id % 2 == 0)
			usleep(500);
		forking_a(phi);
		forking_b(phi);
		pst(1, *phi);
		phi->last_meal = time_stm();
		if (phi->times_must_eat > -1)
		{
			phi->com->repeat++;
			if (phi->com->repeat == phi->com->diners * phi->com->rations)
				phi->com->end = phi->id;
		}
		ft_sleep(phi->com->time_to_eat);
		pthread_mutex_unlock(&phi->m_fork);
		pthread_mutex_unlock(&(phi->prev_phi->m_fork));
		pst(2, *phi);
		ft_sleep(phi->com->time_to_sleep);
		pst(3, *phi);
	}
	return (NULL);
}

static void	init_phi(t_input *input, t_philo *phi, int *forks)
{
	int	i;

	i = 0;
	while (i < input->diners)
	{
		phi[i].id = i + 1;
		phi[i].com = input;
		phi[i].last_meal = 0;
		phi[i].times_must_eat = phi[i].com->rations;
		phi[i].r_fork = &forks[i];
		if (i == 0)
		{
			phi[i].l_fork = &forks[input->diners - 1];
			phi[i].prev_phi = &phi[input->diners - 1];
		}
		else
		{
			phi[i].l_fork = &forks[i - 1];
			phi[i].prev_phi = &phi[i - 1];
		}
		pthread_mutex_init(&phi[i].m_fork, NULL);
		i++;
	}
}

static void	manage_threads(t_input *input, t_philo *phi)
{
	int	i;
	int	j;

	while (input->end == 0)
	{
		i = 0;
		pthread_mutex_lock(&input->m_death);
		if (input->repeat == input->rations * input->diners
			|| time_stm() - phi[i].last_meal > input->time_to_die)
		{
			input->end = phi[i].id;
			if (time_stm() - phi[i].last_meal > input->time_to_die)
				pst(4, phi[i]);
			j = -1;
			while (++j < phi->com->diners && input->end == 0)
				pthread_join(phi[j].phi_th, NULL);
			break ;
		}
		if (++i == input->diners)
			i = 0;
		pthread_mutex_unlock(&input->m_death);
	}
}

int	main(int argc, char *argv[])
{
	int			i;
	int			*forks;
	t_input		*input;
	t_philo		*phi;

	input = (t_input *)(malloc(sizeof(t_input)));
	if (input == NULL || parse_input(argc, argv, input) || input->diners == 0)
		return (clean_input(input));
	forks = malloc(input->diners * sizeof(int));
	phi = malloc(input->diners * sizeof(t_philo));
	if (manage_memory(phi, forks, input) != 0)
		return (-1);
	init_phi(input, phi, forks);
	if (input->diners == 1)
	{
		pst(0, *phi);
		ft_sleep(input->time_to_die);
		pst(4, *phi);
		return(free_all(phi, forks, input));
	}
	i = -1;
	while (++i < input->diners && input->end == 0)
		pthread_create(&phi[i].phi_th, NULL, actions, (void *) &phi[i]);
	manage_threads(input, phi);
	return (0);
}
