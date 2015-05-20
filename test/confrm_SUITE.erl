-module(confrm_SUITE).

-include_lib("common_test/include/ct.hrl").

-export([ all/0, init_per_testcase/2, end_per_testcase/2 ]).
-export([ example_test/1 ]).

all() ->
    [ example_test ].

init_per_testcase(_, Config) ->
    {ok, Pid} = riak_core_vnode:start_link(confrm_vnode, 0, []),
    [ {vnode, Pid} | Config ].

end_per_testcase(_, Config) ->
    Pid = ?config(vnode, Config),
    riak_core_test_utils:send_command(Pid, stop),
    ok.

example_test(_Config) ->
    ok.
