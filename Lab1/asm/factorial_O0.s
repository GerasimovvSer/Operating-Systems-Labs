	.file	"factorial.c"
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
.LFB0:
	.cfi_startproc
	pushq	%rbp                     # Сохраняем указатель базового кадра вызывающей функции
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp               # Устанавливаем новый базовый указатель стека
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)          # Сохраняем аргумент n (передан в %edi по System V ABI)
	movq	$1, -8(%rbp)             # Инициализируем result = 1 (локальная переменная в стеке)
	movl	$1, -12(%rbp)            # Инициализируем счётчик цикла i = 1
	jmp	.L2                        # Переходим сразу к проверке условия (структура while)
.L3:                               # Тело цикла
	movl	-12(%rbp), %eax          # Загружаем i в %eax
	cltq                             # Знаковое расширение i из 32 в 64 бит (подготовка к умножению)
	movq	-8(%rbp), %rdx           # Загружаем текущее значение result в %rdx
	imulq	%rdx, %rax               # result = result * i (64-битное умножение)
	movq	%rax, -8(%rbp)           # Сохраняем обновлённый result обратно в память
	addl	$1, -12(%rbp)            # i++ (инкремент счётчика)
.L2:                               # Проверка условия продолжения цикла
	movl	-12(%rbp), %eax          # Загружаем i в %eax
	cmpl	-20(%rbp), %eax          # Сравниваем i и n
	jle	.L3                        # Если i <= n, повторяем цикл
	movq	-8(%rbp), %rax           # Помещаем итоговый результат в %rax (регистр возврата в Linux)
	popq	%rbp                     # Восстанавливаем исходный указатель базового кадра
	.cfi_def_cfa 7, 8
	ret                              # Возврат из функции
	.cfi_endproc
.LFE0:
	.size	factorial, .-factorial
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
