%%
%% Application module
%%
%% File   : test_handler.erl
%% Created: 2009-10-19
%%
%% @author leandro <leandrodoze@gmail.com>
%% @copyright 2009 leandro
%%
%% @doc TODO make nice description
%%

-module(test_app).
-author('leandro <leandrodoze@gmail.com>')

-behaviour(application).
 
-export([start/2, stop/1]).

%% @spec start(_Type, _StartArgs)  -> {ok, Pid}
%% @doc Application start callback test
start(_Type, _StartArgs) ->
   case test_sup:start_link() of
      {ok, Pid} ->
          alarm_handler:clear_alarm({application_stopped, ?MODULE}),
          {ok, Pid};
      Error ->
          alarm_handler:set_alarm({{application_stopped, ?MODULE}, []}),
          Error
   end.

%% @spec stop(_State) -> ok
%% @doc Application stop callback for test
stop(_State) ->
   alarm_handler:set_alarm({{application_stopped, ?MODULE}, []}),
   ok.
