# Método que lista os dados iniciais do jogo
def da_boas_vindas
    puts "Bem vindo ao jogo da forca"
    print "Qual é o seu nome? "
    nome = STDIN.gets.chomp
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
end

# Método que define a palavra secreta
def escolhe_palavra_secreta
    puts "Escolhendo uma palavra secreta..."
    palavra_secreta = "programador"
    puts "Palavra secreta com #{palavra_secreta.size} letras... boa sorte!"
    return palavra_secreta
end

# Método que questiona se o usuário quer jogar novamente
def jogar_novamente
    print "Deseja jogar novamente [S/N]: "
    resposta = STDIN.gets.chomp
    return "nao" if resposta.upcase == "N"
end

# Método que pede um chute para o usuário
def pede_um_chute(erros, chutes)
    puts "\n\n\n\n"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
    puts "Entre com uma letra ou uma palavra"
    chute = STDIN.gets.chomp
    puts "Será que acertou? Você chutou #{chute}"
    return chute
end

# Método que executa o jogo
def joga(nome)
    palavra_secreta = escolhe_palavra_secreta
    erros = 0
    chutes = []
    pontos_ate_agora = 0

    # Laço que controla as tentativas, acima de cinco, o usuário perdeu o jogo
    while erros < 5
        chute = pede_um_chute(erros, chutes.join(", "))
        chutes.push(chute)
        # chutou_uma_letra recebe true se a variável chute recebeu apenas uma letra
        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            letra_procurada = chute[0]
            total_encontrado = 0
            for i in 0..(palavra_secreta.size-1) do
                if palavra_secreta[i] == letra_procurada
                    total_encontrado += 1
                end
            end
            if total_encontrado != 0
                puts "Letra encontrada #{total_encontrado} vezes."
            else
                puts "Letra encontrada."
                erros += 1
            end
        else
            # acertou recebe true se o chute (palavra) foi igual a palavra_secreta
            acertou = chute == palavra_secreta
            if acertou
                puts "Parabéns! Acertou"
                pontos_ate_agora += 100
                break
            else
                puts "Que pena... errou"
                pontos_ate_agora -= 30
                erros += 1
            end
        end
    end

    puts "Você ganhou #{pontos_ate_agora} pontos."
end

# Varíavel nome recebendo o método da_boas_vindas
nome = da_boas_vindas


# Loop que fica executando o jogo
loop do
    joga(nome)
    break if jogar_novamente == "nao"
end