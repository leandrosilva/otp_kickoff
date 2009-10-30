%%
%% Handler module used by server (specially on event manager) to deal with events
%%
%% File   : <%=handler_name%>_handler.erl
%% Created: <%=Date.today%>
%%
%% @author <%=author_name%> <<%=author_email%>>
%% @copyright <%=today.year%> <%=author_name%>
%%
%% @doc TODO make nice description
%%

-module(<%=handler_name%>_handler).
-author('<%=author_name%> <<%=author_email%>>').

-export([init/1, terminate/1, handle_event/2]).

%% @spec init(State) -> State
%% @doc Handler's init callback
init(State) -> State.

%% @spec terminate(State) -> State
%% @doc Handler's terminate callback
terminate(State) ->
  {ok, State}.

%% @spec handle_event({event, _Event}, State) -> {ok, State}
%% @doc Handle's event callback
handle_event({event, _Event}, State) ->
  {ok, State};

%% @spec handle_event(_Event, State) -> State
%% @doc Handler's "catch all event" callback
handle_event(_Event, State) ->
  State.