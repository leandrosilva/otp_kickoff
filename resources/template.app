%%
%% Resource application file
%%
%% File   : <%=application_name%>.app
%% Created: <%=TODAY%>
%%
%% @author <%=author_name%> <<%=author_email%>>
%% @copyright <%=TODAY.year%> <%=author_name%>
%%
%% @doc TODO make nice description
%%

{application, <%=application_name%>,
 [{description, "<%=application_name.capitalize%> application version 1.0"},
  {vsn, "1.0"},
  {modules, [<%=application_name%>_sup, <%=application_name%>_app, <%=application_name%>_server]},
  {registered, [<%=application_name%>_sup]},
  {applications, [kernel, stdlib, sasl]},
	{env, [{var1, "Value of environment variable 1"}]}
  {mod, {<%=application_name%>_app, []}}
 ]}.
