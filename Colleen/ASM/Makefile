NAME = Colleen

SRC_PATH = .
OBJ_PATH = obj

SRC_NAME = Colleen.s

OBJ_NAME = $(SRC_NAME:.s=.o)

CC = nasm -f macho64
CFLAGS = 

RED=\033[1;31m
GREEN=\033[1;32m
NC=\033[0m

SRC = $(addprefix $(SRC_PATH)/,$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH)/,$(OBJ_NAME))

.PHONY: all, clean, fclean, re

all: $(NAME)

$(NAME): $(OBJ)
	@gcc $^ -o $@

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.s Makefile
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@nasm -f macho64 $< -o $@
	@echo "$(GREEN)[✓]$(NC) Source compiled : $<"

clean:
	@rm -f $(OBJ)
	@rmdir $(OBJ_PATH) 2> /dev/null || true
	@echo "$(RED)[-]$(NC) Objects cleaned"

fclean: clean
	@rm -rf $(NAME)
	@echo "$(RED)[-]$(NC) Program clear"

re:fclean
	@make
