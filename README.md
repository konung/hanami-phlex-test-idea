# Just testing out an idea: how Phlex would perform in confines of a framework


To try

```shell
git clone git@github.com:konung/hanami-phlex-test-idea.git
cd hanami-phlex-test-idea
bundle install
hanami s
```

I was testing on Ruby 3.2.0 and `--jit` flag like so

```
RUBYOPT="--jit" hanami s
```

I tested on a MacBookPro with 16 cores.
Puma config is maxed out to match my dev laptop - see `config/puma.rb` and adjust if you are running into issues.

Once server is running  you can use your favorite benchmarking tool to hit relevant endpoints.
I used `hey` as it's pretty straightforward to setup and use. But `wrk2` produced similar results. 

## Important!!! Can't stress this enough!
> Take the following numbers with a grain of salt - as we are rendering a basic template, and our app doesn't make any calls to DB, make any expensive calculations or serve any assets.
> The idea here is just to test pure response speed while rendering HTML using HAML ( or Slim/Erb ) vs Phlex

Here are my results  ( yes that's 6650 requests per second :D )

Phlex response is generated in 200-600 `us` ( that's `us` not `ms` ). Essentially that's as fast as Hanami spitting back some strings.




### Phlex

```
hey -c 10 -z 10s http://localhost:2300/phlex

Summary:
  Total:	10.0017 secs
  Slowest:	0.3078 secs
  Fastest:	0.0007 secs
  Average:	0.0015 secs
  Requests/sec:	6650.7542

  Total data:	111072961 bytes
  Size/request:	1669 bytes

Response time histogram:
  0.001 [1]	|
  0.031 [66494]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.062 [10]	|
  0.093 [12]	|
  0.124 [0]	|
  0.154 [0]	|
  0.185 [0]	|
  0.216 [0]	|
  0.246 [0]	|
  0.277 [0]	|
  0.308 [2]	|


Latency distribution:
  10% in 0.0010 secs
  25% in 0.0011 secs
  50% in 0.0013 secs
  75% in 0.0016 secs
  90% in 0.0023 secs
  95% in 0.0026 secs
  99% in 0.0037 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0007 secs, 0.3078 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0012 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0009 secs
  resp wait:	0.0014 secs, 0.0007 secs, 0.3052 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0008 secs

Status code distribution:
  [200]	66519 responses

```


### HAML Template
```
hey -c 10 -z 10s http://localhost:2300/haml_template

Summary:
  Total:	10.0079 secs
  Slowest:	0.0457 secs
  Fastest:	0.0055 secs
  Average:	0.0095 secs
  Requests/sec:	1050.6732

  Total data:	22162948 bytes
  Size/request:	2107 bytes

Response time histogram:
  0.005 [1]	|
  0.009 [5095]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.014 [5385]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.018 [22]	|
  0.022 [9]	|
  0.026 [1]	|
  0.030 [0]	|
  0.034 [0]	|
  0.038 [0]	|
  0.042 [1]	|
  0.046 [1]	|


Latency distribution:
  10% in 0.0078 secs
  25% in 0.0087 secs
  50% in 0.0095 secs
  75% in 0.0104 secs
  90% in 0.0111 secs
  95% in 0.0115 secs
  99% in 0.0124 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0055 secs, 0.0457 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0011 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0002 secs
  resp wait:	0.0094 secs, 0.0054 secs, 0.0433 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0001 secs

Status code distribution:
  [200]	10515 responses
```

### HAML Inline
```
hey -c 10 -z 10s http://localhost:2300/haml_inline

Summary:
  Total:	10.0086 secs
  Slowest:	0.2982 secs
  Fastest:	0.0051 secs
  Average:	0.0099 secs
  Requests/sec:	1006.5309

  Total data:	21173547 bytes
  Size/request:	2101 bytes

Response time histogram:
  0.005 [1]	|
  0.034 [10063]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.064 [0]	|
  0.093 [0]	|
  0.122 [0]	|
  0.152 [0]	|
  0.181 [0]	|
  0.210 [0]	|
  0.240 [0]	|
  0.269 [0]	|
  0.298 [10]	|


Latency distribution:
  10% in 0.0075 secs
  25% in 0.0084 secs
  50% in 0.0095 secs
  75% in 0.0106 secs
  90% in 0.0115 secs
  95% in 0.0122 secs
  99% in 0.0187 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0051 secs, 0.2982 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0011 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0001 secs
  resp wait:	0.0099 secs, 0.0050 secs, 0.2981 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0004 secs

Status code distribution:
  [200]	10074 responses

```


### JSON inline
```
hey -c 10 -z 10s http://localhost:2300/json


Summary:
  Total:	10.0019 secs
  Slowest:	0.0802 secs
  Fastest:	0.0009 secs
  Average:	0.0016 secs
  Requests/sec:	6295.0200

  Total data:	64483845 bytes
  Size/request:	1024 bytes

Response time histogram:
  0.001 [1]	|
  0.009 [62908]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.017 [18]	|
  0.025 [13]	|
  0.033 [12]	|
  0.041 [0]	|
  0.048 [0]	|
  0.056 [0]	|
  0.064 [0]	|
  0.072 [0]	|
  0.080 [10]	|


Latency distribution:
  10% in 0.0012 secs
  25% in 0.0013 secs
  50% in 0.0014 secs
  75% in 0.0017 secs
  90% in 0.0020 secs
  95% in 0.0024 secs
  99% in 0.0034 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0009 secs, 0.0802 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0011 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0014 secs
  resp wait:	0.0015 secs, 0.0008 secs, 0.0801 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0014 secs

Status code distribution:
  [200]	62962 responses

  ```
