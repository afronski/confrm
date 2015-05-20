-module(confrm_app).
-behaviour(application).

-export([ start/2, stop/1 ]).

start(_StartType, _StartArgs) ->
    case confrm_sup:start_link() of
        {ok, Pid} ->
            ok = riak_core:register([{vnode_module, confrm_vnode}]),

            ok = riak_core_ring_events:add_guarded_handler(confrm_ring_event_handler, []),
            ok = riak_core_node_watcher_events:add_guarded_handler(confrm_node_event_handler, []),
            ok = riak_core_node_watcher:service_up(confrm, self()),

            {ok, Pid};
        {error, Reason} ->
            {error, Reason}
    end.

stop(_State) ->
    ok.
