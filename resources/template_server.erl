%%
%% Supervised worker process module
%%
%% File   : <%=application_name%>_handler.erl
%% Created: <%=Date.today%>
%%
%% @author <%=author_name%> <<%=author_email%>>
%% @copyright <%=today.year%> <%=author_name%>
%%
%% @doc TODO make nice description
%%

-module(<%=application_name%>_server).
-author('<%=author_name%>')

-behaviour(gen_server).
 
%% operation & maintenance api
-export([start_link/0]).
 
%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2,
         handle_info/2, terminate/2, code_change/3]).

%%
%% Operation & Maintenance API
%%

%% @spec start_link() -> ServerReturn
%% @doc Start the server for <%=application_name%>
start_link() ->
   gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).
 
%% @spec stop() -> ServerReturn
%% @doc Stopt the server for <%=application_name%>
stop() ->
	gen_server:cast(?MODULE, stop).

%%
%% Genserver callback functions
%%

%% @spec init(State) -> {ok, State}
%% @doc Callback for initialize the server
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
%% @doc Callback for give informations about server
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
