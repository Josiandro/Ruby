# Cabeçalho do jogo e aceitação do usuário
puts '================================'
puts '       JOGO DA ADVINHAÇÃO       '
puts '================================'
print 'Qual é o seu nome? '
nome = STDIN.gets.chomp

# Mensagem inicial
puts
puts "Ok! Vamos começar o jogo para você, #{nome}."

# Mensagem de processamento/escolha do número
puts 'O computador está escolhendo um número entre 0 e 200.'
numero_secreto = 175
puts '...'
puts 'Escolhido. Agora você precisa advinhar que número é esse.'

# Aceitação das tentativas de advinhação
puts
puts 'Tentativa 1'
print 'Qual número você acha que foi o escolhido? '
chute = STDIN.gets.chomp.to_i
puts "Seu palpite foi #{chute}"

# Comparação dos dois números
if chute == numero_secreto
    puts 'Você acertou!'
else
    puts 'Você errou!'
end