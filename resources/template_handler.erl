%%
%% Handler module that can be used by server to catch and handle events
%%
%% File: template_handler.erl
%%

-module(template_handler).
-export([init/1, terminate/1, handle_event/2]).

init(State) -> State.

terminate(State) ->
  {ok, State}.

handle_event({event, _Event}, State) ->
  {ok, State};

handle_event(_Event, State) ->
  State.