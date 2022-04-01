<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>      
<%@ page import="data.Question" %>    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vaalikone</title>

</head>
<body>
<h2>Vaalikone</h2>
<h3>Vastaa kysymyksiin:</h3>
	<div>
		<input type = "radio" id = "Vahvasti eri mieltä" name = "vastaus" value = "Vahvasti eri mieltä"
			checked>
		<label for = "Vahvasti eri mieltä" >Vahvasti eri mieltä</label>
	</div>
	
	<div>
		<input type = "radio" id = "Jokseenkin eri mieltä" name = "vastaus" value = "Jokseenkin eri mieltä"
			checked>
		<label for = "Jokseenkin eri mieltä" >Jokseenkin eri mieltä</label>
	</div>
	
	<div>
		<input type = "radio" id = "En osaa sanoa" name = "vastaus" value = "En osaa sanoa"
			checked>
		<label for = "En osaa sanoa" >En osaa sanoa</label>
	</div>
	
	<div>
		<input type = "radio" id = "Jokseenkin samaa mieltä" name = "vastaus" value = "Jokseenkin samaa mieltä"
			checked>
		<label for = "Jokseenkin samaa mieltä" >Jokseenkin samaa mieltä</label>
	</div>
	
	<div>
		<input type = "radio" id = "Vahvasti samaa mieltä" name = "vastaus" value = "Vahvasti samaa mieltä"
			checked>
		<label for = "Vahvasti samaa mieltä" >Vahvasti samaa mieltä</label>
	</div>
	<ol>
		<c:forEach var="kysymys" items="${requestScope.questionlist}" >			
			<li>${kysymykset.id}: ${kysymykset.kysymys} 
		</c:forEach>
	</ol>
	
<%
ArrayList<Question> questionList=(ArrayList<Question>)request.getAttribute("questionlist");			//jsp voi sisältää java-koodia

for (int i=0;questionList!=null && i<questionList.size();i++){
	Question q=questionList.get(i);
	out.println(q.getId()+": "+q.getKysymys()+"<a href='/delete?id="+q.getId()+"'>delete</a> <a href='/readtoupdate?id="+q.getId()+"'>update</a>");
}
%>

</body>
</html>
