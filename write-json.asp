
<!--#include file="aspjson.asp" -->
<%
    Set oJSON = New aspJSON

    'Write single value
    oJSON.data("familyName") = "Smith"

    'Make collection
    Set oJSON.data("familyMembers") = oJSON.Collection()

    'Add instances to collection
    Set newitem = oJSON.AddToCollection(oJSON.data("familyMembers"))
    newitem.add "firstName", "John"
    newitem.add "age", 41
    newitem.add "gender", "Male"

    Set newitem = oJSON.AddToCollection(oJSON.data("familyMembers"))
    newitem.add "firstName", "Suzan"
    newitem.add "age", 38
    newitem.add "gender", "Female"

    Set newitem = oJSON.AddToCollection(oJSON.data("familyMembers"))
    newitem.add "firstName", "John Jr."
    newitem.add "age", 11
    newitem.add "gender", "Male"

    'Return the object
    Response.Write oJSON.JSONoutput()
%>