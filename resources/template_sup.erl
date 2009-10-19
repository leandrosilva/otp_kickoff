%%
%% Supervisor module
%%
%% File: <%=application_name%>_sup.erl
%%

-module(<%=application_name%>_sup).
-behaviour(supervisor).
 
-export([start_link/0, init/1]).
 
-define(SERVER, ?MODULE).
 
start_link() ->
   supervisor:start_link({local, ?SERVER}, ?MODULE, []).
 
init([]) ->
   %% <%=application_name%>_server is a supervisioned child process
   Server = {<%=application_name%>_server_child,
              {<%=application_name%>_server, start_link, []},permanent, 2000, worker, [<%=application_name%>_server]},
              
   %% Restart strategies for childs
   {ok, {{one_for_one, 10, 1}, [Server]}}.
