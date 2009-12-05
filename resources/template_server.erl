%%
%% Supervised worker process module
%%
%% File   : <%=server_name%>_server.erl
%% Created: <%=TODAY%>
%%
%% @author <%=author_name%> <<%=author_email%>>
%% @copyright <%=TODAY.year%> <%=author_name%>
%%
%% @doc TODO make nice description
%%

-module(<%=server_name%>_server).
-author('<%=author_name%> <<%=author_email%>>').

-behaviour(gen_server).
 
%% operation & maintenance api
-export([start_link/0]).
 
%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2,
         handle_info/2, terminate/2, code_change/3]).

%%
%% Operation & Maintenance API
%%

%% @spec start_link() -> {ok, Pid}
%% @doc Start the <%=server_name%>_server
start_link() ->
   gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

%%
%% Genserver callback functions
%%

%% @spec init(State) -> {ok, State}
%% @doc Callback for initialize the <%=server_name%>_server
init(State) ->
  {ok, State}.
 
%% @spec handle_call(_Request, _From, State) -> {reply, Reply, State}
%% @doc Callback for synchronous requests
handle_call(_Request, _From, State) ->
   Reply = ok,
   {reply, Reply, State}.
 
%% @spec handle_cast(stop, State) -> {stop, normal, State}
%% @doc Callback for assynchronous messages
handle_cast(stop, State) ->
	{stop, normal, State};

%% @spec handle_cast(_Msg, State) -> {noreply, State}
%% @doc Callback for assynchronous messages
handle_cast(_Msg, State) ->
   {noreply, State}.
 
%% @spec handle_info(_Info, State) -> {noreply, State}
%% @doc Callback for timeout or other unreconized messages
handle_info(_Info, State) ->
   {noreply, State}.
 
%% @spec terminate(_Reason, _State) -> ok
%% @doc Callback for free resources used by the server
terminate(_Reason, _State) ->
   ok.
 
%% @spec code_change(_OldVsn, State, _Extra) -> {ok, State}
%% @doc Callback for upgrade source code
code_change(_OldVsn, State, _Extra) ->
   {ok, State}.
