<!DOCTYPE html>
<html>
<head>
  <title>ASP&amp;STUFF</title>
  <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/pure/0.3.0/pure-nr-min.css" media="screen" />
  <link href='http://fonts.googleapis.com/css?family=Maven+Pro' rel='stylesheet' type='text/css'>
  <style type="text/css">
    body {color: #777;}
    h1 {color: rgb(31, 141, 214);}
  </style>
</head>
<body>
  <h1>Lrn2ASPclassic&amp;stuff</h1>
  <a href="#debug">Debugging field</a>
  <hr/>
  <div class="pure-g">
    <div class="pure-u-1-2">
     <h3>Retrieving stuff from database</h3>

     <br/><br/>
     <!--#include file="connect-db.asp" -->

    <form class="pure-form pure-form-aligned" method="post" action="controller.php">
        <fieldset>
          <label for="username">Username</label>
          <input type="text" name="username">
          <button type="submit" class="pure-button pure-button-primary">Create</button>
        </fieldset>
    </form>
   </div>

   <div class="pure-u-1-2">
     <h3>How about some ASP + AJAX</h3>
     <br/><br/>

     <button class="pure-button pure-button-small" onclick="javascript:getMessage();">Get Message From Server</button>
     <div id="responseDiv">Original Text</div>
   </div>
 </div>

 <h3>Let's do some stuff about JSON</h3>

 <div class="pure-g">
  <div class="pure-u-1-3">
    This is an example of how JSON would look like:
    <pre>
      {
      "firstName": "John",
      "lastName" : "Smith",
      "age"      : 25,
      "address"  :
      {
      "streetAddress": "21 2nd Street",
      "city"         : "New York",
      "state"        : "NY",
      "postalCode"   : "10021"
    },
    "phoneNumber":
    [
    {
    "type"  : "home",
    "number": "212 555-1234"
  },
  {
  "type"  : "fax",
  "number": "646 555-4567"
}
]
}
</pre>
</div>

<div class="pure-u-1-3">
  Neat! So let's <i>read</i> it via ASP:<br/>
  In order to do this, you need to #include <a href="http://www.aspjson.com"><i>aspjson.asp</i></a> in you local web folder.

  <blockquote>
    include file="read-json.asp"
  </blockquote>

  <p><small>Yay! I loaded that json file! It works! (:</small></p>
</div>

<div class="pure-u-1-3">
  I wanna try to <i>write</i> a JSON from ASP <i>(write-json.asp)</i> file pulak:

  <blockquote>
    <!-- #include file="write-json.asp" -->

  </blockquote>
  <p> <i>refer to <a href="http://www.jsonlint.com">JSONlint</a></i></p>
</div>
</div>

<!-- Use this block to debug your asp stuff -->
<div id="debug" class="pure-g">
  <div class="pure-u-1-3">
    <h3>Debugging Field</h3>
    

    <%=TypeName(CreateObject("Msxml2.DOMDocument.3.0"))%>
  </div>
</div>

<hr/>
<p><a href="http://www.twitter.com/aiaiaiman">@aiaiaiman</a></p>
</body>
<script language="javascript" type="text/javascript" src="ajax.js"></script>
</html>