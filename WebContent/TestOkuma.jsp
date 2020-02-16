<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<input type="file" accept="text/plain" id="SinavIsaretlemeleri" onchange="openFile(event)"/><br>
    <div id='output'>
    ...
    </div>
	
	<script>
      var openFile = function(event) {
        var input = event.target;

        var reader = new FileReader();
        reader.onload = function(){
          var text = reader.result;
          console.log(reader.result.substring(0, 200));
          Kontrol(text);
        };
        reader.readAsText(input.files[0],'windows-1254');
      	
      };
      
      function Kontrol(text) {
          var node = document.getElementById('output');
          var KayitSayisi = (text.match(/\n/g)||[]).length;
          var ilkSatir = text.split('\n')[4];
          node.innerText = text;
          
      }
      
    </script>
	
</body>
</html>