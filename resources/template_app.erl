%%
%% Application module
%%
%% File   : <%=application_name%>_app.erl
%% Created: <%=TODAY%>
%%
%% @author <%=author_name%> <<%=author_email%>>
%% @copyright <%=TODAY.year%> <%=author_name%>
%%
%% @doc TODO make nice description
%%

-module(<%=application_name%>_app).
-author('<%=author_name%> <<%=author_email%>>').

-behaviour(application).
 
-export([start/2, stop/1]).

%% @spec start(_Type, _StartArgs)  -> {ok, Pid}
%% @doc Application start callback <%=application_name%>
start(_Type, _StartArgs) ->
   case <%=application_name%>_sup:start_link() of
      {ok, Pid} ->
          alarm_handler:clear_alarm({application_stopped, ?MODULE}),
          {ok, Pid};
      Error ->
          alarm_handler:set_alarm({{application_stopped, ?MODULE}, []}),
          Error
   end.

%% @spec stop(_State) -> ok
%% @doc Application stop callback for <%=application_name%>
stop(_State) ->
   alarm_handler:set_alarm({{application_stopped, ?MODULE}, []}),
   ok.
