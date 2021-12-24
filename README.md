# Sparse_and_Balanced_MDS_Codes_over_Small_Fields

Maximum Distance Separable (MDS) codes with a sparse and balanced generator matrix are appealing  in distributed storage systems for balancing and minimizing the computational load. Such codes have been constructed via Reed-Solomon codes over large fields. In this paper, we focus on small fields. We prove that there exists an $[n,k]q$ MDS code that has a sparse and balanced generator matrix for any $q\geq n-1$ provided that $n\leq 2k$,
 by designing several algorithms with complexity running in polynomial time in $k$ and $n$.  For the case $n>2k$, we give some constructions for $q=n=p^s$ and $k=p^em$ based on sumsets, when $e\leq s-2$ and $m\leq p-1$, or $e=s-1$ and $m<\frac{p}{2}$.

Algorithm1
Input: Integers $k,m$ with $1\leq m< \frac{\sqrt{8k+1}-1}{8}$and $k$ is even;
Output: A sparse, good and balanced binary $k \times n$ matrix $M_{\mathcal{S}}$.

Algorithm2
Input: Integers $k,t$ with $t\in[\lceil\frac{1+\sqrt{8k+1}}{2}\rceil,\lfloor k-\sqrt{k}\rfloor]$ and $k$ is even;
Output: A sparse, good and balanced binary $k \times n$ matrix $M_{\mathcal{S}}$.

Algorithm3
Input: Integers $k,u$ with $2\leq u\leq \lfloor \sqrt{k}\rfloor$ and $k$;
Output: A sparse, good and balanced binary $k \times n$ matrix $M_{\mathcal{S}}$.