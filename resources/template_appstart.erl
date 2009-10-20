%%
%% Start application module
%%
%% File   : <%=application_name%>_handler.erl
%% Created: <%=Date.today%>
%%
%% @author <%=author_name%> <<%=author_email%>>
%% @copyright <%=today.year%> <%=author_name%>
%%
%% @doc TODO make nice description
%%

-module(<%=application_name%>).
-author('<%=author_name%> <<%=author_email%>>').

-export ([start/0, stop/0]).

%% @spec start() -> ok
%% @doc Start the <%=application_name%> application
start() ->
	application:start(<%=application_name%>).
	
%% @spec stop() -> ok
%% @doc Stop the <%=application_name%> application
stop() ->
	application:stop(%=application_name%>).