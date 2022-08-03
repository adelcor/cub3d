SHELL = /bin/zsh
NAME = cub3d

# COMPILATION RELATED VARIABLES #
CC = clang
RM = rm -rf
CFLAGS = -Wall -Werror -Wextra -g3
SANITIZE = -fsanitize=address
#################################

### MINILIB REALTED VARIABLES ###
MINILIB = include/minilib/
FRAMEWORK = -framework OpenGL -framework AppKit
#################################

#### FILES RELATED VARIABLES ####
FILES = cubed \

SRCS = $(addsuffix .c, $(FILES))
OBJS = $(addsuffix .o, $(FILES))
#################################

.SILENT:

all: $(NAME)

$(NAME): $(OBJS)
	echo "Creating Executables"
	$(MAKE) -C $(MINILIB) 
	$(CC) $(CFLAGS) $(OBJS) -L $(MINILIB) -lmlx $(FFLAGS) -o $(NAME)

.c.o: $(SRCS)
	echo "Creating Objects"
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	echo "Removing Objects"
	$(MAKE) -C $(MINILIB) clean
	$(RM) $(OBJS)

fclean: clean
	echo "Removing Executables"
	$(RM) $(NAME)
	$(RM) $(MINILIB)libmlx.a

re: clean all

.PHONY: all re clean fclean