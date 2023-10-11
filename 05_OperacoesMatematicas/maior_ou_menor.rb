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
def pede_um_numero(chutes, tentativa, limite_tentativas)
    puts "\nTentativa #{tentativa} de #{limite_tentativas}"
    puts "Tentativas até agora: #{chutes}"
    print 'Qual número você acha que foi o escolhido? '
    chute = STDIN.gets.chomp.to_i
    puts "Seu palpite foi #{chute}"
    return chute
end

# Função que verifica se o usuário acertou o número sorteado
def verifica_se_acertou(chute, numero_secreto)
    # acertou recebe true ou false
    acertou = numero_secreto == chute
    
    # if com implementação do early return
    if acertou
        puts 'Você acertou!'
        return true
    end
    
    # maior recebe true ou false
    maior = chute < numero_secreto
    if maior
        puts 'O número é maior!'
    else
        puts 'O número é menor!'
    end  
    return false
end

da_boas_vindas
numero_secreto = sorteia_numero_secreto

# Variável que guarda os pontos o usuário
pontos_ate_agora = 1000
# Variável que guarda o limite de tentativas
limite_tentativas = 5
# Array que guarda os chutes dados pelo usuário
chutes = []

# Laço que vai aceitar as tentativas do usuário
for tentativa in 1..limite_tentativas do
    # .join é um método da classe array que vai colocar um separador ao fazer a ipressão dos itens do array
    chute = pede_um_numero(chutes.join(', '), tentativa, limite_tentativas)
    # .push é um método da classe array que vai incluir um valor na última posição
    chutes.push(chute)
    # Pontos descontados, caso o chute do usuário esteja errado (.abs é um método que devolve o número sem sinal)
    pontos_a_perder = (chute - numero_secreto).abs / 2.0
    pontos_ate_agora -= pontos_a_perder
    # Testa se o usuário acertou
    if verifica_se_acertou(chute, numero_secreto)
        break
    end
end

puts "Você ganhou #{pontos_ate_agora} pontos."