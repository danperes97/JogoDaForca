def da_boas_vindas
  puts "/****************/"
  puts "/ Jogo da Forca */"
  puts "/****************/"
  print "Qual o seu nome?: "
  nome = gets.strip
  puts "\n\n\n\n\n\n"
  puts "Começaremoms o jogo para você, #{nome}"

  nome
end

def da_parabens_campeao(nome, pontos)
  puts "Parabéns #{nome} você é o novo recordista com #{pontos}!"
end

def quebra_de_recorde(recorde_antigo)
  puts "Parabéns você quebrou seu recorde! de: #{recorde_antigo}"
end

def mostra_numero_acertos(acertos)
  puts "Você acertou: #{acertos} vezes."
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip

  nao_quero_jogar = quero_jogar.upcase == "N"
end

def desenha_forca(erros)
  cabeca = "  "
  corpo = " "
  pernas = "  "
  bracos = "  "

  if erros >= 1
     cabeca = "(_)"
  end
  if erros >= 2
    bracos = " | "
    corpo = "|"
  end
  if erros >= 3
    bracos = "\\|/"
  end
  if erros >= 4
    pernas = "/ \\"
  end

  puts "  _______             "
  puts " |/      |            "
  puts " |      #{cabeca}     "
  puts " |      #{bracos}     "
  puts " |       #{corpo}     "
  puts " |      #{pernas}     "
  puts " |                    "
  puts "_|___                 "
  puts "                      "
end

def pede_um_chute
  print "Entre com a letra ou palavra: "
  chute = gets.strip.downcase
  puts "Será que acertou? Você chutou #{chute}"

  chute
end

def avisa_campeao_atual(dados)
  puts "Nosso campeão atual é #{dados[0]} com #{dados[1]} pontos."
end

def avisa_pontos_totais(pontos)
  puts "Você possui #{pontos} pontos."
end

def avisa_escolhendo_palavra
  puts "Escolhendo uma palavra..."
end

def avisa_palavra_escolhida(palavra_secreta)
  puts "Escolhida uma palavra com #{palavra_secreta.size} letras... Boa sorte!"

  palavra_secreta
end

def mostra_palavra_secreta(palavra_secreta)
  puts "A palavra secreta é: #{palavra_secreta.capitalize}."
end

def avisa_chute_repetido(chute)
  puts "Você já chutou #{chute}."
end

def avisa_letra_nao_encontrada
  puts "Letra não encontrada!"
end

def avisa_letra_encontrada(total_encontrado)
  "Letra encontrada #{total_encontrado} vezes!"
end

def avisa_acertou_palavra
  puts "Parabéns! Acertou!"

  puts "    ___________    "
  puts "   '._==_==_=_.'   "
  puts "   .-\\:      /-.  "
  puts "  | (|:.     |) |  "
  puts "   '-|:.     |-'   "
  puts "     \\::.    /    "
  puts "      '::.  .'     "
  puts "        )  (       "
  puts "      _.'  '._     "
  puts "     '________'    "
end

def avisa_errou_palavra
  puts "Que pena... errou!"
end

def avisa_pontos(pontos_ate_agora)
  puts "Você ganhou #{pontos_ate_agora} pontos."
end

def cabecalho_de_tentativa(chutes, erros, mascara)
  puts "\n\n\n\n"
  desenha_forca(erros)
  puts "Palavra secreta: #{mascara}"
  puts "Erros até agora: #{erros}"
  puts "Chutes até agora: #{chutes}"
end
