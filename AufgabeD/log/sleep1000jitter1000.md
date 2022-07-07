## Sleep: 1000
## Jitter: 1000
## Befehl: `test:run(1000,1000).`

```
log: 1 einstein {sending,{hello,66}}
log: 1 euler {sending,{hello,20}}
log: 1 curie {sending,{hello,58}}
log: 2 turing {received,{hello,58}}
log: 2 einstein {received,{hello,20}}
log: 3 turing {received,{hello,66}}
log: 3 einstein {sending,{hello,29}}
log: 4 euler {received,{hello,29}}
log: 4 turing {sending,{hello,1}}
log: 4 einstein {sending,{hello,3}}
log: 5 curie {received,{hello,1}}
log: 5 euler {received,{hello,3}}
log: 6 curie {sending,{hello,47}}
log: 7 turing {received,{hello,47}}
log: 8 turing {sending,{hello,6}}
log: 9 euler {received,{hello,6}}
log: 10 euler {sending,{hello,32}}
log: 11 einstein {received,{hello,32}}
log: 11 euler {sending,{hello,20}}
log: 12 einstein {sending,{hello,47}}
log: 12 euler {sending,{hello,95}}
stop
```
