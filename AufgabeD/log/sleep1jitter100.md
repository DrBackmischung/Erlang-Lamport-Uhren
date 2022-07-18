## Sleep: 1
## Jitter: 100
## Befehl: `test:run(1,100).`

(Die Laufzeit des Programmes wurde auf 500 ms verringert, um Überbelastung der Ausgabe zu vermeiden)

```
log: 1 einstein {sending,{hello,53}}
log: 1 euler {sending,{hello,44}}
log: 1 turing {sending,{hello,40}}
log: 1 curie {sending,{hello,8}}
log: 2 einstein {sending,{hello,52}}
log: 2 euler {received,{hello,53}}
log: 2 curie {received,{hello,44}}
log: 2 turing {sending,{hello,37}}
log: 3 euler {received,{hello,8}}
log: 3 einstein {sending,{hello,34}}
log: 4 euler {received,{hello,40}}
log: 5 euler {received,{hello,52}}
log: 6 euler {received,{hello,34}}
log: 7 euler {sending,{hello,84}}
log: 8 curie {received,{hello,84}}
log: 8 euler {received,{hello,37}}
log: 9 curie {sending,{hello,66}}
log: 9 euler {sending,{hello,48}}
log: 10 einstein {received,{hello,66}}
log: 10 curie {sending,{hello,75}}
log: 11 turing {received,{hello,75}}
log: 11 curie {received,{hello,48}}
log: 12 turing {sending,{hello,96}}
log: 13 einstein {received,{hello,96}}
log: 13 turing {sending,{hello,22}}
log: 14 einstein {sending,{hello,37}}
log: 15 euler {received,{hello,37}}
log: 16 euler {sending,{hello,38}}
log: 17 curie {received,{hello,38}}
log: 17 euler {sending,{hello,36}}
log: 18 curie {sending,{hello,13}}
log: 18 euler {sending,{hello,7}}
log: 19 einstein {received,{hello,13}}
log: 19 curie {received,{hello,36}}
log: 19 turing {received,{hello,7}}
log: 20 einstein {received,{hello,22}}
log: 20 curie {sending,{hello,44}}
log: 21 einstein {sending,{hello,24}}
log: 21 euler {received,{hello,44}}
log: 22 turing {received,{hello,24}}
log: 22 euler {sending,{hello,35}}
log: 23 turing {sending,{hello,27}}
log: 23 curie {received,{hello,35}}
log: 24 einstein {received,{hello,27}}
log: 25 einstein {sending,{hello,20}}
log: 26 turing {received,{hello,20}}
log: 27 turing {sending,{hello,21}}
log: 28 curie {received,{hello,21}}
log: 28 turing {sending,{hello,21}}
log: 29 curie {received,{hello,21}}
log: 30 curie {sending,{hello,6}}
log: 31 euler {received,{hello,6}}
log: 31 curie {sending,{hello,1}}
log: 32 einstein {received,{hello,1}}
log: 32 euler {sending,{hello,44}}
log: 33 turing {received,{hello,44}}
log: 34 turing {sending,{hello,20}}
log: 35 einstein {received,{hello,20}}
log: 35 turing {sending,{hello,24}}
log: 36 einstein {sending,{hello,47}}
log: 36 turing {sending,{hello,8}}
log: 37 euler {received,{hello,47}}
log: 37 einstein {sending,{hello,16}}
log: 38 euler {sending,{hello,57}}
log: 39 curie {received,{hello,57}}
log: 40 curie {received,{hello,24}}
log: 41 curie {received,{hello,8}}
log: 42 curie {sending,{hello,97}}
stop
```
