# Função que dá boas vindas ao jogador
def da_boas_vindas
    puts '================================'
    puts '       JOGO DA ADVINHAÇÃO       '
    puts '================================'
    print 'Qual é o seu nome? '
    nome = STDIN.gets.chomp.to_s
    puts "\nOk! Vamos começar o jogo para você, #{nome}."
    return nome.upcase
end

# Função que pede para o usuário escolher a dificuldade do jogo
def pede_dificuldade
    puts "\nQual o nível de dificuldade que deseja? (1-Fácil, 5-Difícil)"
    dificuldade = gets.chomp.to_i
    return dificuldade
end

# Função que faz o sorteio do número e retorna o número sorteado
def sorteia_numero_secreto(dificuldade)
    # Laço Case When definindo o intervalo do sorteio
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end
    puts "O computador está escolhendo um número entre 1 e #{maximo}."
    # Sorteio do número aleatório
    sorteado = rand(maximo) + 1
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

# Método que exectua o jogo
def joga(nome, dificuldade)
    numero_secreto = sorteia_numero_secreto(dificuldade)

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
        # Bug para ganhar sempre se for o jogador x
        if nome == "JOSIANDRO"
            puts 'Você acertou!'
            break
        end
        # Pontos descontados, caso o chute do usuário esteja errado (.abs é um método que devolve o número sem sinal)
        pontos_a_perder = (chute - numero_secreto).abs / 2.0
        pontos_ate_agora -= pontos_a_perder
        # Testa se o usuário acertou
        if verifica_se_acertou(chute, numero_secreto)
            break
        end
    end

    puts "Você ganhou #{pontos_ate_agora} pontos."
end

# Método que questiona se o usuário quer jogar novamente
def quer_jogar
    print "Deseja jogar novamente? (S/N)"
    quero_jogar = STDIN.gets.chomp.to_s
    return quero_jogar.upcase
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

# Laço que chama o método do jogo, caso o usuário queria jogar
loop do
    joga(nome, dificuldade)
    break if quer_jogar.upcase != "S"
end