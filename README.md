This repository contains Matlab/Octave code for running a demonstration of 
solving graph isomorphism via replicator equations.  To try out the code, launch 
Matlab, change to the directory containing the repository, and type
<pre>
    addpath localist
    gidemo(fig1, fig1)
</pre>

This will use the original (localist) implementation from 
[Pelillo (1999)](http://www.dsi.unive.it/~pelillo/papers/NeuralComputation%201999.pdf).
To run the VSA implementation described in 
[Levy & Gayler (2009)](http://home.wlu.edu/~levys/publications/analogy09%20-%20gayler%20levy%20-%20final.pdf)
type

<pre>

    addpath vsa
    gidemo(fig1, fig1)
</pre>

Type
<pre>

    help gidemo
</pre>

to learn what the input parameters are.




</body>
</html>

