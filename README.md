# Linear Response Approximation on a Membrane protein

## Initial configuration

- **lra.sh** (file)
Adjust the sites variable to your protein

- **template.dat** (file)
Adjust the pypka variable to your liking

- **lra.plot** (file)
Adjust the xrange and yrange variables to include the desired pH range

- *gros_deprot* (dir)
Place the .gro files of the deprotonated state inside this directory

- *gros_prot* (dir)
Place the .gro files of the protonated state inside this directoryy


## Run

Run pypka on all structures found in the *gros* directory to get the average protonation of your residue of interest over a range of pH values.
Apply an Henderson-Hasselbalch equation to the protonations obtained from the pypka titrations of both states independently and average the obtained pKa values.

```
./lra.sh
```

## Plot

Generates

```
gnuplot lra.plot
```

