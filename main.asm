.data
presencas: .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
fim_programa: .asciz "Digite (Finalizar programa = 0; Continuar = 1): "
numero_aula: .asciz "Entre com o número da aula (de 0 a 15): "
numero_aluno: .asciz "Entre com o número do aluno (de 0 a 31): "
tipo_registro: .asciz "Entre com o tipo do registro (presença = 1; ausência = 0): "

.text
addi s3, zero, 1

while:
	# comandos para continuar ou sair do programa
	addi a7, zero, 4 #Informa a operação de escrita de texto
	la a0, fim_programa #Coloca o endereço da string em a0
	ecall

	addi a7, zero, 5
	ecall
	add s4, zero, a0
	
	bne s3, s4, fim_while #comandos para escrever o número da aula no console
	addi a7, zero, 4 #Informa a operação de escrita de texto
	la a0, numero_aula #Coloca o endereço da string em a0
	ecall
	
	# comandos para o número da aula
	addi a7, zero, 5
	ecall
	add s0, zero, a0 # Trasfere o valor lido de a0 para s0
	
	
	
	# comandos para escrever numero do aluno no console
	addi a7, zero, 4 #Informa a operação de escrita de texto
	la a0, numero_aluno #Coloca o endereço da string em a0
	ecall
	
	# comandos para o número do aluno
	addi a7, zero, 5
	ecall
	add s1, zero, a0 # Trasfere o valor lido de a0 para s1
	
	
	
	# comandos para escrever o tipo do registro (ausencia ou presença) no console
	addi a7, zero, 4 #Informa a operação de escrita de texto
	la a0, tipo_registro #Coloca o endereço da string em a0
	ecall
	
	# comandos para o número da aula
	addi a7, zero, 5
	ecall
	add s2, zero, a0 # Trasfere o valor lido de a0 para s2
	
	
	
	
	### COMEÇO DA LÓGICA PARA MANIPULAR O VETOR ###
	
	addi t0, zero, 1
    	sll t1, t0, s1      #coloca o bit 1 na posição s1, que representa o aluno
   	not t2, t1	    #máscara com todos os bits em 1, exceto o bit s1 em 0
   	
   	#Acessar índice do dia
    	la t3, presencas    #endereço base do vetor
    	slli t4, s0, 2      #multiplica s0 (dia) por 4, tendo em vista que a "word" representa 4 bytes
    	add t3, t3, t4      #endereço de presencas[s0]

   	# Carregar, aplicar máscara e salvar de volta
    	lw t5, 0(t3)        #carrega o valor atual do dia
    	and t5, t5, t2      #zera o bit do aluno requisitado
    	sw t5, 0(t3)        #salva o novo valor no vetor



	jal zero, while #loop infinito

fim_while:
	nop
	
	



















