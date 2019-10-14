package controller.post;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.servlet.*;

import model.Post;
import model.dao.PostDAO;


@SuppressWarnings("serial")
public class MultipartHttpServletRequest extends HttpServlet {
	
	private HttpServletRequest request;
	Post post = null;

	public MultipartHttpServletRequest(HttpServletRequest request) {
        this.request = request;

		
		
		HttpSession session = request.getSession();
		
		String post_title = "";
		String post_content = "";
		String usage = "";
		String file_link = "";
		String filename = ""; 
		String thumnail = "";
		List<String> color = new ArrayList<String>();
		
		
	
		boolean check = ServletFileUpload.isMultipartContent(request);
		
		
		if(check) {
			ServletContext context = request.getServletContext();
			String path = context.getRealPath("/img");
			File dir = new File(path);
			if(!dir.exists()) dir.mkdir();
			
			String path2 = context.getRealPath("/templet");
			File dir2 = new File(path2);
			if(!dir2.exists()) dir2.mkdir();
			
			
			try {
				DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(10 * 1024);
                factory.setRepository(dir);            
    
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(10 * 1024 * 1024);
                upload.setHeaderEncoding("UTF-8");
                                
                List items = (List)upload.parseRequest(request);
                for(int i = 0; i < items.size(); ++i) {
                	FileItem item = (FileItem)items.get(i);
                	
                	
                	String value = item.getString("UTF-8");
                	
                	
                	if(item.isFormField()) {           		
                		if(item.getFieldName().equals("post_title")) post_title = value;
                		else if(item.getFieldName().equals("post_content")) post_content = value;
                		else if(item.getFieldName().equals("usage")) usage = value;
                		else if(item.getFieldName().equals("file_link")) file_link = value;
                		else if(item.getFieldName().equals("color")) color.add(value);
       			
                		
                	}
                	else {
                		if(item.getFieldName().equals("file")) {
                			filename = item.getName();
                			if(filename == null || filename.trim().length() == 0) continue;
                			filename = filename.substring(filename.lastIndexOf("\\") + 1);
                			File file = new File(dir2, filename);
                			item.write(file);
                			
                		}
                		else if(item.getFieldName().equals("thumnail")) {
                 
                			thumnail = item.getName();
                    			if(thumnail == null || thumnail.trim().length() == 0) thumnail = "deThum.png";
                    			else {
                    				thumnail = thumnail.substring(thumnail.lastIndexOf("\\") + 1);
                    				File file = new File(dir, thumnail);
                    				item.write(file);}

                    		}
                	}
                }
                
			}catch(SizeLimitExceededException e) {
				e.printStackTrace();           
            }catch(FileUploadException e) {
                e.printStackTrace();
            }catch(Exception e) {            
                e.printStackTrace();
            }
            
			
			post = new Post( (String)session.getAttribute("user"), post_title, 
					post_content, file_link, filename, usage, thumnail, color ); 
			
		}		
	}
}

