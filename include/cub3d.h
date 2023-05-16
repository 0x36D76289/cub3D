/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cub3d.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cfrancie <cfrancie@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/10 02:21:19 by cfrancie          #+#    #+#             */
/*   Updated: 2023/05/15 18:11:52 by cfrancie         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef CUB3D_H
# define CUB3D_H

# define WIDTH 600
# define HEIGHT 600

# include "libft.h"  // libft, dprintf
# include "mlx.h"    // minilibx
# include <errno.h>  // perror
# include <fcntl.h>  // open
# include <stdlib.h> // malloc, free, exit
# include <string.h> // strerror
# include <unistd.h> // read, write, close

typedef struct s_window
{
	void	*img;
	char	*addr;
	int		bits_per_pixel;
	int		line_length;
	int		endian;
}			t_window;

enum {
	ON_KEYDOWN = 2,
	ON_KEYUP = 3,
	ON_MOUSEDOWN = 4,
	ON_MOUSEUP = 5,
	ON_MOUSEMOVE = 6,
	ON_EXPOSE = 12,
	ON_DESTROY = 17
};

// init_graphics.c
void	my_mlx_pixel_put(t_window *data, int x, int y, int color);

#endif