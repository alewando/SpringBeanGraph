<%@ page import="java.io.*,java.util.*,org.apache.commons.lang3.*"%>
<%@ page import="org.springframework.context.support.*"%>
<%@ page import="org.springframework.web.context.support.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
// Note: there is a bug in Spring versions prior to 3.2.8 (or 4.0.2) that may generate invalid JSON.
//       If you are getting a parse error from D3 (unexpected ','), this may be why. See SPR-11366
LiveBeansView liveBeansView = new ServletContextLiveBeansView(request.getServletContext());
String content = liveBeansView.getSnapshotAsJson();
response.setContentType("application/json");
response.setContentLength(content.length());
response.getWriter().write(content);
%>