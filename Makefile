# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cfrancie <cfrancie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/10 02:32:09 by cfrancie          #+#    #+#              #
#    Updated: 2023/05/15 18:11:07 by cfrancie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS = -Wall -Wextra -Werror -O3 -g3
INCS = -I./include -I./lib/minilibx-linux -I./lib/libft
LIBS = -L./lib/minilibx-linux -lmlx_Linux -L/usr/lib -lXext -lX11 -lm -lz -L./lib/libft -lft
NAME = cub3D

SRC =	src/camera_controls.c \
		src/events.c \
		src/init_graphics.c \
		src/main.c \
		src/parser.c \
		src/raycasting.c \
		src/utils.c

OBJS = $(SRC:%.c=./bin/%.o)

all: $(NAME)

$(NAME): $(OBJS)
	@$(MAKE) -C lib/libft
	@$(MAKE) -C lib/minilibx-linux
	$(CC) $(CFLAGS) $(INCS) -o $@ $^ $(LIBS)

./bin/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $(INCS) -c $< -o $@

clean:
	@rm -rf ./bin
	@$(MAKE) -C lib/libft clean
	@$(MAKE) -C lib/minilibx-linux clean

fclean: clean
	@rm -f $(NAME)
	@$(MAKE) -C lib/libft fclean

re: fclean all

leaks: all
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./cub3D

.PHONY: all clean fclean re leaks