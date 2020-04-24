<%@page import="orm.dao.SqlMapCommonDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	List<Map<String,Object>> zdoList= null;
 	SqlMapCommonDao smcd = new SqlMapCommonDao();
 	zdoList = smcd.getZDOList(null);
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax실전연습-[1.ajax,2.html+js,3.mybatis]</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	table{border:1px solid #CCAAFF; }
	td { border:1px dashed black; text-align:center;}
	select {width:170px;}
	
</style>
<script type="text/javascript">
	function siguIn(){
		$('#i_sigu').change(function(){
			$('#i_sigu option:selected').each(function(){
				$('#sigu').val($(this).text());
			});
		});
	}
</script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#i_zdo').change(function(){
			$('#i_zdo option:selected').each(function(){
				var p_zdo = $(this).text();
				$('#zdo').val(p_zdo);
				var param="zdo="+p_zdo;
				$.ajax({
					method:"get"
					,url:"getSIGUList.jsp?" + param
					,success:function(result){
						$('#d_sigu').html(result);
						siguIn();
					}
				});
			});
		});
	});

</script>
<table width="700px" height="100px" cellpadding="0px" cellspacing="0px">
	<tr>
		<td width="30px"><label>시도</label> </td>
		<td width="100px">
			<select id="i_zdo" width="100px">
<%
	for(int i=0; i<zdoList.size();i++){
		Map<String,Object> rmap = zdoList.get(i);
	
%>	
	<option value='<%=rmap.get("ZDO")%>'><%=rmap.get("ZDO") %></option>		
<%
	}
%>
			</select>
		</td>
		<td width="30px"><label>구</label>		
		<td width="100px" id="d_sigu">
			
		<td width="30px"><label>동</label>		
		<td width="100px" >
			
		</td>
	</tr>	
	<tr>
		<td width="30px"><label>시도</label> </td>
		<td width="100px">
			<input type="text" id="zdo" name="zdo" />
 	     </td>
		<td width="30px"><label>구</label> </td>
		<td width="100px">
			<input type="text" id="sigu" name="sigu" />
 	     </td>
		<td width="30px"><label>동</label> </td>
		<td width="100px">
			<input type="text" id="dong" name="dong" />
 	     </td>
		
	</tr>
</table>
</body>
</html>