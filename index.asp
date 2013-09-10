<!DOCTYPE html>
<html>
<head>
  <title>ASP&amp;STUFF</title>
  <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/pure/0.3.0/pure-nr-min.css" media="screen" />
  <script language="javascript" type="text/javascript">
    /** XHConn - Simple XMLHTTP Interface - bfults@gmail.com - 2005-04-08        **
     ** Code licensed under Creative Commons Attribution-ShareAlike License      **
     ** http://creativecommons.org/licenses/by-sa/2.0/                           **/
     function XHConn()
     {
      var xmlhttp, bComplete = false;
      try { xmlhttp = new ActiveXObject("Msxml2.XMLHTTP"); }
      catch (e) { try { xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); }
      catch (e) { try { xmlhttp = new XMLHttpRequest(); }
      catch (e) { xmlhttp = false; }}}
      if (!xmlhttp) return null;
      this.connect = function(sURL, sMethod, sVars, fnDone)
      {
        if (!xmlhttp) return false;
        bComplete = false;
        sMethod = sMethod.toUpperCase();
        try {
          if (sMethod == "GET")
          {
            xmlhttp.open(sMethod, sURL+"?"+sVars, true);
            sVars = "";
          }
          else
          {
            xmlhttp.open(sMethod, sURL, true);
            xmlhttp.setRequestHeader("Method", "POST "+sURL+" HTTP/1.1");
            xmlhttp.setRequestHeader("Content-Type",
              "application/x-www-form-urlencoded");
          }
          xmlhttp.onreadystatechange = function(){
            if (xmlhttp.readyState == 4 && !bComplete)
            {
              bComplete = true;
              fnDone(xmlhttp);
            }};
            xmlhttp.send(sVars);
          }
          catch(z) { return false; }
          return true;
        };
        return this;
      }

    // doAJAXCall : Generic AJAX Handler, used with XHConn
    // Author : Bryce Christensen (www.esonica.com)
    // PageURL : the server side page we are calling
    // ReqType : either POST or GET, typically POST
    // PostStr : parameter passed in a query string format 'param1=foo&param2=bar'
    // FunctionName : the JS function that will handle the response

    var doAJAXCall = function (PageURL, ReqType, PostStr, FunctionName) {

    	// create the new object for doing the XMLHTTP Request
    	var myConn = new XHConn();

    	// check if the browser supports it
    	if (myConn)	{

    	    // XMLHTTPRequest is supported by the browser, continue with the request
    	    myConn.connect('' + PageURL + '', '' + ReqType + '', '' + PostStr + '', FunctionName);    
       } 
       else {
    	    // Not support by this browser, alert the user
    	    alert("XMLHTTP not available. Try a newer/better browser, this application will not work!");   
       }
     }

    // launched from button click 
    var getMessage = function () {
    	
    	// build up the post string when passing variables to the server side page
    	var PostStr = "";
    	
    	// use the generic function to make the request
    	doAJAXCall('ajaxtest.asp', 'POST', '', showMessageResponse);
    }

    // The function for handling the response from the server
    var showMessageResponse = function (oXML) { 

        // get the response text, into a variable
        var response = oXML.responseText;
        
        // update the Div to show the result from the server
        document.getElementById("responseDiv").innerHTML = response;
      };

      </script>
    </head>
    <body>
      <h1>Lrn2ASPclassic&amp;stuff</h1>
      <hr/>
      <div class="pure-g">
        <div class="pure-u-1-2">
         <h3>Retrieving stuff from database</h3>

         <br/><br/>
         <!--#include file="connect-db.asp" -->
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

  <p><small>Arghh! Screw above codes. I couldn't make it work by calling external JSON file. (KIV'd)</small></p>
</div>

<div class="pure-u-1-3">
  I wanna try to <i>write</i> a JSON from ASP <i>(write-json.asp)</i> file pulak:

  <blockquote>
    <!-- #include file="write-json.asp" -->

  </blockquote>
  <p> <i>refer to <a href="http://www.jsonlint.com">JSONlint</a></i></p>
</div>
</div>
<hr/>

</body>
</html>