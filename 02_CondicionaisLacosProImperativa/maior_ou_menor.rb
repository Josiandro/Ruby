# Cabeçalho do jogo e aceitação do usuário
puts '================================'
puts '       JOGO DA ADVINHAÇÃO       '
puts '================================'
print 'Qual é o seu nome? '
nome = STDIN.gets.chomp

# Mensagem inicial
puts "\nOk! Vamos começar o jogo para você, #{nome}."

# Mensagem de processamento/escolha do número
puts 'O computador está escolhendo um número entre 0 e 200.'
numero_secreto = 175
puts '...'
puts 'Escolhido. Agora você precisa advinhar que número é esse.'

# Limite de tentativas que será usado no laço
limite_tentativas = 5

# Laço que vai aceitar as 3 tentativas do usuário
for tentativa in 1..limite_tentativas do
    # Tentativas do usuário
    puts "\nTentativa #{tentativa} de #{limite_tentativas}"
    print 'Qual número você acha que foi o escolhido? '
    chute = STDIN.gets.chomp.to_i
    puts "Seu palpite foi #{chute}"

    # Verificar se o usuário acertou o número e grava true ou false na variável
    acertou = numero_secreto == chute

    # Se acertou, retorna a mensagem e interrompe o laço
    if acertou
        puts 'Você acertou!'
        break if acertou
    else
        maior = chute < numero_secreto
        if maior
            puts 'O número é maior!'
        else
            puts 'O número é menor!'
        end
    end  
end
