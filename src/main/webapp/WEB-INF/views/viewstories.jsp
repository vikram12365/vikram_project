<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>News Portal</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    header {
      background-color: #333;
      color: #fff;
      padding: 20px;
      text-align: center;
    }

    .container {
      max-width: 1200px;
      margin: 20px auto;
      padding: 0 20px;
    }

    .article {
      margin-bottom: 20px;
      border-bottom: 1px solid #ccc;
      padding-bottom: 20px;
    }

    .article h2 {
      font-size: 24px;
      margin: 0;
      margin-bottom: 10px;
    }

    .article p {
      font-size: 16px;
      margin: 0;
    }

    .article .meta {
      font-size: 14px;
      color: #777;
    }

    .sidebar {
      float: right;
      width: 300px;
    }

    .sidebar .widget {
      margin-bottom: 20px;
    }

    .sidebar h3 {
      font-size: 18px;
      margin: 0;
      margin-bottom: 10px;
    }

    .sidebar ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .sidebar ul li {
      margin-bottom: 10px;
    }

    .sidebar ul li a {
      color: #333;
      text-decoration: none;
    }
    
    .box {
            background-color: black;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        p {
            font-size: 17px;
            align-items: center;
        }
        .box a {
            display: inline-block;
            background-color: #fff;
            padding: 15px;
            border-radius: 3px;
        }
        .modal {
            align-items: center;
            display: flex;
            justify-content: center; 
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            transition: all 0.4s;
            visibility: hidden;
            opacity: 0;
    		
	    
        }
        .content {
            position: absolute;
            background: white;
            width: 400px;
            padding: 1em 2em;
            border-radius: 4px;
            max-height: 500px;
    		overflow-y: scroll;
	    	
        } 
        .modal:target {
            visibility: visible;
            opacity: 1;
        }
        .box-close {
            position: absolute;
            top: 0;
            right: 15px;
            color: #fe0606;
            text-decoration: none;
            font-size: 30px;
        }
    
    
    
  </style>
</head>
<body>

    <div id="popup-box" class="modal">
        <div class="content" style="border: 2px solid black;">
           <div id="s_comments">
           
           </div>
	
            <a href="#" 
               class="box-close">
                ×
            </a>
        </div>
    </div>

  <header>
    <h1>Top Stories Portal</h1>
  </header>

  <div class="container">
    <div class="sidebar">
<!--       <div class="widget"> -->
<!--         <h3>Categories</h3> -->
<!--         <ul> -->
<!--           <li><a href="#">Politics</a></li> -->
<!--           <li><a href="#">Business</a></li> -->
<!--           <li><a href="#">Technology</a></li> -->
<!--           <li><a href="#">Sports</a></li> -->
<!--         </ul> -->
<!--       </div> -->

<!--       <div class="widget"> -->
<!--         <h3>Popular Articles</h3> -->
<!--         <ul> -->
<!--           <li><a href="#">Article 1</a></li> -->
<!--           <li><a href="#">Article 2</a></li> -->
<!--           <li><a href="#">Article 3</a></li> -->
<!--           <li><a href="#">Article 4</a></li> -->
<!--         </ul> -->
<!--       </div> -->
    </div>

    <div class="main-content">
      <div class="article">
        <h2 id="title1"></h2>
        <p id="story1"></p>
        <input type="hidden" id="story_id1" name="story_id1">
        <p class="meta"><a href="#popup-box" onclick="callComments(1)">Comments</a></p>
      </div>

      <div class="article">
        <h2 id="title2"></h2>
        <p id="story2"></p>
        <input type="hidden" id="story_id2" name="story_id2">
		<p class="meta"><a href="#popup-box" onclick="callComments(2)">Comments</a></p>
</div>

<div class="article">
        <h2 id="title3"></h2>
        <p id="story3"></p>
        <input type="hidden" id="story_id3" name="story_id3">
	<p class="meta"><a href="#popup-box" onclick="callComments(3)">Comments</a></p>
</div>

<div class="article">
        <h2 id="title4"></h2>
        <p id="story4"></p>
        <input type="hidden" id="story_id4" name="story_id4">
<p class="meta"><a href="#popup-box" onclick="callComments(4)">Comments</a></p>
</div>
</div>
</div>
</body>
<script>

window.addEventListener("load", (event) => {
	var age = 18;
	var expire_time = localStorage.getItem("date");
	var diffmints=0;

if(expire_time == null)
	{
	diffmints = 16;
		
	}
else
	{
	
	var year1 = localStorage.getItem("year");
	var month1 = localStorage.getItem("month");
	var day1 = localStorage.getItem("date");
	
	var hours1 = localStorage.getItem("hours");
	var mins1 = localStorage.getItem("min");
	var sec1 = localStorage.getItem("sec");
	var check_date = new Date(year1,month1,day1,hours1,mins1,sec1);
	var currentdate = new Date();
	var inminutes = 60 * 1000; // hours*minutes*seconds*milliseconds
    diffmints = Math.abs((check_date.getTime() - currentdate.getTime()) / (inminutes));
	}
	
if(diffmints > 15)
	{
	localStorage.removeItem("year");
	localStorage.removeItem("month");
	localStorage.removeItem("date");
	localStorage.removeItem("hours");
	localStorage.removeItem("min");
	localStorage.removeItem("sec");
	for(var i=0;i<4;i++)
	{
		localStorage.removeItem("storytitle"+k);
		localStorage.removeItem("storydetails"+k);
		localStorage.removeItem("storyid"+k);
	}
	var requestOptions = {
			  method: 'GET',
			  redirect: 'follow'
			};

			fetch("http://localhost:8099/getTopStories", requestOptions)
			  .then(response => response.text())
			  .then(result => {var data = JSON.parse(result);
			  
			  for(var i=0;i<data.length;i++)
				  {
				  k=i+1;
				  document.getElementById("title"+k).innerHTML=data[i].title;
				  document.getElementById("story"+k).innerHTML=data[i].story_details;
				  document.getElementById("story_id"+k).value=data[i].story_id;
				  
				  localStorage.setItem("storydetails"+k,data[i].story_details);
				  localStorage.setItem("storytitle"+k,data[i].title);
				  localStorage.setItem("storyid"+k,data[i].story_id);
				  
				  var nowdate = new Date();
				  var date = nowdate.getDate();   
				  var month = (nowdate.getMonth()); 
				  var year = nowdate.getFullYear();
				  var hours = nowdate.getHours();
				  var min =nowdate.getMinutes();
				  var sec = nowdate.getSeconds(); 
				  
				  localStorage.setItem("date",date);
				  localStorage.setItem("month",month);
				  localStorage.setItem("year",year);
				  
				  localStorage.setItem("hours",hours);
				  localStorage.setItem("min",min);
				  localStorage.setItem("sec",sec);
				  
				  }
			  })
			  .catch(error => console.log('error', error));	
	}
else
	{
	for(var i=0;i<4;i++)
		{
		var k=i+1;
		document.getElementById("title"+k).innerHTML=localStorage.getItem("storytitle"+k);
		document.getElementById("story"+k).innerHTML=localStorage.getItem("storydetails"+k);
		document.getElementById("story_id"+k).value=localStorage.getItem("storyid"+k);
		}
	}

	
	
	});


//localStorage.removeItem("mytime");

		
		function callComments(a)
		{
			var k = document.getElementById("story_id"+a).value;
			var comments = "";
			var requestOptions = {
					  method: 'GET',
					  redirect: 'follow'
					};

					fetch("http://localhost:8099/getComments?story_id="+k, requestOptions)
					  .then(response => response.text())
					  .then(result => {
						  
						var data = JSON.parse(result);
					  for(var i=0;i<data.length;i++)
						  {
						  comments = comments + "<p>"+data[i].comment+"</p><br>";
						  }
					    document.getElementById("s_comments").innerHTML=comments;
					  
					  })
					  .catch(error => console.log('error', error));
			
		}
</script>
</html>