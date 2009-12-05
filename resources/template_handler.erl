%%
%% Handler module used by event manager to deal with events
%%
%% File   : <%=handler_name%>_handler.erl
%% Created: <%=TODAY%>
%%
%% @author <%=author_name%> <<%=author_email%>>
%% @copyright <%=TODAY.year%> <%=author_name%>
%%
%% @doc TODO make nice description
%%

-module(<%=handler_name%>_handler).
-author('<%=author_name%> <<%=author_email%>>').

-behahiour(gen_event).

-export([init/1, terminate/1, handle_event/2, handle_call/2, handle_info/2, code_change/3]).

%% @spec init(State) -> State
%% @doc Callback for initialize the handler
init(State) ->
	{ok, State}.

%% @spec terminate(State) -> {ok, State}
%% @doc Callback for cleanup the handler
terminate(State) ->
  {ok, State}.

%% @spec handle_event(_Event, State) -> {ok, State}
%% @doc Callback for notified events on gen_event
handle_event(_Event, State) ->
  {ok, State}.

%% @spec handle_call(_Request, State) -> {ok, Reply, State}
%% @doc Callback for specific calls for this handler
handle_call(_Request, State) ->
	{ok, noreply, State}.

%% @spec handle_info(_Info, State) -> {ok, State}
%% @doc Callback for unknow messages by the gen_event
handle_info(_Info, State) ->
	{ok, State}.

%% @spec code_change(_OldVsn, State, _Extra) -> {ok, State}
%% @doc Callback for update internal state during upgrade/downgrade
code_change(_OldVsn, State, _Extra) ->
	{ok, State}.