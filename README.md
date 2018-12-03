This repository is dedicated to store "real" workflows that we have implemented for different scientific communities ( e.g., Seismologists, Astrophysics, etc) .
Simpler dispel4py workflows can be found [here](https://github.com/rosafilgueira/dispel4py_training_material)


### How to run

First, you must run the container. In this case, the command bash will be executed.

```
docker run --interactive \
        --tty \
        --name tc_cross_correlation \
        dockerpedia/tc_cross_correlation bash
```

And run the workflow

```
root@86642e6f9e6d:/# cd dispel4py_workflows/
root@a0f861e6fbc4:~$ dispel4py multi tc_cross_correlation/realtime_prep.py -f tc_cross_correlation/realtime_xcorr_input.jsn -n 4
root@a0f861e6fbc4:~$ dispel4py multi tc_cross_correlation/realtime_xcorr.py -n 4
```
