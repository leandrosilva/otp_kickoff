%%
%% Handler module that can be used by server to catch and handle events
%%
%% File   : <%=application_name%>_handler.erl
%% Created: <%=Date.today%>
%%
%% @author <%=author_name%> <<%=author_email%>>
%% @copyright <%=today.year%> <%=author_name%>
%%
%% @doc TODO make nice description
%%

-module(<%=application_name%>_handler).
-author('<%=author_name%>')

-export([init/1, terminate/1, handle_event/2]).

%% @spec init(State) -> State
%% @doc Handler init callback
init(State) -> State.

%% @spec terminate(State) -> State
%% @doc Handler terminate callback
terminate(State) ->
  {ok, State}.

%% @spec handle_event({event, _Event}, State) -> {ok, State}
%% @doc Handle event function
handle_event({event, _Event}, State) ->
  {ok, State};

%% @spec handle_event(_Event, State) -> State
%% @doc Handle event "catch" function
handle_event(_Event, State) ->
  State.