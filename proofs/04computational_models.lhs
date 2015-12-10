% https://www.youtube.com/watch?v=-4Yp3j_jk8Q
% % % include lhs2TeX.fmt

\documentclass{article}
%include polycode.fmt
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{ucs}
\usepackage[utf8x]{inputenc}
\begin{document}
% which interesting recursively defined f :: Nat → Nat → Nat do I know?
% gcd, lcm
% pow, tetration, pentation
% Ackermann's function
% 
\section{gcd}
\vspace{2ex}

$Init:(x=M)∧(y=N)$

\vspace{8ex}
$NextState:((x>y)∧(x'=y)∧(y'=x`mod`y))\vspace{4ex}∨((x<y)∧(y'=x)∧(x'=y`mod`x))$


\begin{align}
(\\ 
 &   & & (&(x>y)&  &∧& &(x'=y)& &∧& &(y'=x`mod`y))&\\
 & ∨ & & (&(x<y)&  &∧& &(y'=x)& &∧& &(x'=y`mod`x))&)
\end{align}
% HWÆT how to render a backtick?
% why can't I put \smallcaps{OR} inside align environment?


\section{TLA\textsuperscript{+} Language}
% how do I do an upper-index in a section title?
% \textsuperscript w00t
\subsection{GCD example specification}
%
\begin{align*}
  \textsc{Constants} && M, &    N & & \\
  \textsc{Variables} && x, &   y & & \\
% HWÆT this alignment sucks. how do I make it better?
\end{align*}


\begin{align*}
  \textit{Init}     & \triangleq &(x=M)& &∧ & &(y=N) \\
  \textit{Next}     & \triangleq & (    & &( x>y& & &      \\
                    &            & & ∧ & (x'=y) \\
                    &            & & ∧ & (y'=x-y) \\
                    & ∨ &(&&(x<y)&  \\
                    &&&∧& (y'=x)& \\
                    &&&∧& (x'=y-x))&)
\end{align*}
\subsection{quicksort example}
What it is: a divide-and-conquer algorithm for sorting an array in place.
\[
A[0],...,A[N-1]
\]
Uses a procedure $Partition(lo,hi)$.\\
$Partition$ chooses $pivot$ in $lo...(hi-1)$, permutes $A[lo],...,A[hi]$\\
to make $A[lo],...,A[pivot]\leq A[pivot+1],...,A[hi]$ \\
and returns pivot.

\subsubsection{thinking around procedures}
A procedure differs from a (pure) function in that it has side-effects. Side effect here are crucial.
We can think of a procedure as a function which take a hidden input, $State$, and returns a hidden output, $State'$. But then the order of execution becomes important. If our procedure is tree-recursive, we have to traverse the whole tree in the correct order to juggle the changing $State$. But there is a formalism for the order of execution, and this is a monad!\\
N.B.: see if the monad is a minimal formalism, or is there something more abstract that would suffice.\\
% HWÆT: left-indent and marginalia.
Now, is order of execution really important here? for example, does it matter whether we sort the lower or the higher half first? No, it does not.

\begin{code}

> instance Monad State where
>          return :: a -> State a
>          return a = State a
>
>          (>>=) :: State a -> (a -> State b) -> State b
>          (>>=) a f = return (f a)
>
\end{code}

% what are monadic laws?
% something something identity something something associativity something something.

\begin{code}
> qsort :: Ord a => State [a] -> [a]
> qsort as = do 
>   n      <- length as
>   pivot  <- n/2 -- floor
>   ls     <- take n as
>   hs     <- drop n as
>   -- order here is forced by monadic idiom, it is not a necessary part of an algorithm.
>   result <- qsort ls ++ qsort hs
>   return result

\end{code}
\\
\textsc{FOO}
\\
\\ 
\\


\subsubsection{Parallel QuickSort specification}
% TODO the above is a mess. I should come back to it later and rewrite with the state monad.
\begin{align*}
  \textit{Init}     
    & \triangleq & &A    &=&\textsc{array of length }N& & \\
    &            &∧&U    &=&\{ (0,N-1)  \}            & \textup{set of all contigious intervals to be sorted} & \\
    &            &∧&pivot& =& N/2                     & & \\
% isn't pivot particular to a specific range?
% this produces a comparison tree.
\end{align*}
\begin{align*}
  \textit{Partitions(B, pivot, lo, hi)} 
    & \triangleq & &\textup{the set of arrays obtained from $B$by 
                     permuting $B[lo],...,B[hi]$ such that...} \\   
% the table is too wide here. How do I save it?
\end{align*}
\begin{align*}
  \textit{Next}
    & \triangleq & (& U \neq \{ \} \\
    & ∧ & & \textup{Pick any $b, t$ in} U: \\
    &   &  & \textsc{if} &b \neq t \\
    &   &   &\textsc{then} &\textup{pick any $p$ in $b..(t-1)$}\\
    &            &  & U' \\
&& = &U \textup{with $<b,t>$ removed and $<b, p-1>$ and $<p, t>$ added}& & & \\
    &            &  & ∧ & (x'=y) \\
    &            &  & ∧ & (y'=x-y) \\
    & ∨ &(&&(x<y)&  \\
    &&&∧& (y'=x)& \\
    &&&∧& (x'=y-x))&)
\end{align*}

% damn the align* environment and damn me for being so stupid that I can't
% use it properly.
% anyhow, the point here is 
% check if U is empty yet, if it is, there is no NEXT, so we stop.
% otherwise, pick any interval (b,t) in U
% that is, ∃(b,t) in U
% (and here is where alternative computational models may come into play)
%   if an interval is a singleton (a=t) then remove it,
%   otherwise pick a pivot inside it and change A→A', U→U' as follows:
% A→A' is picking another valid permutation of A, as given by Partitions(A,p,b,t)
% U→U' is removing (b,t) and adding (b,p) and (p+1,t) 
% (we check if they're singletones on the next iteration)
%
%% U→U' is splitting some of the intervals in U or removing a singleton interval.
% obviously, members of U may be processed in any order.
% (and now I'm confused as to where the sorting happens. How can an element travel along the whole array when we split it and never reconnect the parts?)
%

% NB does all this mean that iteration is more general than recursion?

\section{copy-pasted example of various alignment commands}

\begin{equation}
\frac{
    \begin{array}[b]{r}
      \left( x_1 x_2 \right)\\
      \times \left( x'_1 x'_2 \right)
    \end{array}
  }{
    \left( y_1y_2y_3y_4 \right)
  }
\end{equation}

%requires amsmath
\[ f(n) =
  \begin{cases}
    n/2       & \quad \text{if } n \text{ is even}\\
    -(n+1)/2  & \quad \text{if } n \text{ is odd}\\
  \end{cases}
\]


\begin{align}
 A &=     \left(\int_t XXX       \right.\nonumber\\
   &\qquad \left.\vphantom{\int_t} YYY \dots \right)
\end{align}

\end{document}

% HWÆT: remove second-line indentation
% lookup command to inser a horizonal line or a vertical space
% how to lay out a bunch of formulas?
