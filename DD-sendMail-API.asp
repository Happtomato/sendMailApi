<%@ Language=VBScript %>
<!-- #include virtual="/webshoplibrary/funclibwebshop.asp" -->
<!-- #include virtual="/webshoplibrary/funclibwebshopinit.asp" -->

<%
If Request.ServerVariables("REQUEST_METHOD")="GET" Then
	Response.Status="405 Method Not Allowed"
	
	Response.End
End If
varHashKey=checktext(Request.ServerVariables("HTTP_X-DD-Key"))
varMailReceiver=checktext(Request.ServerVariables("HTTP_X-DD-MailReceiver"))
varMailSubject=checktext(Request.ServerVariables("HTTP_X-DD-MailSubject"))
varMailContent=checktext(Request.ServerVariables("HTTP_X-DD-MailContent"))
varMailSender="""Dyoevents - Verfication"" <no.reply@flogintra.ch>"
	
If varHashKey<>"4471C30F-81F4-4487-A16D-20586BD569AE" Then
	varStatus = "403 Forbidden"
	
	Response.Status=varStatus
	Response.End
End If
if CheckMailAdress(varMailReceiver)=false or varMailReceiver="" then
	varStatus = "415 Invalid Mail Address"
	
	Response.Status=varStatus
	Response.End
end if
If varMailSubject="" or varMailContent="" Then
	varStatus = "415 Unsupported Media Type"
	
	Response.Status=varStatus
	Response.End
End If
SendMail varMailSender, "", "", varMailReceiver, "", "", varMailSubject, 0, varMailContent, ""
				
varStatus="200 OK"
Response.Status=varStatus
Response.Write "Mail Sent"
%>
