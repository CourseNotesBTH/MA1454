# Numerisk Analys - Cheat Sheet

Detta dokument inehåller en sammanställning av kursen. 
Här finner du **formelsamling**, **exempel**, **Matlab tips** och en **checklista** på saker man sak kunna.
Djupare förståelse för formlerna finns i Course notes eller kursboken.

## TODO

* Gör om Checklistan till tabeller?
* Färdigställa kap 1, 2, 3, 4, 5, 6
* Färdigställa checklista 1, 2, 3, 4, 5, 6
* Lägg till Matlab tips!!
* Tabort vissa exempel?



## Formelsamling, exempel och Matlab tips

### Kapitel 1

####Absolutfel

$$
\delta x = \hat{x} - x
$$

Där $\hat{x}$ är det approximativa värdet och $x$ är det riktiga värdet


$$
\bold{\text{Exempel}} \\

\delta x = 3.14159 - \pi = -2.65*10^{-6}
$$




####Relativa fel

$$
\frac{\delta x}{x} \approx \frac{\delta x}{\hat{x}} = \rho
$$

$$
\bold{\text{Exempel}}\\

\rho = \frac{-2.65*10^{-6}}{3.1415} =  -8.45*10^-7
$$




####Korrekt decimal

$$
|\delta x| \le 0.5*10^{-t}
$$
Man säger att $\hat{x}$ har *t* rätta decimaler


$$
\bold{\text{Exempel}}\\

-2.65*10^{-6} > 0.5*10^{-1}\\

-2.65*10^{-6} > 0.5*10^{-2}\\

-2.65*10^{-6} > 0.5*10^{-3}\\

-2.65*10^{-6} > 0.5*10^{-4}\\

-2.65*10^{-6} > 0.5*10^{-5}\\

-2.65*10^{-6} > 0.5*10^{-6}\\

-2.65*10^{-6} < 0.5*10^{-7}\\

\hat{x} \text{ har 7 korrekta decimaler}
$$



####Signifikanta siffror

$$
\sigma = t+1
$$
Där $\sigma$ betecknar antalet signifikanta siffror

$$
\bold{\text{Exempel}}\\
\sigma = 7 + 1 = 8
$$




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



#### Simpsons regel

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
S(h) = \frac{h}{3}\left\{f(x_0) + 4f(x_1) + 2f(x_2) + \dots + 2f(x_{n-2}) + 4f(x_{n-1}) + f(x_n)\right\} \quad \text{,} \quad x_i = a+ih \\
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

#### LU-faktorisering

Sätt in beskrivning
$$
\bold{\text{Exempel}} \\
Ax=b\\
\left(\begin{array}{cc} 
0.01 & 2\\
1 & 1
\end{array}\right)
x=
\left(\begin{array}{cc} 
-1\\ 
6
\end{array}\right)\\
\text{ }\\
\text{ }\\
E_1 = 
\left(\begin{array}{cc} 
1 & 0\\ 
-100 & 1
\end{array}\right)\\
E_1A = 
\left(\begin{array}{cc} 
1 & 0\\ 
-100 & 1
\end{array}\right)
\left(\begin{array}{cc} 
0.01 & 2\\
1 & 1
\end{array}\right)
= 
\left(\begin{array}{cc} 
0.01 & 2\\
0 & -199
\end{array}\right)
= U \\
E_1 \implies L = 
\left(\begin{array}{cc} 
1 & 0\\
100 & 1
\end{array}\right) \\
A=LU=
\left(\begin{array}{cc} 
1 & 0\\
100 & 1
\end{array}\right)
\left(\begin{array}{cc} 
0.01 & 2\\
0 & -199
\end{array}\right)\\
\text{ }\\
\text{ }\\
Ly = b\\
\left(\begin{array}{cc} 
1 & 0\\
100 & 1
\end{array}\right)
y = 
\left(\begin{array}{cc} 
-1\\ 
6
\end{array}\right)
\implies y=
\left(\begin{array}{cc} 
-1\\ 
106
\end{array}\right)\\
\text{ }\\
\text{ }\\
Ux = y\\
\left(\begin{array}{cc} 
0.01 & 2\\
0 & -199
\end{array}\right)
x=
\left(\begin{array}{cc} 
-1\\ 
106
\end{array}\right)
\implies x = 
\left(\begin{array}{cc} 
7\\ 
-0.533
\end{array}\right)\\
\text{ }\\
\text{ }\\
\text{Insättning av x i Ax=b ger} \dots\\
$$

$$
\bold{\text{Matlab tips}} \\
\bold{\text{lu}(A)} \text{ ger LU-faktoriseringen}
$$



#### LU-faktorisering med pivotering

Sammanfattnigsvis löser man ett linjärt ekvationssystem $Ax = b$

- Faktorisera $A$ på formen $PA=LU$ genom Gausselimineation med radpiovotering
- Lös det triangulära systemet $Ly = Pb$ med framåtsubstitution där $y$ är en hjälpverktor
- Lös det triangulära systemet $Ux = y$ med bakåtsubstitution för att få lösningen $x$ till det givna problemet $Ax = b$

$$
\bold{\text{Matlab tips}} \\
\bold{\text{lu}(A)} \text{ ger LU-faktoriseringen}
$$



#### Vektornormer och matrisnormer

**Summa normen**
$$
||x||_1 = |x_1|+\dots+|x_n| = \sum_{i=1}^n |x_i|
$$

**Euklidiska normen**
$$
||x||_2 = \sqrt{|x_1|^2+\dots+|x_n|^2} = \sqrt{\sum_{i=1}^n |x_i|^2}
$$

$$
\bold{\text{Matlab tips}} \\
\text{I matlab kan man skriva} \bold{\text{ norm(v)}}, \qquad \text{där v är en vektor}
$$

**Maximum normen**
$$
||x||_\infin = \max\{|x_1|+\dots+|x_n|\} = \max_{1\leq i\leq n}|x_i|
$$



####Minstakvadrat

$$
x = \left(A^T A\right)A^Tb \\
r = Ax-b \implies ||r||_2 = ||A(A^TA)^{-1}A^Tb-b||_2
$$

$$
\bold{\text{Exempel}}\\
A=
\left(\begin{array}{cc} 
2 & 3\\
2 & 4\\
1 & 1\\
\end{array}\right)\qquad
b =
\left(\begin{array}{cc} 
1\\
4\\
-1
\end{array}\right)\qquad
A^T = 
\left(\begin{array}{cc} 
2 & 2 & 1\\
3 & 4 & 1
\end{array}\right)\qquad
A^TA =
\left(\begin{array}{cc} 
9 & 15\\
15 & 26
\end{array}\right)\\
(A^TA)^{-1} = \frac{1}{det(A)}adj(A)=\frac{1}{det(A^TA) = 9*26 - 15*15}
\left(\begin{array}{cc} 
26 & -15\\
-15 & 9
\end{array}\right)
 =\frac{1}{9}
 \left(\begin{array}{cc} 
26 & -15\\
-15 & 9
\end{array}\right)\\
A^Tb = 
\left(\begin{array}{cc} 
2 & 2 & 1\\
3 & 4 & 1
\end{array}\right)
\left(\begin{array}{cc} 
1\\
4\\
-1
\end{array}\right)
=
\left(\begin{array}{cc} 
9\\
18
\end{array}\right)\\
\text{ }\\
\text{Beräkna Minstakvadrat}\\
x = \frac{1}{9}
\left(\begin{array}{cc} 
26 & -15\\
-15 & 9
\end{array}\right)
\left(\begin{array}{cc} 
9\\
18
\end{array}\right)
=
\left(\begin{array}{cc} 
26 & -15\\
-15 & 9
\end{array}\right)
\left(\begin{array}{cc} 
1\\
2
\end{array}\right)
=
\left(\begin{array}{cc} 
-4\\
3
\end{array}\right)\\
r = Ax-b =
\left(\begin{array}{cc} 
2 & 3\\
2 & 4\\
1 & 1\\
\end{array}\right)
\left(\begin{array}{cc} 
-4\\
3
\end{array}\right)
-
\left(\begin{array}{cc} 
1\\
4\\
-1
\end{array}\right) = 
\left(\begin{array}{cc} 
1\\
4\\
-1
\end{array}\right)
-
\left(\begin{array}{cc} 
1\\
4\\
-1
\end{array}\right)
=
\left(\begin{array}{cc} 
0\\
0\\
0
\end{array}\right)\\
||r||_2 = \sqrt{0^2+0^2+0^2}=0
$$



####QR faktorisering



####QR faktorisering med Householderspeglingar



####Singularitetsfaktorisering (SVD)

$$
\text{Minstakvadratlösning}\\
x = V_1\Sigma_1^{-1}U_1^Tb=A^+b \quad(\text{moore-Penrose pseudoinverse}) \\
||r||_2 = ||U_2^Tb||_2 \\

A =
$$



####Trunkerad SVD

$$
A = U_1\Sigma_1 V_1^T = \sum_{i=1}^r \sigma_iu_iv_i^T \\
x = V_1\Sigma_1^{-1} U_1^Tb = \sum_{i=1}^r (u_i^Tb) \sigma_i^{-1}v_i \\
\text{Där r är rangen till matrisen A}
$$



#### Postensmetoden

$$
\begin{align*}
&x_0, \quad \text{startvektor}\\
&\begin{array}{}
	y_{k+1} = Ax_k \\
	x_{k+1} = y_{k+1}/||y_{k+1}||_2  \\
\end{array}
\Bigg\rbrace \quad\text{för }k=0,1,\dots
\end{align*} \\
\text{ }\\

\text{Iterationen avbryts med något vilkor av typ}\\
||x_{k+1}-x_k|| \leq \delta , \quad \text{där } \delta \text{ är någon önskad gräns}\\
\text{ }\\

\text{Dominerade egenvärde}\\
\lambda = \frac{x_{k+1}^TAx_{k+1}}{x_{k+1}^Tx_{k+1}}
$$



#### Invers iteration

$$
\begin{align*}
&x_0, \quad \text{startvektor}\\
&A = P^{-1}LU, \quad \text{LU-faktorisering med pivotering}\\
&\left.\begin{array}{}
	Lz_k  = Px_k\\
	Uy_{k+1} = z_k \\
	x_{k+1} = y_{k+1}/||y_{k+1}||\\
\end{array}
\right\} \quad\text{för }k=0,1,\dots
\end{align*}\\
\text{ }\\

\text{Minsta egenvärde}\\
\lambda = \frac{x_{k+1}^TAx_{k+1}}{x_{k+1}^Tx_{k+1}}\\
\text{ }\\

\bold{\text{Matlab tips}} \\
\text{[L U P] = lu}(A) \text{ ger LU-faktoriseringen}
$$

#### Invers iteration med shift (uttalas "med shit" - Viet )

$$
\begin{align*}
&\sigma_0, \quad \text{givet skift}\\
&x_0, \quad \text{startvektor}\\
&\left.\begin{array}{}
(A-\sigma_kI) = P^{-1}LU\\
Lz_k=Pxk\\
Uy_{k+1} = z_k\\
x_{k+1} = y_{k+1}/||y_{k+1}||\\
\sigma_{k+1} = x_{k+1}^TAx_{k+1}
\end{array}
\right\}\qquad\text{för }k=0,1,\dots\\
\end{align*}\\
\text{ }\\
\text{Ett visst egenvärde nära ett givet tal }\sigma \\
\lambda = \frac{x_{k+1}^TAx_{k+1}}{x_{k+1}^Tx_{k+1}}\\
\text{ }\\

\bold{\text{Matlab tips}}\\
\bold{\text{eye(size(A))}} \text{ i matlab ger identitetsmatris till A}
$$



#### Ortogonal iteration

$$
\begin{align*}
&X_0, \quad \text{ startmatris } n \times p \text{ med rang } p\\
&\left.\begin{array}{}
Q_kR_k = X_{k-1}\\
X_k = AQ_k
\end{array}
\right\} \quad \text{för } k = 1,2,\dots
\end{align*}
$$



####QR iteration

$$
\begin{align*}
&A_0 = A\\
&\left.\begin{array}{}
Q_kR_k = A_{k-1}\\
A_k = R_kQ_k
\end{array}
\right\} \quad \text{för } k = 1,2,\dots
\end{align*}\\
\text{ }\\
\text{Egenvärdena ligger på diagonalen}
$$



####QR iteration med skift

$$
\begin{align*}
&A_0 = A\\
&\left.\begin{array}{}
Q_kR_k = A_{k-1}-\sigma_kI\\
A_k = R_kQ_k+\sigma_kI
\end{array}
\right\} \quad \text{för } k = 1,2,\dots
\end{align*}\\
\text{ }\\
\text{Egenvärdena ligger på diagonalen}
$$

**Val av sigma:**

* Vid enkelt skift tar vi $\sigma_k$ som elementet på plats $(n, n)$ i matrisen $A_{k-1}$
* Med Wilkinsons skift väljer vi $\sigma_k$ som det egenvärde till $2 \times 2$ i nedre högra hörnet av $A_{k-1}$ som är närmsta elementet på plats $(n,n)$ i matrisen $A_{k-1}$



### Kapitel 6

#### Approximation av derivator

$$
\text{h är steglängden och bör va liten. typ} <0.01\\
\text{ }\\ 
\begin{array}{c c c }
\text{frammåtdifferens} & \text{bakåtdifferens} & \text{centraldifferens} \\
f'(x) = \frac{f(x+h)-f(x)}{h}& f'(x) = \frac{f(x) - f(x-h)}{h} &\frac{f(x+h) - f(x-h)}{2h}\\
|R_f| \leq \frac{\delta(|f(x+h)| + |f(x)|)}{h} & |R_f| \leq \frac{\delta(|f(x)| + |f(x-h)|)}{h} & |R_f| \leq \frac{\delta(|f(x+h)| + |f(x-h)|)}{2h}
\end{array}\\
\text{ }\\
\;\\
\begin{array}{c c}
\text{trunkeringsfel} & \text{trunkreingsfelet för centraldifferens}\\
R_T = \frac{h}{2}f''(\xi) & R_T = \frac{h^2}{6}f^{(3)}(\xi)
\end{array}
$$


$$
\text{Andra derivatan frammåtdifferens}\\
f''(x) = \frac{f'(x+h) - f'(x)}{h} = \frac{1}{h}(f(x-h)-2f(x)+f(x+h))
$$


#### Richardsonextrapolation

$$
D^{(2)}(h) = D(h) + \frac{D(h)-D(2h)}{3}, \quad \text{där } ?D(h) = f'(x)? \\
\text{ }\\
|R_f| \leq |D(h) - D(2h)|
$$



#### Begynnelsevärdesproblem för ordinära differentialekvationer

Se slide

Om man har en högre ordning måste man skriva om till ett system. Se bild på telefonen.



#### Differensmetoder för ordinära differentialekvationer

$$
\begin{array}{c c}
\text{Eulers framåtmetod} & \text{Eulers bakåtmetod}\\
y_{k+1} = y_k+hf(t_k,y_k) & y_{k+1} = y_k +hf(t_{k+1},y_{k+1})\\ \\
\text{mittpunktsmetoden} & \text{trapetsmetoden}\\
y_{k+1} = y_{k-1} + 2hf(t_k, y_k) & y_{k+1} = y_k + \frac{h}{2}(f(t_{k+1},y_{k+1})+f(t_k, y_k))\\
\end{array}
$$

Dfferensmetoder för ordinära differentialekvationer kan kategoriseras som

* Enstegs metod: man behöver känna $y_k$ för att beräkna $y_{k+1}$
* Flerstegs metod: man behöver känna $y_{k-1}$ och $y_k$ för att kunna beräkna $y_{k+1}$
* Explicita metod: sätter in $y_k$ respektive $y_{k-1}$ och $y_k$ i högerledet för att få fram $y_{k+1}$
* Implicita metod: måste lösa ickelinjärt ekvationssytem i varje steg för att få fram $y_{k+1}$

| **Metoder**        | **Ensteg** | **Flersteg** | **Explicita** | **Implicita** |
| ------------------ | :--------: | :----------: | :-----------: | :-----------: |
| Eulers framåtmetod |     X      |              |       X       |               |
| Eulers bakåtmetod  |     X      |              |               |       X       |
| Mittpunktmetoden   |            |      X       |       X       |               |
| Trapetsmetoden     |     X      |              |               |       X       |



####Noggranhet och stabilitet hos differensmetoder

$$
\begin{array}{c c}
\text{Lokal trunkeringsfel} & \text{Global trunkeringsfel}\\
L_k = y_k-u_{k-1}(t_k) & G_k = y_k - u_0(t_k) = y_k-y(t_k)
\end{array}
$$

Stabilitet för Eulers Bakåt, Eulers framåt och trapets



#### Prediktor-korrektormetoder

...

#### Runge-Kuttametoder

$$
y_{k+1} = y_k + h \sum_{i=1}^s b_i k_i, \quad \text{där}\\
k_i = f(t_k + c_ih , y_k + h\sum_{j=1}^sa_{ij} k_j)
$$



#### Tvåpunkts rendvärdesproblem



##Checklista på saker man ska kunna

### Wordlist

| Sybol | Krav med hänseende till tentamen   |
| :---: | :--------------------------------- |
|   ✅   | Ska kunna                          |
|   ❌   | Behöver inte kunna                 |
|   ⚠️   | Förkunskap till de andra formlerna |
|   ❓   | Osäker på mitt val                 |

**Not:** Detta är min åsikt och är antagligen inte korrekt!

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
* ⚠️❓ Simpsons regel
* ✅ Trapets formlen
* ✅ Simpsons formel
* ✅ Richardsonextrapolation
* ✅ Rombergs metod
* ✅ Generaliserade integraler

### Kapitel 5

* ⚠️ LU-faktorisering
* ⚠️ LU-faktorisering med pivotering
* ✅ Vektornormer och matrisnormer
* ⚠️ Minstakvadrat
* ⚠️ QR faktorisering
* ✅ QR faktorisering med Householderspeglingar
* ✅ Singularitetsfaktorisering (SVD)
* ✅ Trunkerad SVD
* ⚠️ Postensmetoden
* ✅ Invers iteration
* ✅ Invers iteration med shift
* ⚠️ Ortogonal iteration
* ✅ QR iteration
* ✅ QR iteration med skift

**Kommentar:** Baserat på gammla tentor kommer uppgiften ifrån detta kappitlet handla om QR iteration eller QR faktorisering

### Kapitel 6

* ⚠️ Approximation av derivator
* ❌ Richardsonextrapolation
* ✅ Begynnelsevärdesproblem för ordinära differentialekvationer
* ✅ Differensmetoder för ordinära differentialekvationer
* ❌ Noggranhet och stabilitet hos differensmetoder
* ✅ Prediktor-korrektormetoder
* Runge-Kuttametoder

**Kommentar:** Med stor sannolikhet kommer det komma en uppgift på Eulers frammåt metod som ska användas för att lösa begynnelse villkor för en diff. Det kommer även komma predikar-korrektor metod. 



### Kapitel 1337

* ✅ Onlinepizza.se