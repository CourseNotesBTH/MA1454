# Numerisk analys - Cheat Sheet

## TODO

* Ändar strukturen på momenten



## Cheat Sheet

### Kapitel 1

**Absolutfel**
$$
\delta x = \hat{x} - x
$$


Där $\hat{x}$ är det approximativa värdet och $x$ är det riktiga värdet

Exempel

$\delta x = 3.14159 - \pi = -2.65*10^{-6}$



**Relativa fel**
$$
\frac{\delta x}{x} \approx \frac{\delta x}{\hat{x}} = \rho
$$
Exempel

$\rho = \frac{-2.65*10^{-6}}{3.1415} =  -8.45*10^-7$



**Korrekt decimal**
$$
|\delta x| \le 0.5*10^{-t}
$$
Man säger att $\hat{x}$ har *t* rätta decimaler

Exempel

$-2.65*10^{-6} > 0.5*10^{-1}$

$-2.65*10^{-6} > 0.5*10^{-2}$

$-2.65*10^{-6} > 0.5*10^{-3}$

$-2.65*10^{-6} > 0.5*10^{-4}$

$-2.65*10^{-6} > 0.5*10^{-5}$

$-2.65*10^{-6} > 0.5*10^{-6}$

$-2.65*10^{-6} < 0.5*10^{-7}$

$\hat{x}$ har 7 korrekta decimaler



**Signifikanta siffror**
$$
\sigma = t+1
$$
Där $\sigma$ betecknar antalet signifikanta siffror

$\sigma = 7 + 1 = 8$



### Kapitel 2



### Kapitel 3



### Kapitel 4

#### Kvadraturformler

$$
\int_a^b f(x) dx = \sum_{i=1}^n w_if(x_i) + R_T \\

R_T \text{ är trunkeringsfelet}
$$



#### Trapetsreglen

$$
\int_a^b f(x) dx = \frac{b-a}{2} \{f(a) + f(b)\} \\
R_T = \frac{f''(\xi)}{12}(b-a)^3 \quad, \quad a \leq \xi \leq b
$$


$$
\bold{\text{Exempel}} \\
$$


#### Simsons regel

$$
\text{Tre punkter behövs} \quad [a,b,c] \quad \text{,} \quad c = \frac{a+b}{2} \\
\int_a^b f(x)dx = \frac{b-a}{6}\{f(a)+f(b)+4*f(c)\} \\
R_T = \frac{f^{(4)}(\xi)}{2880}(b-a)^5 \quad, \quad a \leq \xi \leq b
$$

$$
\bold{\text{Exempel}} \\
$$



#### Trapets formlen

$$
n\text{ är antalet delintervall och } h \text{ är längden på intervallen} \\
T(h) = h\left\{\frac{f(x_0)}{2} + f(x_1) + \dots + f(x_{n-1} + \frac{f(x_n)}{2})\right\} \quad \text{,} \quad x_i = a+ih \\
R_T = \frac{b-a}{12}h^2f''(\xi) \quad, \quad a \leq \xi \leq b \\
h = \frac{b-a}{n}
$$

$$
\bold{\text{Exempel}} \\
$$



#### Simpsons formel

$$
n\text{ är antalet delintervall och } h \text{ är längden på intervallen} \\
S(h) = \frac{h}{3}\left\{f(x_0) + 4f(x_1) + 2f(x_2) + \dots + 2f(x_{n-2}) + 4f(x_{n-1} + f(x_n)\right\} \quad \text{,} \quad x_i = a+ih \\
R_T = \frac{b-a}{180}h^4f^{(4)}(\xi) \quad, \quad a \leq \xi \leq b \\
h = \frac{b-a}{2n}
$$

$$
\bold{\text{Exempel}} \\
$$



#### Richardsonextrapolation

$$
T^{(2)}(h) = T(h) + \frac{T(h) - T(2h)}{3}\\
|R_T| \leq |T(h) - T(2h)| \qquad\text{(Kalls för tumreglen)} \\ \text{ }\\

\bold{\text{Not:}}\text{ Om man använder trapetsformeln plus Richardsonextrapolation får man simpsons formel}
$$

$$
\bold{\text{Exempel}} \\
$$



#### Rombergs metod

$$
\text{När man använder upprepad Richardsonextrapolation på trapetsformeln kallas det Rombers metod} \\
\text{Nästa steg blir:} \\
T^{(3)}(h) = T^{(2)}(h) + \frac{T^{(2)}(h) - T^{(2)}(2h)}{15}\\
\vdots \\
T^{(n)}(h) = \dots \\ \text{ } \\
|R_T| \leq |T(h) - T(2h)|
$$



#### Generaliserade integraler

### Kapitel 5

### Kapitel 6



##Checklista på saker man ska kunna

### Wordlist

| Sybol | Krav med hänseende till tentamen                             |
| :---: | :----------------------------------------------------------- |
|   ✅   | Ska kunna                                                    |
|   ⚠️   | Förkunskap till de andra formlerna. Bör ha koll på men behöver inte kunna |
|   ❓   | Osäker om man behöver kunna                                  |

### Kapitel 1

* Absolut fel
* Relativ fel
* Korrekt decimal
* Signifikana siffror
* Felfortplantning, envariable
* Felfortplantning, fler variabler
* Kondition och kontitionstal
* bakåt fel
* frammåt fel
* Flyttalssystem

### Kapitel 2

* Newtons metod - dämpad - hybrid
* Sekantmetoden
* Intervallhalverinsmetoden
* Fixpunktmedtoden
* Jacobymatrisen
* Newtons metod för system - dämpad - hybrid
* Fixpunktmetoden för system
* Lösningsnogranhet/metodberonde feluppskattning
* Lösningsnogranhet för system

### Kapitel 3

### Kapitel 4

* ⚠️ Kvadraturformler
* ⚠️❓ Trapetsreglen
* ⚠️❓ Simsons regel
* ✅ Trapets formlen
* ✅ Simpsons formel
* ✅ Richardsonextrapolation
* ✅ Rombergs metod
* ✅ Generaliserade integraler



### Kapitel 5

### Kapitel 6