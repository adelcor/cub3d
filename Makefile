SHELL = /bin/zsh
NAME = cub3d

FILES = cubed

SRCS = $(addsufix .c, $(FILES))
OBJS = $(addsufix .o, $(FILES))

all: $(NAME)

$(NAME): $(OBJS)

%.o:%.c
	$(CC) $(FLAGS) $(MINILIB) -c -o $< $@

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: clean re

.PHONY: all %.o clean fclean re