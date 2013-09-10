<!--#include file="aspjson.asp" -->
<%
    Set oJSON = New aspJSON

    'Load JSON string
    oJSON.loadJSON(jsonstring)

    'Get single value
    Response.Write oJSON.data("firstName") & "<br>"

    'Loop through collection
    For Each subItem In oJSON.data("address")
        Response.Write subItem & ": " & _
        oJSON.data("address").item(subItem) & "<br>"
    Next

    'Update/Add value
    oJSON.data("firstName") = "James"

    'Return the object
    Response.Write oJSON.JSONoutput()
%>
