# `confrm`

**This is a pet project**.

## How to build and run it?

### Single node

1. `make`
2. `make dev`
3. `rel/confrm/bin/confrm console`
4. In the *Erlang* shell invoke: `confrm:ping().`

### Cluster

1. `make`
2. `make devrel`
3. `for d in dev/dev*; do $d/bin/confrm start; done`
4. `for d in dev/dev*; do $d/bin/confrm ping; done`
5. Add rest of nodes to the first one: `for d in dev/dev{2,3,4}; do $d/bin/confrm-admin cluster join 'confrm1@127.0.0.1'; done`
6. Look at the cluster plan: `dev/dev1/bin/confrm-admin cluster plan`
7. And commit changes: `dev/dev1/bin/confrm-admin cluster commit`
8. You can observe progress of balancing the cluster with command: `dev/dev1/bin/confrm-admin member-status`
