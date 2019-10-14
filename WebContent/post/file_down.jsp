<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*" %>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>

<%@ page import="java.net.URLEncoder"%>
 
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
 
<%
try {
 
    String header = request.getHeader("User-Agent");
    
    
    String path = new String(request.getAttribute("path").toString().getBytes("utf-8"), "ISO-8859-1");
    String fileName = new String(request.getAttribute("fileName").toString().getBytes("utf-8"), "ISO-8859-1");
    String viewFileName = "";
    
    if (header.contains("MSIE") || header.contains("Trident")) {      
        viewFileName = URLEncoder.encode(request.getAttribute("viewFileName").toString(),"UTF-8").replaceAll("\\+", "%20");
    } else {                                                            
        viewFileName = new String(request.getAttribute("viewFileName").toString().getBytes("utf-8"), "ISO-8859-1");
    }
    
 
    File file = new File(path+fileName);
 
    response.reset();        
 
    response.setContentType("application/octer-stream");
 
   
    response.setHeader("Content-Disposition", "attachment;filename=" + viewFileName + "");
    response.setHeader("Content-Transper-Encoding", "binary");    
    response.setContentLength((int) file.length());                
    response.setHeader("Pargma", "no-cache");response.setHeader("Expires", "-1");
 
    byte[] data = new byte[2048];
    
    FileInputStream fis = new FileInputStream(file);
    BufferedInputStream bis = new BufferedInputStream(fis);
    BufferedOutputStream fos = new BufferedOutputStream(response.getOutputStream());
 
    int count = 0;
    while ((count = bis.read(data)) != -1) {
        fos.write(data,0,count);
    }
 
    if (fis != null)
        fis.close();
    if (bis != null)
        bis.close();
    if (fos != null)
        fos.close();
    
    
    
} catch (Exception e) {
    System.out.println("download error : " + e);
} finally{
    
}
 
out.clear();
out = pageContext.pushBody();
 
%>
