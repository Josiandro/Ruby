# Arquivo ruby com a parte lógica do jogo
# ----------------------------------------------------------------
# 
# Chamada do arquivo ui.rb que tem os métodos/funções de inteface com o usuário
require_relative 'ui.rb'

# Método que define e retorna a palavra secreta
def escolhe_palavra_secreta
    avisa_escolhendo_palavra
    # Faz a leitura do arquivo.txt e guarda tudo na variável texto
    texto = File.read("dicionario.txt")
    todas_as_palavras = texto.split("\n")
    numero_escolhido = rand(todas_as_palavras.size)
    palavra_secreta = todas_as_palavras[numero_escolhido]
    avisa_palavra_escolhida(palavra_secreta)
end

# Método que vai mostrando a palavra secreta, como no jogo da forca
def palavra_mascarada(chutes, palavra_secreta)
    mascara = ""
    for letra in palavra_secreta.chars
        if chutes.include? letra
            mascara.concat("[#{letra}]")
        else
            mascara.concat("[ ]")
        end
    end
    return mascara
end

# Método que controla se o usuário passou um chute válido
def pede_um_chute_valido(erros, chutes, mascara)
    cabecalho_de_tentativas(erros, chutes, mascara)
    loop do
        chute = pede_um_chute
        # Testa se o usuário já chutou essa letra
        if chutes.include?(chute)
            avisa_chute_efetuado(chute)
        else
            return chute
        end
    end
end

# Método que executa o jogo
def joga(nome)
    palavra_secreta = escolhe_palavra_secreta
    erros = 0
    chutes = []
    pontos_ate_agora = 0

    # Laço que controla as tentativas, acima de cinco, o usuário perdeu o jogo
    while erros < 5
        mascara = palavra_mascarada(chutes, palavra_secreta)
        chute = pede_um_chute_valido(erros, chutes.join(", "), mascara)
        chutes.push(chute)
        # chutou_uma_letra recebe true se a variável chute recebeu apenas uma letra
        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            letra_procurada = chute[0]
            total_encontrado = palavra_secreta.count(letra_procurada)
            if total_encontrado == 0
                avisa_letra_nao_encontrada
                erros += 1
            else
                avisa_letra_encontrada(total_encontrado)
            end
        else
            # acertou recebe true se o chute (palavra) foi igual a palavra_secreta
            acertou = chute == palavra_secreta
            if acertou
                avisa_acertou_palavra
                pontos_ate_agora += 100
                break
            else
                avisa_errou_palavra
                pontos_ate_agora -= 30
                erros += 1
            end
        end
    end
    avisa_pontos(pontos_ate_agora)
end

def jogo_da_forca
    # Varíavel nome recebendo o resultado do método da_boas_vindas
    nome = da_boas_vindas
   
    # Loop que controla a execução do jogo, até que o usuário não queira mais jogar
    loop do
        joga(nome)
        break if jogar_novamente == "nao"
    end
end