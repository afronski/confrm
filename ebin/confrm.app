%% -*- erlang -*-
{application, confrm,
 [ { description, "Sample pet project which uses `riak_core`." },
   { vsn, "1.0" },
   { modules, [] },
   { registered, [] },
   { applications, [ kernel, stdlib, riak_core ] },
   { mod, { confrm_app, [] } },
   { env, [] }
 ]
}.
