# Função que dá boas vindas ao jogador
def da_boas_vindas
    puts '================================'
    puts '       JOGO DA ADVINHAÇÃO       '
    puts '================================'
    print 'Qual é o seu nome? '
    nome = STDIN.gets.chomp
    puts "\nOk! Vamos começar o jogo para você, #{nome}."
end

# Função que faz o sorteio do número e retorna o número sorteado
def sorteia_numero_secreto
    puts 'O computador está escolhendo um número entre 0 e 200.'
    sorteado = 175
    puts '...'
    puts 'Escolhido. Agora você precisa advinhar que número é esse.'
    return sorteado
end

# Função que pede um número para o usuário e depois retorna esse número
def pede_um_numero(tentativa, limite_tentativas)
    puts "\nTentativa #{tentativa} de #{limite_tentativas}"
    print 'Qual número você acha que foi o escolhido? '
    chute = STDIN.gets.chomp.to_i
    puts "Seu palpite foi #{chute}"
    return chute
end

# Função que verifica se o usuário acertou o número sorteado
def verifica_se_acertou(chute, numero_secreto)
    # acertou recebe true ou false
    acertou = numero_secreto == chute
    if acertou
        puts 'Você acertou!'
        return true
    else
        # maior recebe true ou false
        maior = chute < numero_secreto
        if maior
            puts 'O número é maior!'
            return false
        else
            puts 'O número é menor!'
            return false
        end
    end  
end

da_boas_vindas

numero_secreto = sorteia_numero_secreto

# Variável que guarda o limite de tentativas
limite_tentativas = 5

# Laço que vai aceitar as tentativas do usuário
for tentativa in 1..limite_tentativas do
    chute = pede_um_numero(tentativa, limite_tentativas)
    if verifica_se_acertou(chute, numero_secreto)
        break
    end
end
