# Método inicial que dá boas vindas para o jogador
def da_boas_vindas
    puts '================================'
    puts '       JOGO DA ADVINHAÇÃO       '
    puts '================================'
    print 'Qual é o seu nome? '
    nome = STDIN.gets.chomp
    puts "\nOk! Vamos começar o jogo para você, #{nome}."
end

# Método que faz o sorteio do número secreto
def sorteia_numero_secreto
    puts 'O computador está escolhendo um número entre 0 e 200.'
    sorteado = 175
    puts '...'
    puts 'Escolhido. Agora você precisa advinhar que número é esse.'
    # Retorna o número sorteado
    return sorteado
end

# Método que pede um número para o usuário
def pede_um_numero(tentativa, limite_tentativas)
    puts "\nTentativa #{tentativa} de #{limite_tentativas}"
    print 'Qual número você acha que foi o escolhido? '
    chute = STDIN.gets.chomp.to_i
    puts "Seu palpite foi #{chute}"
    return chute
end

# Chamada do método inicial do jogo
da_boas_vindas

# numero_secreto recebendo o retorno do método sorteia_numero_secreto
numero_secreto = sorteia_numero_secreto

# Limite de tentativas que será usado no laço
limite_tentativas = 5

# Laço que vai aceitar as tentativas do usuário
for tentativa in 1..limite_tentativas do
    # Chamada do método que pede um número para o usuáro
    chute = pede_um_numero(tentativa, limite_tentativas)

    # Verificar se o usuário acertou o número e grava true ou false na variável
    acertou = numero_secreto == chute

    # Se acertou, retorna a mensagem e interrompe o laço
    if acertou
        puts 'Você acertou!'
        break
    else
        maior = chute < numero_secreto
        if maior
            puts 'O número é maior!'
        else
            puts 'O número é menor!'
        end
    end  
end
