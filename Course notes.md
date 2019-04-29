# Anteckningar numerisk analys

## Introduktion

Många beräkningsproblem från teknik, naturvetenskap och matematik kan inte lösas för hand - utan endast approximativt och med hjäljp av dator. I denna kurs studerar vi några vanliga datorbaserade lösningsmetoder så som Newtons metod, sekantmetoden, fixpunktiteration m.m. Litteratur är Numerisk analys (Ivar Gustafsson, Kjell Holmåker, ISBN 9789147112463). Hjälpmedel är Matlab.

Två laborationer. Laboration 1: 1hp G-U, laboration 2: 2hp G-u. Tentamen 3hp A-F, datortentamen (Matlab) med formelsamling. Sex uppgifter kopplade till de sex kapitlen.

![image-20190403102014523](/Users/alexgustafsson/Library/Application Support/typora-user-images/image-20190403102014523.png)

## Teori

### Beteckningar

Med $\hat{x}$ menas ett approximativt värde för $x$.

En approximation (skattning) $\hat{x}=\delta x+x$ . Det vill säga - talet inkluderar ett fel $\delta x$.

### Viktiga reflektioner

Om man ska summera många tal (flyttal) är det bäst att summera dem i storleksordning med det minsta talet först. Detta då man då summerar små fel först, vilket bidrar till små fel i resultatet.

### Felanalys och datoraritmetik

[Infoga slide "Kapitel 1" med översikt]

#### Typer av fel

Eftersom $\pi=3.14159265…$ anses vara ett oändligt tal, är vi vana vid skrivningar så som $\pi≈3.14$.

När vi gör approximationer finns det ett fel mellan $\pi$ och approximationen. Dessa fel karakteriseras av:

- Absolut fel - $\delta x = \hat{x} - x$
- Relativt fel - $\frac{\delta x}{x}≈\frac{\delta x}{\hat{x}}$
- Korrekt decimal - om det absoluta felet $\delta x$ uppfyller felgränsen $|\delta x|\lt 0.5 * 10^{-t}$ så säger vi att approximationen $\hat{x}$ har $t$ korrekta decimaler.
- Signifikanta siffror - om en approximation $\hat{x}$ har $t$ korrekta decimaler så är alla siffror i position $\gt 10^{-t}$ signifikanta. Det maximala antalet signifikanta siffror är $t + 1$.

**Exempel**

Ange de absoluta och relativa felen i följande approximationer av $\pi$.

$\hat{\pi}=3.14$

Ange även antalet korrekta decimaler och antalet sigifikanta siffror i approximationen.

**Lösning**
$$
\text{Absolut fel}\\
\delta \pi = \hat{\pi}-\pi=3.14-3.14592653...=-0.00592653...
\delta \pi ≈ -0.006

\\\;\\\text{Relativt fel}\\
\frac{\delta \pi}{\pi}≈\frac{\delta \pi}{\hat{\pi}}≈\frac{-0.006}{3.14}≈0.002

\\\;\\\text{Korrekta decimaler}\\
|\delta\pi|=0.00592653...\lt 0.5*10^{-t}\\
\begin{align}
t=0&\;\;|\delta\pi|\lt0.5*10^0=0.5\\
t=1&\;\;|\delta\pi|\lt0.5*10^{-1}=0.05\\
...\\
t=3&\;\;|\delta\pi|\gt 0.5*10^{-3}=0.0005
\end{align}\\
\Rightarrow t=2

\\\;\\\text{Signifikanta siffror}\\
\text{maximalt:}\;t=2\Rightarrow 2+1=3
\text{[todo... uträkning för alla steg här]}
$$

#### Felfortplanting - en variabel

![image-20190403101814158](/Users/alexgustafsson/Library/Application Support/typora-user-images/image-20190403101814158.png)

Approximationen $\hat{x}$  av $x$ ger det största absoluta felet $\delta x=\hat{x}-{x}$. Om man använder approximationen i en funktion $f(\hat{x})$ i stället för $f(x)$ följer:

1. Taylorutveckling av ordning $n$ av funktionen $f$ kring punkten $x$ skrivs som

$$
f(\hat{x})=f(x+\delta x)=f(x)+\frac{f'(x)}{1!}\delta x+\frac{f''(x)}{2!}\delta x^2+...+\frac{f^{(n)}(x)}{n!}\delta x^n
$$

2. Medelvärdesatsen ger

$$
f(\hat{x})≈f(x)+\frac{f'(x)}{1!}\delta x
$$

3. Det finns ett värde $\xi$ (xi) som ligger i ett intervall med gränser $x$ och $\hat{x}$ så att. Notera att vi kan sätta likhet här när vi byter ut $x$ mot $\xi$

$$
f(\hat{x})=f(x)+\frac{f'(\xi)}{1!}\delta x
$$

4. Felfortplantningsformeln kan skrivas

$$
\delta f(x)=f(\hat{x})-f(x)=f'(\xi)\delta x≈f'(\hat{x})\delta x ≈ f'(x)\delta x
$$

Motsvarande felgräns ger
$$
|\delta f|\leq |f'(\hat{x})||\delta x|
$$
**Exempel**

I antennteori används fränsen för fjärrzonen $r=\frac{2d^2}{\lambda}$ där $\lambda$ är våglängden och $d$ den fysiska storleken på antennen. Beräkna **a)** gränsen $r$ då $\lambda=0.0.5\;m$ och $d=20\;m$. Räkna med fyra siffror. Beräkna **b)** med samma precision förändringen i gränsen $r$ då den fysiska storleken ökas med $0.01\; m$. Beräkna **c)** 

**Lösning A**
$$
r=\frac{2d^2}{\lambda}=\frac{2*(20)^2}{0.05}=\frac{800}{0.05}=16000\;m
$$
**Lösning B**
$$
\delta r=r(\hat{d})-r(d)\\
\hat{d}=20+0.01=20.01\;m\\
r(\hat{d})=\frac{2\hat{d}^2}{\lambda}=\frac{2*20.01^2}{0.05}=16016.004≈1.602*10^{4}\\
\delta r =r(\hat{d})-r(d)=1.602*10^4-1.600*10^4=0.002*10^4=20\;m
$$
Förändringen är alltså $20\;m$.

**Lösning C**
$$
r'=\frac{4d}{\lambda}
\delta r = r'\delta d=\frac{4d}{\lambda}\delta d=\frac{4*20.01}{0.005}0.001=16.008≈16.01\;m
$$
Notera att när vi beräknar med fyra siffror får vi $20\;m$, men när vi använder felfortplantningsformeln får vi $16.01\;m$ vilket är mycket närmre det korrekta värdet $16.004000000002634$.

#### Felfortplantning i fler variabler

Vi har nu $f(x)=f(x_1,x_2,…,x_n)$ med approximationer $\hat{x}_1=x_1+\delta x_1$ o.s.v.

Felfortplantingsformeln blir
$$
\delta f(x)≈f'(x)\delta x = \frac{\partial f}{\partial x}\delta x = \frac{\partial f}{\partial x_1}+\frac{\partial f}{\partial x_2}\delta x_2+...+\frac{\partial f}{\partial x_n}\delta x_n=\sum^n_{i=1}\frac{\partial f}{\partial x_i}\delta x_i
$$

#### Kondition och konditionstal

[Infoga bild 1.4 vecka 1 - kondition och konditionstal]

Ett problem som ger små variationer i utdata $\delta f(x)$ om variationerna i indata $\delta x$ är små kallas för välkonditionerat eller stabilt.

Om små variationer i indata kan ge stora variationer i utdata sägs problemet vara illakonditionerat eller instabilt.

Konditionstalet $\kappa=\frac{|\text{relativ avvikelse i utdata}|}{|\text{relativ avvikelse i indata}|}$.

Konditionstalet beräknas
$$
\kappa=\left|\frac{\delta f(x)}{f(x)}\right|\big/\left|\frac{delta x}{x}\right|≈\left|\frac{f'(x)\delta x}{f(x)}\right|\left|\frac{x}{\delta x}\right|=\left|x\frac{f'(x)}{f(x)}\right|\Leftarrow\delta x f(x)≈f'(x)\delta x
$$
Ett problem sägs vara stabilt om det har ett litet konditionstal.

**Exempel**

![image-20190403101840435](/Users/alexgustafsson/Library/Application Support/typora-user-images/image-20190403101840435.png)

Låt $r=\frac{2d^2}{\lambda}$. Beräkna konditionstalet för problemet för att bestämma rötterna med avseende på koefficienten $d$.

**Lösning** - $\delta f(x)≈f'(x)\delta x$

För indata gäller $d\rightarrow d+\delta d$. För utdata gäller $r\rightarrow r+\delta r$.
$$
k=\frac{\left|\frac{\delta r}{r}\right|}{\left|\frac{\delta d}{d}\right|}\\
r+\delta r=\frac{2(d+\delta d)^2}{\lambda}\\
\frac{r+\delta r}{r}=\frac{2(d+\delta d)^2}{\lambda r}\\
1+\frac{\delta r}{r}=\frac{d^2+2d\delta d+\delta d^2}{\delta d^2}=1+\frac{2\delta d}{d}+\underbrace{\left(\frac{\delta d}{d}\right)^2}_{≈0}≈\frac{2\delta d}{d}\Rightarrow
\kappa≈2
$$

#### Balåtfel, stabilitet hos problem och algoritm

![image-20190403101859089](/Users/alexgustafsson/Library/Application Support/typora-user-images/image-20190403101859089.png)

För att bättre kunna hantera stabilitetsbegreppet behöver vi definiera det så kallade bakåtfelet.

- $\hat{f}$ är approximationen av funktionen f
- Med indata $x$ ger vi funktionen $f$ ett värde $f(x)$
- Om vi använder approximationen $\hat{f}$ får då $\hat{f}(x)$
- Framåtfelet är då $\hat{f}(x)-f(x)$
- Vi definerar bakåtfelet som $\hat{x}-x=f^{-1}(\hat{f}(x))-x$ där $f^{-1}(x)$ är inversen till $f(x)$

![image-20190403101913012](/Users/alexgustafsson/Library/Application Support/typora-user-images/image-20190403101913012.png)

En algoritm är stabil om bakåtfelet är litet.

#### Flyttalssystem

Tal i ett flyttalssystem består av en taldel - mantissan och en exponentdel. Formellt definieras detta som talbasen $\beta$, antalet siffror $t$, lägsta värdet på exponenten $L$ och det högsta värdet på exponenten $U$. Dessa värden bildar kvadrupeln $(\beta, t, L, U)$. Talet kan då skrivas
$$
\pm d_0 d_1 d_2...d_{t-1}\beta^e=\pm(d_0\beta^0+d_1\beta^{-1}+...+d_{t-1}\beta{-t+1})\beta^e=\pm m\beta^e
$$
För flyttalssystemet IEEE med enkel precision (SP) gäller $(\beta, t, L, U)=(2, 24, -126, 127)$. Det minsta talet blir således $1*2^0+0*2^{-1}+…+0.2^{-23})2^{-126}$. Det största talet blir då $1*2^0+1*2^{1}+…+1*2^{23})2^{127}$.

För flyttalssystemet IEEE med dubbel precision (DP) gäller $(\beta, t, L, U)=(2, 53, -1022, 1023)$. Det minsta talet blir således $1*2^0+0*2^{-1}+…+0.2^{-52})2^{-1022}$. Det största talet blir då $1*2^0+1*2^{1}+…+1*2^{52})2^{1023}$.

Antalet siffror som stöds i ett system är $2(\beta - 1)\beta^{t-1}(U-L+1)+1$.

*Underflow level* blir $\beta^L$ och *overflow level* blir $\beta^{U+1}(1-\beta^{-t})$.

**Exempel**

Betrakta det normaliserade flyttalssstemet $(10, t, L, U)$. Med "normaliserat" menas $d_0≠0$.

Vilket är det minsta värdet för $t$ och $U$ och största värdet för $L$ så att både $\lambda=0.0499267578125$ och $r=16004$ kan representeras exakt i systemet?

**Lösning**
$$
\lambda=0.0499267578125 \Rightarrow f(\lambda)=4.99267578125*10^{-2}\\
r=16004 \Rightarrow f(r)=1.6004*10^4
$$
För $\lambda$ behöver vi alltså $12$ siffrors precision och för $r$ blir talet $5$. Det vill säga att det minsta värdet för $t=12$.

Minsta värde för $U$ ges direkt av exponenten $4$. Det minsta värdet för $L$ ges direkt av exponenten $-2$.

Svar: $(\beta, t, L, U) = (10, 12, -2, 4)$

#### Maskinprecision och avrundingsenhet [todo]

[infoga 1.8 maskinprecision och avrundningsenhet x->fl(.)]

$fl(x)$ är flyttalsrepresentationen av ett tal $x$.

Det absoluta felet blir [insert here]

Det relativa felet blir [insert here]

Noggranheten karakter [todo]

Insert nästa slide [x+y]-> o.s.v.

**Exempel**

$(\beta, t, U, L) = (10,6,-3,7)$ och låt $a=0.05$ och $b=16000$. Vad blir resultatet av $fl(a + b)$, $fl(a*a)$ och $fl(b*b)$?

**Lösning**

Omdefiniera $a=0.05\Rightarrow fl(a)=5*10^{-2}$ och $b=1600\Rightarrow fl(b)=1.6*10^4$.
$$
\begin{align}
fl(a+b)&=fl(5*10^{-2}+1.6*10^4)\\
&=fl(0.000005*10^4+1.6*10^4)\\
&=fl(1.600005*10^4)\\
&=1.60001*10^4
\end{align}
$$
Här så skriver vi om talen till samma potens. Sedan adderar vi talen. Därefter inser vi att vi max kan ha $6$ decimaler, vilket innebär att vi avrundar femman uppåt.
$$
\begin{align}
fl(a*a)&=fl(5*10^{-2}*5.10^{-2})\\
&=fl(25*10^{-4})\\
&=2.5*10^{-3}
\end{align}
$$
Notera att vi har två siffror när max är sex, vi har minus tre som exponent - vilket är minimum. Kontrollen är okej.
$$
\begin{align}
fl(b*b)&=fl(1.6*10^4*1.6*10^4)\\
&=fl(256*10^8)\\
&=\infty
\end{align}
$$
Här får vi overflow då exponenten $8$ är större än den maximala exponenten för systemet, $7$.

#### Framåt- och bakåtfel för flyttal [todo]

[1.9 framåt- och bakåtanalys - vecka 1]

**Exempel**

Visa med framåtanalys att det relativa felet vid subtraktion $x_2-x_1$ är begränsat av
$$
\mu+2\mu(1+\mu)\frac{\text{max}(|x_2|,|x_1|)}{|x_2-x_1|}
$$
vid IEEE-standard och avrundningsenhet $\mu$.

**Lösning**
$$
x_1\Rightarrow \hat{x}_1=fl(x_1)=x_1(1+\delta_1)\;\;|\delta_1|\le\mu\\
x_2\Rightarrow \hat{x}_2=fl(x_2)=x_2(1+\delta_2)\;\;|\delta_2|\le\mu\\
\hat{x}_2-\hat{x}_1=x_2(1+\delta_2)-x_1(1+\delta_1)\\
\begin{align}
fl(\hat{x}_2-\hat{x}_1)&=(x_2(1+\delta_2)-x_1(1+\delta_1))(1+\delta_r)\;\;|\delta_3|\le\mu\\
&=(x_2+x_2\delta_2-x_1-x_1\delta_1)(1+\delta_3)\\
&=x_2+x_2\delta_2-x_1-x_1\delta_1+x_2\delta_3+x_2\delta_2\delta_3-x_1\delta_3-x_1\delta_1\delta_3
\end{align}\\
fl(\hat{x}_2-\hat{x}_1)=x_2\delta_2-x_1\delta_1+(x_2-x_1)\delta_3+(x_2\delta_2-x_1\delta_1)\delta_3\\
\frac{fl(\hat{x}_2-\hat{x}_1)-(x_2-x_1)}{x_2-x_1}=\delta_3+\frac{x_2\delta_2-x_1\delta_1+(x_2\delta_2-x_1\delta_1)\delta_3}{x_2-x_1}\\
...
=\delta_3+(1+\delta_3)\frac{x_2\delta_2-x_1\delta_1}{x_2-x_1}
$$
Nu kan framåtanalysen utföras. "Lämnas som övning".

*Historisk not: ungefär här gav klassen upp försöken att följa med i föreläsningen.*

### Ekvationslösning

[infoga bild 2.1 ekvationslösning]

Endast för mycket speciella, enkla funktioner finns det slutna matematiska formler till lösningen för $f(x)=0$. Traditionellt sätt vill man ha reda på en funktions invers, men det är inte alltid lätt. Man behöver då numeriska metoder för ekvationslösningar:

* Newtons metod
* Sekantmetoden
* Hybridmetoden
* Fixpunktiteration

#### Newtons metod

Antag att $x_0$ är en approximation till en rot till $f(x)=0$, d.v.s. $x=x_0+\delta x$ och $f(x_0)≈0$. Taylorutvecklingen av ordningen $n$ av funktionen $f$ kring punkten $x_0$ kan skrivas som
$$
f(x)=f(x_0+\delta x)=f(x_0)+\frac{f'(x_0)}{1!}\delta x+\frac{f''(x_0)}{2!}\delta x^2+...
$$
Approximationen till Taylorutvecklingen blir
$$
f(x)≈f(x_0)+f'(x_0)\delta x=f(x_0)+f'(x_0)(x-x_0)=\hat{f}(x)
$$
Så från ett icke-linjärt problem kan vi med metoden få ett linjärt problem
$$
\hat{f}(x)=f'(x_0)(x-x_0)+f(x_0)=0
$$
$\hat{f}(x)$ blir då tangenten som tangerar $f(x)$ i punkten $(x_0, f(x_0))$.

Lösningen blir slutligen
$$
\hat{x}=x_0-\frac{f(x_0)}{f'(x_0)}
$$
Metoden är inte exakt och behöver itereras för att få bra resultat. En iteration av Newtons metod blir
$$
\hat{x}=x_0-\frac{f(x_0)}{f'(x_0)}\Rightarrow x_{k+1}=x_k-\frac{f(x_k)}{f'(x_k)},k=0,1,...
$$
Första värdet, $x_0$ kallas *startapproximation*. Notera att en olämplig startapproximation kan leda till att metoden divigerar, d.v.s. nämnaren blir $0$.

Vid de fall då derivatan är svår att beräkna eller inte går att beräkna är Newton inte en bra lösningsmetod.

**Exempel**

Lös $f(x)=x^3+x^2-3=0$. Låt $x_0=0.5$. Vad blir $x_1$?

**Lösning**
$$
f(x)=x^3+x^2-3\\
x_{k+1}=x_k-\frac{f(x_k)}{f'(x_k)},k=0,1,...\\
\begin{align}
x_1&=x_0-\frac{f(x_0)}{f'(x_0)}\\
x_1&=0.5-\frac{0.5^3+0.5^2-3}{3*0.5^2+2*0.5}\\
x_1&=0.5-\frac{−2,625}{1,75}\\
x_1&=2
\end{align}
$$

##### Lösningsnoggrannhet och metodoberoende

**Lösningsnoggrannhet**

Används om värdet man har fått är bra.
$$
\delta x ≈\frac{f(\hat{x})}{f'(x^*)}≈\frac{f(\hat{x})}{f'(\hat{x})}
$$
**Metodoberoende**

Används om metoden var bra.
$$
|\hat{x}-x^*|≈\frac{|f(\hat{x})|}{|f'(\hat{x})|}
$$

**Exempel **

$f(x)=x^3+x^2-3=0$. Låt $x_0=0.5$ och $x_5=1.17456$. Hur stor är lösningsnogrannheten?
$$
\hat{x}=x_5=1.17456\\
|x_5-x^*|≈\frac{|f(x_5)|}{|f'(x_5)|}\\
|x_5-x^*|≈5.8971*10^{-07}
$$

#### Dämpad Newtons metod

**Exempel**

$f(x)=x^3+x^2-3=0$ och $x_0=0.5$ samt $\alpha_0=0.6$. Vad blir $x_1$?

**Lösning**
$$
x_{k+1}=x_k-\alpha_k\frac{f(x_k)}{f^1(x_k)},k=0,1,...\\
\begin{align}
x_1&=x_0-\alpha_0\frac{x_0^3+x_0^2-3}{3*x_0^2+2*x_0}\\
x_1&=0.5-0.6\frac{−2.625}{1.75}\\
x_1&=1.4
\end{align}
$$

#### Sekantmetoden

Om $f'$ är okänd eller inte angiven så kan Newtons metod inte användas.

Derivatan skrivs
$$
f'(x_1)=\lim_{\delta\rightarrow0}\frac{f(x_1+\delta)-f(x_1)}{(x_1+\delta)-x_1}=\lim_{x_1\rightarrow x_0}\frac{f(x_1)-f(x0)}{x_1-x_0}
$$
Differensapproximation av derivatan är
$$
f'(x_1)≈\frac{f(x_1)-f(x_0)}{x_1-x_0}
$$
Det linjära problemet i Newtons metod kan nu skrivas
$$
\hat{f}(x)=\frac{f(x_1)-f(x_0)}{x_1-x_0}(x-x_1)+f(x_1)
$$
Om $\hat{f}(x)$ är en linje som går genom två punkter $(x_0, f(x_0))$ och $(x_1,f(x_1))$ och lösningen $\hat{f}(x)=0$ kan vi skriva
$$
x=x_1-f(x_1)\frac{x_1-x_0}{f(x_1)-f(x_0)}
$$
Formeln för iteration blir
$$
x=x_1-f(x_1)\frac{x_1-x_0}{f(x_1)-f(x_0)}\Rightarrow x_{k+1}=x_k-f(x_k)\frac{x_k-x_{k-1}}{f(x_k)-f(x_{k-1})},k=1,2,...
$$
**Exempel**

Låt $f(x)=x^3+x^2-3=0$. Låt även $x_0=0.5$, $x_1=1.5$. Vad blir $x_2$?

**Lösning**
$$
\begin{align}
x_2&=x_1-f(x_1)\frac{x_1-x_0}{f(x_1)-f(x_0)}\\
x_2&=1.5-(1.5^3+1.5^2-3)\frac{1.5-0.5}{(1.5^3+1.5^2-3)-(0.5^3+0.5^2-3)}\\
x_2&=1.5-2.625\frac{1}{5.25}\\
x_2&=1
\end{align}
$$

#### Fixpunktmetoden

#### Intervallhalveringsmetoden

### Interpolation

#### Polynominterpolation

Om vi har $n+1$ olika punkter $x_0,x_1,…,x_n$ med motsvarande funktionsvärden $f_0,f_1,…,f_n$ finns ett entydigt polynom $p(x)$ av grad $\le n$ som går genom de $n+1$ olika punkterna.

Polynomet $p(x)$ kallas interpolationsplynomet till $f$ i de givna punkterna.

Det finns två olika metoder för att ta fram polynomet. Lagranges form och Newtons form.

Dessa metoder kan användas för att approximera en funktion och sedan använda den funktionen i Newtons metod för ekvationslösning.

##### Lagranges form

$$
p_n(x)=\sum_{i=0}^n f_iL_i(x)\\
L_i(x)=\prod_{0\le m\le n} \frac{x-x_m}{x_i-x_m}\;\;\;\;i≠m
$$

**Exempel**
$$
\begin{array}{c|c}
x_i&f_i\\
-1&-3\\
0&-3\\
1&-1\\
2&9
\end{array}
$$
**Lösning**

Sätt upp polynom med data från ovan.
$$
\begin{align}
p_3(x)&=f_0L_0(x)+f_1L_1(x)+f_2L_2(x)+f_3L_3(x)\\
&=-3L_0(x)-3L_1(x)-L_2(x)+9L_3(x)
\end{align}
$$


Beräkna värden för $L_i(x)$.
$$
\begin{align}
L_0(x)&=\frac{x-x_1}{x_0-x_1}*\frac{x-x_2}{x_0-x_2}*\frac{x-x_3}{x_0-x_3}=\frac{1}{6}x(x-1)(x-2)\\
L_1(x)&=\frac{x-x_0}{x_1-x_0}*\frac{x-x_2}{x_1-x_2}*\frac{x-x_3}{x_1-x_3}=\frac{1}{2}(x+1)(x-1)(x-2)\\
L_2(x)&=\frac{x-x_0}{x_2-x_0}*\frac{x-x_1}{x_2-x_1}*\frac{x-x_3}{x_2-x_3}=-\frac{1}{2}(x+1)x(x-2)\\
L_3(x)&=\frac{x-x_0}{x_3-x_0}*\frac{x-x_1}{x_3-x_1}*\frac{x-x_2}{x_3-x_2}=\frac{1}{6}(x+1)x(x-1)
\end{align}
$$

$$
\begin{align}
p_3(x)=-3*\frac{1}{6}x(x-1)(x-2)&+\\
-3*\frac{1}{2}(x+1)(x-1)(x-2)&+\\
-1*-\frac{1}{2}(x+1)x(x-2)&+\\
9*\frac{1}{6}(x+1)x(x-1)
\end{align}
$$

##### Newtons form

$$
p_n(x)=c_0+c_1(x-x_0)+c_2(x-x_0)(x-x_1)+...+c_n(x-x_0)(x-x_1)*...*(x-x_{n-1})
$$

När $x=x_0$ vet vi att $p_n(x_0)=c_0=f_0$. När $x=x_1$ får vi $p_n(x_1)=c_0+c_1(x_1-x_0)=f_1$. För $x=x_2$ gäller $p_n(x_1)=c_0+c_1(x_2-x_0)+c_2(x_2-x_0)(x_2-x_1)=f_2$.

De obekanta koefficienterna $c_n$ är lösningar till ett nedåt triangulärt, linjärt ekvationssystem.

**Exempel**
$$
\begin{array}{c|c}
x_i&f_i\\
-1&-3\\
0&-3\\
1&-1\\
2&9
\end{array}
$$
**Lösning**

Sätt in värden i $p_n(x)$ och lös värden för $c_n$.
$$
n+1=4\Rightarrow n=3\Rightarrow p_3(x)\\
p_3(x)=c_0+c_1(x+1)+c_2(x+1)x+c_3(x+1)x(x-1)\\
\begin{align}
p_3(x_0)&=p_3(-1)=c_0=f_0=-3\\
p_3(x_1)&=p_3(0)=c_1(0+1)=f_1=-3\\
&\Rightarrow c_0+c_1=-3\Rightarrow -3+c_1=-3\Rightarrow c_1=0\\
p_3(x_2)&=p_3(1)=c_0+c_2(1+1)1=f_2=-1\\
&\Rightarrow -3+2c_2=-1\Rightarrow 2c_2=2\Rightarrow c_2=1\\
P_3(x_3)&=c_0+c_1(c_3-c_0)+c_2(x_3-x_0)(x_3-x_1)+c_3(x_3-x_0)(x_3-x_1)(x_3-x_0)=f_3\\
&\Rightarrow -3+1(2+1)(2-0)+c_3(2+1)(2-0)(2-1)=9\\
&\Rightarrow c_3=1
\end{align}
$$
Vi kan nu bestäma vårt polynom.
$$
c_0=-3\\
c_1=0\\
c_2=1\\
c_3=1\\
p_3(x)=-3+(x+1)x+(x+1)x(x-1)=x^3+x^2-3
$$

#### Splite-interpolation [TODO]

GLHF

### Numerisk integration

När vi inte kan bestämma en primitiv funktion vid integrering används numerisk integration.

#### Trapetsregeln

Interpolera arean under en funktion genom att "rita" en trapets under den. Trapetsregeln är exakt för linjära funktioner.
$$
\int_a^bf(x)dx=\int_0^1e^{-x^2}dx
$$

Där t.ex. $f(x)$ är en given, men inte kan integreras med kända regler. 
$$
\int_a^bf(x)dx≈[f(b)+f(a)]\frac{(b-a)}{2}\\
R_T=\frac{f''(\xi)}{12}(b-a)^3
$$
Där $R_T$ är trunkeringsfelet och $a\leq\xi\leq b$.  

**Exempel**
$$
\int_0^1e^{-x^2}dx
$$
**Lösning**

Regeln använder följande formel:
$$
\int_a^bf(x)dx≈[f(b)+f(a)]\frac{(b-a)}{2}\\
R_T=\frac{f''(\xi)}{12}(b-a)^3
$$
Insättning ger:
$$
f(x)=e^{-x^2},\;b=1,\;a=0\\
f(b)=f(1)=e^{-1^2}=\frac{1}{e}\\
f(a)=f(0)=e^{-0^2}=1\\
\int_0^1e^{-x^2}dx(1-0)\frac{\frac{1}{e}+1}{2}=\frac{1}{2}(e^{-1}+1)=0.6839\\
\text{Beräkning lämnas som övning:}\\
R_T\leq0.13
$$

#### Simpsons regel

$$
\int_a^bf(x)dx≈\frac{b-a}{6}[f(b)+4f(\frac{a+b}{2})+f(a)]\\
R_T=-\frac{1}{28880}f^{(4)}(\xi)(b-a)^5
$$

Där $R_T$ är trunkeringsfelet och $a\leq\xi\leq b$.  

**Exempel**
$$
\int_0^1e^{-x^2}dx
$$
**Lösning**

Vi har givet formeln för Simpsons regel.
$$
\int_a^bf(x)dx≈\frac{b-a}{6}[f(b)+4f(\frac{a+b}{2})+f(a)]\\
R_T=-\frac{1}{28880}f^{(4)}(\xi)(b-a)^5
$$
Insättning ger:
$$
f(x)=e^{-x^2},\;b=1,\;a=0\\
f(b)=f(1)=e^{-1}\\
f(a)=f(0)=1\\
f(\frac{a+b}{2})=f(0.5)=e^{-0.5^2}=e^{-0.25}\\
I=\frac{1-0}{6}(e^{-1}+4e^{-0.25}+1)=0.7472
$$
Den numeriska integralen är $0.7472$.

Beräkning för trunkeringsfelet lämnas som övning.
$$
\begin{align}
R_T&=-\frac{1}{2880}(12-48\xi^2+16\xi^4)e^{-\xi^2}(1-0)^5\\
&=\;...\\
&\leq -\frac{29}{2880}
\end{align}
$$

#### Trapetsformeln

Interpolera arean under en funktion genom att "rita" flera trapetser under den. Istället för att utföra trapetsregeln på en hel funktion, använder vi den på mindre intervall för att få större nogrannhet. Om vi delar in intervallet $n$ i delintervall av längd $h=(b-a)/n$ och använder trapetsregeln på varje delintervall så får vi trapetsformeln. Trapetsformeln är exakt för linjära funktioner.
$$
T(h)=h\bigg(\frac{f(a)}{2}+f(a+h)+f(a+2h)+...+\frac{f(b)}{2}\bigg)
$$

$$
R_T=\frac{b-a}{12}h^2f''(\xi)
$$

Där $R_T$ är trunkeringsfelet och $a\leq\xi\leq b$.  

**Exempel**
$$
\int_0^1e^{-x^2}dx\\
h=0.25
$$

**Lösning**
$$
h=0.25,\;a=0,\;b=1\\
T(0.25)=0.25\bigg[\frac{f(0)}{2}+f(0.25)+f(0.5)+f(0.75)+\frac{f(1)}{2}\bigg]=0.7430
$$

#### Simpsons formel

#### Richardsonextrapolation

En allmän teknik för att eliminera feltermer för en högre nogrannhet än metoden man använder för att extrapolera. Man behöver veta hur trunkeringsfelet ser ut.

För trapetsformeln har vi ett trunkeringsfel av ordning $\mathcal{O}(h^2)$. Utvecklingen för felet är $R_T=a_1h^2+a_2h^4+a_3h^6+…$

Man använder flera olika steglängder - Richardsonextrapolation. Låt steglängderna vara $h$ och $2h$. Då får vi
$$
T(h)=\int_a^bf(x)dx+a_1h^2+a_2h^4+a_3h^6+...\\
T(2h)=\int_a^bf(x)dx+4a_1h^2+16a_2h^4+64a_3h^6\\
T(h)+\frac{T(h)-T(2h)}{3}=\int_a^bf(x)dx+b_1h^4+b_2h^6+...
$$
för våra nya koefficienter $b_i,\;i=1,2,…$

Vi har nu fått en bättre interpolation vars fel är av ordning $\mathcal{O}(h^4)$. Denna nya formel betecknas 
$$
T^{(2)}(h)=T(h)+\frac{T(h)-T(2h)}{3}
$$
På samma vis kan man fortsätta med $T^{(2)}(h)$ och $T^{(2)}(2h)$ för att få ner felet ytterligare.

Enligt Richardsonextrapolation är trunkeringsfelet $|R_T|\leq|T(h)-T(2h)|$.

#### Singulariteter och generaliserade integraler

Vi har hittills avgränsat oss till integraler över ett ändligt intervall. Nu ska vi titta närmre på generaliserade integraler.

##### Variabelsubstitution

**Exempel**
Lös nedanstående integral. Använd steglängden $h=1$.
$$
\int_0^\infty\frac{\arctan(x)}{1+x^2}dx
$$
**Lösning**

Vi använder variabelsubstitutionen $x=\frac{1-t}{t}$  och får integralen
$$
\int_0^1\arctan\bigg(\frac{1-t}{t}\bigg)dt=\frac{1}{2}\bigg(\frac{\pi}{2}+0\bigg)=\frac{\pi}{4}
$$

##### Kapning

Beräkna över ett ändligt intervall och uppskatta felet över hela intervallet. Man svarar med en summa av integraler $I=I_1+I_2$.

**Exempel 1**

Lös integralen
$$
I=\int_0^\infty\frac{e^{-x}}{1+xe^{-x}}dx
$$
med två korrekta decimaler. 

**Lösning**

$$
I_1=\int_0^a\frac{e^{-x}}{1+xe^{-x}}dx\\
I_2=\int_a^\infty\frac{e^{-x}}{1+xe^{-x}}dx
$$

Bestäm $a$ så att $I_2$ blir tillräckligt liten. Vi kan uppskatta $I_2$ med

$$
0\leq I_2=\int_a^\infty\frac{e^{-x}}{1+xe^{-x}}dx\leq\int_a^\infty e^{-x}dx=e^{-a}
$$

Om $a=5$ blir $e^{-a}\leq0.007$ vilket inte bör påverka svaret så mycket om $I_1$ löses tillräckligt nogrannt (läs Richardsonextrapolation).

Uträkning lämnas som övning. Använd steglängderna $h=0.2,\;h=0.1,\;h=0.05$.

$$
T(0.2)=0.806347\\
T(0.1)=0.801436\\
T(0.05)=0.800195\\
T^{(2)}(0.1)=0.799799\\
T^{(2)}(0.05)=0.799781\\
$$

Feluppskattning enligt tumregeln ger

$$
|R_T|\leq T^{(2)}(0.1)-T^{(2)}(0.2)\leq 2*10^{-5}
$$

Lösning ger $I_1=0.7998\pm0.4*10^{-4}$. Eftersom $0\leq I_2\leq0.007$ kan vi ange $I$ som
$$
I=I_1+I_2=0.7998\pm0.4*10^{-4}+0.0035\pm0.0035=0.8033\pm0.004
$$

