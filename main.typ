// Setup

#import "template.typ": project

#show: project.with(
  title: "Teorema inutile, ma non per me",
  author: "Oldani Mattia",
  abstract: [A $12$ anni ero affascinato dal numero $99$, ultimo numero prima di andare in tripla cifra. Sarà che avevo un telefonino che, come tutti i telefonini fanno, mostrano le ore con dei numeri a due cifre. Sarà che mi chiedevo spesso come cercare di raggiungere $99$ con le ore e i minuti segnati sullo schermo. Sarà la passione pura e cristallina che ancora oggi ho nei confronti della matematica. Non lo so, ma è lì che la mia mente malsana ha prodotto quello che oggi è uno dei teoremi più inutili della storia, quasi al livello dell'ultimo teorema di Fermat, ma almeno io, il mio, non l'ho fatto dimostrare a qualcun'altro $300$ anni dopo.],
  date: datetime.today().display("[day]-[month]-[year]"),
)


#import "@local/typst-theorems:1.0.0": *

#show: thmrules.with(qed-symbol: $square.filled$)


#import "@preview/lovelace:0.3.0": pseudocode-list

#let settings = (
  line-numbering: "1:",
  stroke: 1pt + blue,
  hooks: 0.2em,
  booktabs: true,
  booktabs-stroke: 2pt + blue,
)

#let pseudocode-list = pseudocode-list.with(..settings)


// Report

= Introduzione

In questo report, molto spartano, come piace a me, andremo a scoprire una proprietà esotica della congruenza modulo $99$. Riprendiamo velocemente quella che è la definizione di congruenza: siano $a,b in ZZ$ due numeri interi, allora $ a equiv b mod n , $ e si legge _"a equivalente a b modulo n"_, se e solo se $exists k in ZZ$ tale che $ a = b + k n . $

In soldoni, due numeri sono uguali se, prendendo uno dei due e sommano/sottraendo $n$ un certo numero di volte, riesci a ottenere l'altro numero.

Questa povera base matematica è tutto ciò che ci servirà da qui in avanti.

= Lemmi rinforzanti

Vediamo prima due lemmi che mi hanno aiutato enormemente nella dimostrazione del teorema.

#lemma()[
  Sia $n in NN$ un numero pari, allora $ 10^n equiv 1 mod 99 . $
]<lemma-pari>

#proof()[
  Dimostriamo questo lemma per induzione su $n$.

  Come caso base non useremo $n=0$ poiché banale e non ci aiuterà nel passo induttivo.

  Come caso base usiamo quindi $n=2$. Verifichiamo che la relazione è verificata in questo caso: $ 10^2 = 100 equiv 1 mod 99 . $

  Come passo induttivo sia $n > 2$ un numero pari, quindi lo possiamo scrivere come $ n = 2k bar.v k > 1 and k in NN . $

  Riscriviamo $n$ come $ n = 2k = underbracket(2 + dots.c + 2, k) $ e quindi riscriviamo $10^n$, grazie alle proprietà delle potenze, come $ 10^n = 10^(2 + dots.c + 2) = underbracket(10^2 dot dots.c dot 10^2, k) . $

  Grazie al caso base sappiamo che $10^2 equiv 1 mod 99$, quindi $ 10^n = 10^2 dot dots.c dot 10^2 equiv underbracket(1 dot dots.c dot 1, k) = 1 mod 99 . qedhere $
]

#lemma()[
  Sia $n in NN$ un numero dispari, allora $ 10^n equiv 10 mod 99 . $
]<lemma-dispari>

#proof()[
  Dimostriamo questo lemma per induzione su $n$.

  Come caso base usiamo $n=1$. Verifichiamo che la relazione è verificata in questo caso: $ 10^1 = 10 equiv 10 mod 99 . $

  Verifichiamo la relazione nel caso base: $ 10^1 = 10 equiv 10 mod 99 . $

  Come passo induttivo sia $n > 1$ un numero dispari, quindi lo possiamo scrivere come $ n = 2k + 1 bar.v k > 1 and k in NN . $

  Riscriviamo $n$ come $ n = 2k + 1 = underbracket(2 + dots.c + 2, k) + 1 $ e quindi riscriviamo $10^n$, grazie alle proprietà delle potenze, come $ 10^n = 10^(2 + dots.c + 2 + 1) = underbracket(10^2 dot dots.c dot 10^2, k) dot 10 . $

  Grazie al @lemma-pari sappiamo che $10^2 equiv 1 mod 99$ e grazie al caso base sappiamo che $10^1 equiv 10 mod 99$, quindi $ 10^n = 10^2 dot dots.c dot 10^2 dot 10 equiv underbracket(1 dot dots.c dot 1, k) dot 10 = 10 mod 99 . qedhere $
]

= Teorema ruspante

Con il @lemma-pari e il @lemma-dispari ora siamo pronti per dimostrare il risultato principale di questo report esotico.

#theorem()[
  Sia $x = x_(n-1) x_(n-2) dots.c x_1 x_0$ un numero naturale di $n$ cifre. Allora vale $ [10 dot (sum_(i = 1)^(n-1) x_i) + x_0 equiv 9 dot (sum_(i=1)^(floor(n slash 2)) x_(2i)) + x] mod 99 . $
]<teorema-ruspante>

#proof()[
  #let DX = "DX"

  Sia $ DX = 9 dot (sum_(i=1)^(floor(n slash 2)) x_(2i)) + x $ il membro di destra della relazione da verificare. Andiamo a ridurre DX con la congruenza modulo $99$ per cercare di ottenere qualcosa di simile al membro di sinistra.

  Scriviamo il numero $x$ come somma pesata delle cifre che lo compongono, ovvero $ x = 10^(n-1) x_(n-1) + 10^(n-2) x_(n-2) + dots.c + 10^1 x_1 + 10^0 x_0 . $

  Per il @lemma-pari ogni cifra in posizione pari vede ridotto il proprio "peso" a $1$, mentre per il @lemma-dispari ogni cifra in posizione dispari vede ridotto il proprio "peso" a $10$, quindi $ x = sum_(i "pari") x_i + sum_(i "dispari") 10 x_i = sum_(i "pari") x_i + 10 dot (sum_(i "dispari") x_i) . $

  Vista questa semplificazione, aggiorniamo DX scrivendolo come $ DX = 9 dot (sum_(i=1)^(floor(n slash 2)) x_(2i)) + sum_(i "pari") x_i + 10 dot (sum_(i "dispari") x_i) . $

  La prima sommatoria somma tutte le cifre in posizioni pari saltando la cifra in posizione $0$, ovvero $ sum_(i=1)^(floor(n slash 2)) x_(2i) = sum_(i "pari" gt.eq 2) x_i . $

  Riscriviamo la seconda sommatoria esplicitando questo comportamento, ovvero $ sum_(i "pari") x_i = (sum_(i "pari" gt.eq 2) x_i) + x_0 . $

  Andiamo a raccogliere i fattori comuni e otteniamo $ DX &= 9 dot (sum_(i "pari" gt.eq 2) x_i) + (sum_(i "pari" gt.eq 2) x_i) + 10 dot (sum_(i "dispari") x_i) + x_0 = \ &= 10 dot (sum_(i "pari" gt.eq 2) x_i) + 10 dot (sum_(i "dispari") x_i) + x_0 = \ &= 10 dot (sum_(i "pari" gt.eq 2) x_i + sum_(i "dispari") x_i) + x_0 . $

  Le due sommatorie nella parentesi calcolano la somma di tutte le cifre a partire da quella in posizione $1$: infatti, la prima sommatoria somma tutte le posizioni pari dalla posizione $2$ in poi, mentre la seconda sommatoria somma tutte le posizioni dispari, quindi $ DX = 10 dot (sum_(i=1)^(n-1) x_i) + x_0 . $

  Ma DX è esattamente il membro di sinistra.
]

= Altra proprietà esotica

Questo teorema totalmente inutile non è l'unica proprietà interessante della congruenza modulo $99$: ne esiste una seconda, che però, secondo me, è meno *WOW* del teorema proposto.

La seconda proprietà che andiamo ad analizzare riguarda il calcolo esotico che possiamo fare quando eseguiamo un modulo $99$. Vedremo due algoritmi che vanno entrambi a calcolare un numero modulo $99$ in maniera semplice e particolare, ma solo il primo verrà analizzato.

#figure(
  kind: "algorithm",
  supplement: [Algoritmo],

  pseudocode-list(numbered-title: [Algoritmo matto v1])[
    + while $x$ ha più di $2$ cifre:
      + sia $t = ceil(frac("#cifre di" n, 2))$ il $hash$coppie di cifre presenti in $x$ a partire da destra
      + dividi $x$ in coppie di cifre $x_i bar.v i = 1, dots, t$ a partire da destra
      + calcola $x = sum_(i=1)^t x_i$
    + output $x$
  ],
)<algoritmo-matto-v1>

#theorem()[
  Dato un numero $x in NN$, l'algoritmo @algoritmo-matto-v1 calcola esattamente $x mod 99$.
]<teorema-meno-ruspante>

#proof()[
  Dimostriamo che l'algoritmo @algoritmo-matto-v1 è corretto, ovvero calcola $x mod 99$ qualsiasi sia l'input $x in NN$.

  Scriviamo il numero $x$ come somma pesata delle cifre che lo compongono, ovvero $ x = 10^(n-1) x_(n-1) + 10^(n-2) x_(n-2) + dots.c + 10^1 x_1 + 10^0 x_0 . $

  Andiamo ad applicare il modulo $99$. Per il @lemma-pari ogni cifra in posizione pari vede ridotto il proprio "peso" a $1$, mentre per il @lemma-dispari ogni cifra in posizione dispari vede ridotto il proprio "peso" a $10$, quindi $ x = sum_(j "pari") x_j + sum_(j "dispari") 10 x_j . $

  Andiamo ad isolare coppie di cifre consecutive di $x$ a partire da destra. Qua abbiamo due casi possibili:
  - $x$ ha un numero di cifre pari: $ x = (10x_1 + x_0) + dots.c + (10x_(n-1) + x_(n-2)) . $
  - $x$ ha un numero di cifre dispari: aggiungiamo una cifra $x_t = 0$ in testa a $x$, ottenendo quindi: $ x = (10x_1 + x_0) + dots.c + (10x_t + x_(n-1)) . $

  In entrambi i casi presentati stiamo calcolando la somma di tutte le coppie di cifre di $x$ a partire da destra. La riduzione che abbiamo appena fatto è esattamente quello che fa l'algoritmo @algoritmo-matto-v1 nei punti $2,3,4$. Se il numero ottenuto durante questa riduzione ha più di $2$ cifre andiamo ad eseguire ancora una volta la riduzione presentata, fino a quando non si ottiene un numero che abbia meno di $3$ cifre.
]

Una seconda versione dell'algoritmo segue quasi totalmente la prima versione, solo che somma una coppia di cifre ad ogni iterazione.

#figure(
  kind: "algorithm",
  supplement: [Algoritmo],

  pseudocode-list(numbered-title: [Algoritmo matto v2])[
    + while $x$ ha più di $2$ cifre:
      + sia $x_i$ la coppia di cifre di $x$ più a destra
      + sia $x_t$ il numero $x$ privato della coppia $x_i$
      + calcola $x = x_t + x_i$
    + output $x$
  ],
)<algoritmo-matto-v2>

Non ho voglia di dimostrare che questo algoritmo è corretto per il calcolo di $x mod 99$ (_momento Fermat_), mi dovete trustare boys.

= Conclusioni

Questo report non è fatto per essere serio, o almeno, non del tutto. Ci sono dimostrazioni molto formali e dimostrazioni un po' tirate per i capelli, però perdonatemi, mi sono ritirato da matematica. Ci sono frasi sgrammaticate (_Vittorio perdonami_) e frasi degne di Petrarca. Ci sono alcuni easter egg nascosti. È presente un po' di tutto.

Questo report è assolutamente inutile e non dovrebbe essere letto e studiato da nessuno, ma dopo $12$ anni quel bambino di prima media ha avuto la sua conferma: non era autistico che sparava proprietà ab cazzum, ma quello che pensava oggi è vero, dimostrato, e sapere che questa cosa l'ho trovata a $12$ anni mi fa sentire un pelo speciale e soprattutto ancora più innamorato di questa scienza fantastica.
