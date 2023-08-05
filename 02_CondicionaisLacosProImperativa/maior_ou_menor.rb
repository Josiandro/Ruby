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

def validador(chute, numero_secreto)
    # Verifica se o usuário acertou o número sorteado
    acertou = numero_secreto == chute

    if acertou
        puts 'Você acertou!'
    else
        maior = chute < numero_secreto
        if maior
            puts 'O número é maior!'
        else
            puts 'O número é menor!'
        end
    end
end

# Aceitação das tentativas de advinhação
(1..3).each do |nro_tentativa| 
    puts "\nTentativa #{nro_tentativa}"
    print 'Qual número você acha que foi o escolhido? '
    chute = STDIN.gets.chomp.to_i
    puts "Seu palpite foi #{chute}"

    validador(chute, numero_secreto)
end


