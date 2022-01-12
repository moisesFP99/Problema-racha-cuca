main :-
   %% Tempo inicial
    statistics(cputime,T1),

    modelo(  [A1, A2, A3, A4,A5]  ),
    imprime_lista(  [A1, A2, A3, A4,A5]  ),

    %% Tempo final
    statistics(cputime ,T2),
    Tempo_BUSCA is T2 - T1,
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA),
    fail.

main :-
        nl,
        write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
        nl,
        write('........ UFA apos o fail .......').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
modelo([
    (Linha_1, Nome_1, Parente_1, Profissao_1, Signo_1, Comida_1),
    (Linha_2, Nome_2, Parente_2, Profissao_2, Signo_2, Comida_2),
    (Linha_3, Nome_3, Parente_3, Profissao_3, Signo_3, Comida_3),
    (Linha_4, Nome_4, Parente_4, Profissao_4, Signo_4, Comida_4),
    (Linha_5, Nome_5, Parente_5, Profissao_5, Signo_5, Comida_5)
    ]):-


%%%%% Linha
    linha(Linha_1),
    linha(Linha_2),
    linha(Linha_3),
    linha(Linha_4),
    linha(Linha_5),

    %Na segunda posição está a mulher que vai na linha Azul
    (Linha_2==azul) ,

    %Na segunda posição está a mulher que vai na linha Azul
    (Linha_1==amarela) ,

    alldifferent([Linha_1, Linha_2, Linha_3, Linha_4, Linha_5]),


%%%%% Nome
    nome(Nome_1),
    nome(Nome_2),
    nome(Nome_3),
    nome(Nome_4),
    nome(Nome_5),
    alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),

%%%%%% Parente
    parente(Parente_1),
    parente(Parente_2),
    parente(Parente_3),
    parente(Parente_4),
    parente(Parente_5),

    %A garota que visitará a Mãe está na segunda posição.
    (Parente_2==mae) ,

    alldifferent([Parente_1, Parente_2, Parente_3, Parente_4, Parente_5]),

%Beatriz está exatamente à esquerda de quem vai visitar a Mãe.
(
(Parente_5==mae, Nome_4==beatriz);
(Parente_4==mae, Nome_3==beatriz);
(Parente_3==mae, Nome_2==beatriz);
(Parente_2==mae, Nome_1==beatriz)
),

%Joice vai visitar a Tia.
(
(Nome_1==joice , Parente_1==tia);
%(Nome_2==joice , Parente_2==tia);
(Nome_3==joice , Parente_3==tia);
(Nome_4==joice , Parente_4==tia);
(Nome_5==joice , Parente_5==tia)
),

%Quem vai usar a linha Verde está em algum lugar à esquerda de quem vai visitar a Sobrinha.

(
(Parente_5==sobrinha, (Linha_4==verde ; Linha_3==verde ; Linha_2==verde ; Linha_1==verde));
(Parente_4==sobrinha, (Linha_3==verde ; Linha_2==verde ; Linha_1==verde));
(Parente_3==sobrinha, (Linha_2==verde ; Linha_1==verde));
(Parente_2==sobrinha, Linha_1==verde)
),


%%%%%%%%%%%% Profissao
        profissao(Profissao_1),
        profissao(Profissao_2),
        profissao(Profissao_3),
        profissao(Profissao_4),
        profissao(Profissao_5),

	%A Arquiteta está na primeira posição.
	(Profissao_1 == arquiteta),

	alldifferent([Profissao_1, Profissao_2, Profissao_3, Profissao_4, Profissao_5]),

%A Policial visitará a Avó.
(
%(Profissao_1==policial , Parente_1==avo);
%(Profissao_2==policial , Parente_2==avo);
(Profissao_3==policial , Parente_3==avo);
(Profissao_4==policial , Parente_4==avo);
(Profissao_5==policial , Parente_5==avo)
),

%A Tradutora visitará a Tia.
(
%(Profissao_1==tradutora , Parente_1==tia);
%(Profissao_2==tradutora , Parente_2==tia);
(Profissao_3==tradutora , Parente_3==tia);
(Profissao_4==tradutora , Parente_4==tia);
(Profissao_5==tradutora , Parente_5==tia)
),


%Alessandra é policial
(
%(Nome_1==alessandra , Profissao_1==policial);
(Nome_2==alessandra , Profissao_2==policial);
(Nome_3==alessandra , Profissao_3==policial);
(Nome_4==alessandra , Profissao_4==policial);
(Nome_5==alessandra , Profissao_5==policial)
),

%%%%%%%%%%% Signo
        signo(Signo_1),
        signo(Signo_2),
        signo(Signo_3),
        signo(Signo_4),
        signo(Signo_5),

	%A garota de Gêmeos está na segunda posição.
	(Signo_2 == gemeos),

	%A mulher de Leão está na quarta posição.
	(Signo_4 == leao),

alldifferent([Signo_1, Signo_2, Signo_3, Signo_4, Signo_5]),

%A mulher de Sagitário vai usar a linha Branca.
(
%(Signo_1==sagitario , Linha_1==branca);
%(Signo_2==sagitario , Linha_2==branca);
(Signo_3==sagitario , Linha_3==branca);
%(Signo_4==sagitario , Linha_4==branca);
(Signo_5==sagitario , Linha_5==branca)
),

%%%%%%%%%% Comida
        comida(Comida_1),
        comida(Comida_2),
        comida(Comida_3),
        comida(Comida_4),
        comida(Comida_5),

% REGRAS ESPECIFICAS
%A mulher que gosta de Peixe está exatamente na segunda posição.
Comida_2==peixe,

alldifferent([Comida_1, Comida_2, Comida_3, Comida_4, Comida_5]),


%A mulher que gosta de Frango está em uma das pontas.
(Comida_1==frango ; Comida_5==frango),

%Quem gosta de Pizza vai pegar a linha Verde.
(
(Comida_1==pizza , Linha_1==verde);
%(Comida_2==pizza , Linha_2==verde);
(Comida_3==pizza , Linha_3==verde);
(Comida_4==pizza , Linha_4==verde);
(Comida_5==pizza , Linha_5==verde)
),

%Luisa gosta de sopa.
(
(Nome_1==luisa , Comida_1==sopa);
%(Nome_2==luisa , Comida_2==sopa);
(Nome_3==luisa , Comida_3==sopa);
(Nome_4==luisa , Comida_4==sopa);
(Nome_5==luisa , Comida_5==sopa)
),

%Quem gosta de Peixe está exatamente à esquerda de quem vai visitar a Tia.
(
(Parente_5==tia , Comida_4==peixe);
(Parente_4==tia , Comida_3==peixe);
(Parente_3==tia , Comida_2==peixe);
(Parente_2==tia , Comida_1==peixe)
),

%A Nutricionista está em algum lugar à direita de quem vai pegar a linha Branca.
(
(Linha_1==branca , (Profissao_2==nutricionista ; Profissao_3==nutricionista ; Profissao_4==nutricionista ; Profissao_5==nutricionista));
(Linha_2==branca , (Profissao_3==nutricionista ; Profissao_4==nutricionista ; Profissao_5==nutricionista));
(Linha_3==branca , (Profissao_4==nutricionista ; Profissao_5==nutricionista));
(Linha_4==branca , Profissao_5==nutricionista)
),


%A mulher de Escorpião está exatamente à direita de quem vai pegar a linha Verde.
(
(Linha_1==verde, Signo_2==escorpiao);
(Linha_2==verde, Signo_3==escorpiao);
(Linha_3==verde, Signo_4==escorpiao);
(Linha_4==verde, Signo_5==escorpiao)
),

%A Economista está exatamente à esquerda de quem gosta de Macarrão.
(
(Comida_5==macarrao , Profissao_4==economista);
(Comida_4==macarrao , Profissao_3==economista);
(Comida_3==macarrao , Profissao_2==economista);
(Comida_2==macarrao , Profissao_1==economista)
),

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FINALMENTE
nl,
write('CHEGAMOS AO FIM DO MODELO')

. %%% <== NAO ESQUECA O PONTO FINAL

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fatos

%%%%BASE DE DADOS%%%%

        %LINHA
        linha(amarela).
        linha(azul).
        linha(branca).
        linha(verde).
        linha(vermelha).

        %NOME
        nome(beatriz).
        nome(luisa).
        nome(joice).
        nome(rosana).
        nome(alessandra).

        %PARENTE
        parente(mae).
        parente(avo).
        parente(tia).
        parente(filha).
        parente(sobrinha).


        %PROFISSAO
        profissao(arquiteta).
        profissao(economista).
        profissao(nutricionista).
        profissao(policial).
        profissao(tradutora).

        %SIGNO
        signo(gemeos).
        signo(leao).
        signo(escorpiao).
        signo(sagitario).
        signo(touro).

        %COMIDA
        comida(peixe).
        comida(frango).
        comida(macarrao).
        comida(pizza).
        comida(sopa).

% DEFINICAO DE ALLDIFERENT
	alldifferent([]).
	alldifferent([H|T]):- not(member(H,T)),
	                      alldifferent(T).

	imprime_lista([]):- write('\n\n FIM do imprime_lista \n').
	imprime_lista([H|T]):-
		write('\n......................................\n'),
	        write(H), write(' : '),
	        imprime_lista(T).

/**********************************************************/
