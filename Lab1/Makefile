# Компилятор и флаги предупреждений
CC = gcc
CFLAGS = -Wall -Wextra  # -Wall: все предупреждения, -Wextra: дополнительные проверки

# Исходные файлы и имя итогового исполняемого файла
SRC = src/main.c src/factorial.c
TARGET = factorial

# Цель по умолчанию (выполняется при вводе команды make без аргументов)
all: $(TARGET)

# Правило сборки основной программы
$(TARGET): $(SRC) src/factorial.h
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

# Правило сборки версии с fork() и pipe() (параллельные процессы)
pipe_version: src/main_pipe.c src/factorial.c src/factorial.h
	$(CC) $(CFLAGS) src/main_pipe.c src/factorial.c -o factorial_pipe

# Генерация ассемблерного кода с разными уровнями оптимизации
asm:
	$(CC) -S -O0 src/factorial.c -o factorial_O0.s
	$(CC) -S -O2 src/factorial.c -o factorial_O2.s
	$(CC) -S -O3 src/factorial.c -o factorial_O3.s

# Очистка проекта от собранных файлов и артефактов компиляции
clean:
	rm -f $(TARGET) factorial_pipe *.o *.s

# Быстрый запуск основной программы после сборки
run: $(TARGET)
	./$(TARGET)

# Указание, что следующие цели не являются реальными файлами на диске
.PHONY: all asm clean run pipe_version
