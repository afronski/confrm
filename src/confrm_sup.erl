-module(confrm_sup).
-behaviour(supervisor).

-export([ start_link/0 ]).
-export([ init/1 ]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init(_Args) ->
    VMaster = { confrm_vnode_master,
                  {riak_core_vnode_master, start_link, [confrm_vnode]},
                  permanent, 5000, worker, [riak_core_vnode_master]},

    { ok,
        { {one_for_one, 5, 10},
          [VMaster]}}.
