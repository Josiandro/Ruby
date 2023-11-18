# Arquivo ruby com a aplicação de inteface com o usuário do jogo
# ----------------------------------------------------------------
# 
# Método que avisa sobre a palavra estar sendo escolhida
def avisa_escolhendo_palavra
    puts "Escolhendo uma palavra secreta..."
end

# Método que avisa sobre a palavra já ter sido escolhida
def avisa_palavra_escolhida(palavra_secreta)
    puts "Palavra secreta com #{palavra_secreta.size} letras... boa sorte!"
    return palavra_secreta
end

# Método que dá boas vindas e solicita o nome do jogador
def da_boas_vindas
    puts "Bem vindo ao jogo da forca"
    print "Qual é o seu nome? "
    nome = STDIN.gets.chomp
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
end

# Método que questiona se o usuário quer jogar novamente
def jogar_novamente
    print "Deseja jogar novamente [S/N]: "
    resposta = STDIN.gets.chomp
    return "nao" if resposta.upcase == "N"
end

# Método com o cabeçalho da tentativa de chute
def cabecalho_de_tentativas(erros, chutes, mascara)
    puts "\n\n\n\n"
    puts "Palavra secreta: #{mascara}"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
end

# Método que recebe o chute/palpite do jogador e retorna ele
def pede_um_chute
    puts "Entre com uma letra ou uma palavra"
    chute = STDIN.gets.chomp.downcase
    puts "Será que acertou? Você chutou #{chute}"
    return chute
end

# Método que retona se o usuário já chutou a mesma letra antes
def avisa_chute_efetuado(chute)
    puts "Você já chutou a letra #{chute}"
end

# Método que retorna se a letra não foi encontrada
def avisa_letra_nao_encontrada
    puts "Letra não encontrada."
end

# Método que retorna se a letra foi encontrada
def avisa_letra_encontrada(total_encontrado)
    puts "Letra encontrada #{total_encontrado} vezes."
end

# Método que retorna se acertou a palavra
def avisa_acertou_palavra
    puts "Parabéns! Acertou"
end

# Método que retorna se errou a palavra
def avisa_errou_palavra
    puts "Que pena... errou"
end

# Método que retorna os pontos até agora
def avisa_pontos(pontos_ate_agora)
    puts "Você ganhou #{pontos_ate_agora} pontos."
end