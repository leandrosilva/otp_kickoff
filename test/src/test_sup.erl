%%
%% Supervisor module
%%
%% File   : test_handler.erl
%% Created: 2009-10-19
%%
%% @author leandro <leandrodoze@gmail.com>
%% @copyright 2009 leandro
%%
%% @doc TODO make nice description
%%

-module(test_sup).
-author('leandro <leandrodoze@gmail.com>').

-behaviour(supervisor).

%% operation & maintenance api
-export([start_link/0]).

%% supervisor callback
-export([init/1]).
 
-define(SERVER, ?MODULE).
 
%%
%% Operation & Maintenance API
%%

%% @spec start_link() -> SupervisorReturn
%% @doc Start the supervisor for test
start_link() ->
   supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%
%% Supervisor callback function
%%
 
%% @spec init([]) -> SupervisorSpec
%% @doc Callback for initialize the supervisor for test
init([]) ->
   %% test_server is a supervisioned child process
   Server = {test_server_child,
              {test_server, start_link, []},permanent, 2000, worker, [test_server]},
              
   %% Restart strategies for childs
   {ok, {{one_for_one, 10, 1}, [Server]}}.
