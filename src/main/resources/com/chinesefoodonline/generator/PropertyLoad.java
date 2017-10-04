package com.chinesefoodonline.generator;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

public class PropertyLoad {
	// private Properties properties;

	private static Properties loadProperty(File xml) throws IOException {
		Properties prop = new Properties();
		FileInputStream fin = new FileInputStream(xml);
		prop.loadFromXML(fin);
		fin.close();

		return prop;
	}

	private static void saveProperty(File out, Properties prop) throws IOException {

		FileOutputStream fout = new FileOutputStream(out);
		prop.storeToXML(fout, null, "UTF-8");
		fout.close();
	}

	public static void main(String[] args) {

		File outfile = new File(args[0]);

		Properties prop = new Properties();

		for (int i = 1; i < args.length; i++) {
			try {
				Properties curprop = loadProperty(new File(args[i]));
				prop.putAll(curprop);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		try {
			saveProperty(outfile, prop);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
