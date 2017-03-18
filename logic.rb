require_relative "ui"
require_relative "rank"

def joga(nome, acertos)
  palavra_secreta = sorteia_palavra_secreta

  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    mascara = palavra_mascarada(chutes, palavra_secreta)
    chute = pede_um_chute_valido(chutes, erros, mascara)
    chutes << chute

    chutou_uma_letra = chute.size == 1

    if chutou_uma_letra
      contem_letra = palavra_secreta.count(chute[0])
      if contem_letra == 0
        avisa_letra_nao_encontrada
        erros += 1
      else
        avisa_letra_encontrada(contem_letra)
      end
    else
      acertou = chute == palavra_secreta
      if acertou
        acertos += 1
        pontos_ate_agora += 100
        mostra_numero_acertos(acertos)
        break
      else
        pontos_ate_agora -= 30
        erros += 1
        avisa_errou_palavra
      end
    end
    avisa_acertou_palavra
  end
  mostra_palavra_secreta(palavra_secreta)
  avisa_pontos(pontos_ate_agora)

  return [pontos_ate_agora, acertos]
end

def jogo_da_forca
  nome = da_boas_vindas
  pontos_totais = 0
  acertos = 0

  rank = le_rank

  avisa_campeao_atual(rank)

  loop do
    resultado = joga(nome, acertos)
    pontos_totais += resultado[0]
    acertos += resultado[1]

    avisa_pontos_totais(pontos_totais)



    if nao_quer_jogar?
      verifica_recordista(rank, nome, pontos_totais)
      if rank[1].to_i < pontos_totais
        salva_rank(nome, pontos_totais)
      end
      break
    end
  end
end

def verifica_recordista(rank, nome_jogador, pontos_totais)
  nome_recordista = rank[0]
  pontos_recordista = rank[1].to_i

  novo_campeao = nome_recordista != nome_jogador && pontos_totais > pontos_recordista
  quebra_recorde = nome_recordista == nome_jogador && pontos_totais > pontos_recordista

  if novo_campeao
    da_parabens_campeao(nome_jogador, pontos_totais)
  elsif quebra_recorde
    quebra_de_recorde(pontos_recordista)
  end
end

def pede_um_chute_valido(chutes, erros, mascara)
  cabecalho_de_tentativa(chutes, erros, mascara)

  loop do
    chute = pede_um_chute
    if chutes.include?(chute)
      avisa_chute_repetido(chute)
    else
      return chute
    end
  end
end

def palavra_mascarada(chutes, palavra_secreta)
  mascara = ""
  for letra in palavra_secreta.chars
    if chutes.include?(letra)
      mascara += letra
    else
      mascara += "_"
    end
  end
  mascara
end

def sorteia_palavra_secreta
  avisa_escolhendo_palavra
  texto = File.read("dicionario.txt")
  todas_palavras = texto.split("\n")
  numero_aleatorio = rand(todas_palavras.size)
  palavra_secreta = todas_palavras[numero_aleatorio].downcase

  avisa_palavra_escolhida(palavra_secreta)
end
