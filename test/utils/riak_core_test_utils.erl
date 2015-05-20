-module(riak_core_test_utils).

-include_lib("riak_core/include/riak_core_vnode.hrl").

-export([ send_command/2, get_response/1 ]).

send_command(Pid, Request) ->
    Ref = make_ref(),
    gen_fsm:send_event(Pid, ?VNODE_REQ{request = Request, sender = {raw, Ref, self()}}),
    {ok, Ref}.

get_response(Ref) ->
    receive
        {Ref, M} -> {ok, M}
    after 1000 -> error
    end.
