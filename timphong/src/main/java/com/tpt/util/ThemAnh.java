package com.tpt.util;

import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.http.Part;

public class ThemAnh
{
	public static final String ThemAnh(Part part, String realPath, int temp)
	{
		String filename = null;
		String newFilename = part.getSubmittedFileName();
		if(newFilename != null)
		{
			try
			{
				String realFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
				int index = realFileName.lastIndexOf(".");
				String ext = realFileName.substring(index+1);
				Long time = System.currentTimeMillis() + temp;
				filename = time.toString() + "." + ext;
				if(!Files.exists(Paths.get(realPath)))
				{
					Files.createDirectories(Paths.get(realPath));
				}
				if(ext.length() != 0)
				{
					part.write(realPath + "/" + filename);
				}
				return filename;
			} catch (Exception e)
			{
				System.out.println("ERR");
			}
			
		}
		return null;
	}
}
