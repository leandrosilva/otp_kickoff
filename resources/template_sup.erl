%%
%% Supervisor module
%%
%% File   : <%=supervisor_name%>_sup.erl
%% Created: <%=TODAY%>
%%
%% @author <%=author_name%> <<%=author_email%>>
%% @copyright <%=TODAY.year%> <%=author_name%>
%%
%% @doc TODO make nice description
%%

-module(<%=supervisor_name%>_sup).
-author('<%=author_name%> <<%=author_email%>>').

-behaviour(supervisor).

%% operation & maintenance api
-export([start_link/0]).

%% supervisor callback
-export([init/1]).
 
-define(SERVER, ?MODULE).
 
%%
%% Operation & Maintenance API
%%

%% @spec start_link() -> {ok, Pid}
%% @doc Start the <%=supervisor_name%>_sup for <%=application_name%>
start_link() ->
   supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%
%% Supervisor callback function
%%
 
%% @spec init([]) -> {ok, {{RestartStrategy, MaxRestart, MaxTime}, [ChildSpec]}}
%% @doc Callback for initialize the <%=supervisor_name%>_sup for <%=application_name%>
init([]) ->
   %% <%=application_name%>_server is a supervisioned child process
   Server = {<%=application_name%>_server,
              {<%=application_name%>_server, start_link, []}, permanent, brutal_kill, worker, [<%=application_name%>_server]},
              
   %% Restart strategies for childs
   {ok, {{one_for_one, 10, 1}, [Server]}}.
