%%
%% Application module
%%
%% File: <%=application_name%>_app.erl
%%

-module(<%=application_name%>_app).
-behaviour(application).
 
-export([start/2, stop/1]).
 
start(_Type, _StartArgs) ->
   case <%=application_name%>_sup:start_link() of
      {ok, Pid} ->
          alarm_handler:clear_alarm({application_stopped, ?MODULE}),
          {ok, Pid};
      Error ->
          alarm_handler:set_alarm({{application_stopped, ?MODULE}, []}),
          Error
   end.
 
stop(_State) ->
   alarm_handler:set_alarm({{application_stopped, ?MODULE}, []}),
   ok.
