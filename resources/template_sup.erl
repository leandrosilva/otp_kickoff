%%
%% Supervisor module
%%
%% File: template_sup.erl
%%

-module(template_sup).
-behaviour(supervisor).
 
-export([start_link/0, init/1]).
 
-define(SERVER, ?MODULE).
 
start_link() ->
   supervisor:start_link({local, ?SERVER}, ?MODULE, []).
 
init([]) ->
   %% template_server is a supervisioned child process
   Server = {template_server_child,
              {template_server, start_link, []}, permanent, 2000, worker, [template_server]},
              
   %% Restart strategies for childs
   {ok, {{one_for_one, 10, 1}, [Server]}}.
