package com.chinesefoodonline.generator;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Locale;
import java.util.Map;

import org.apache.ws.jaxme.js.JavaSource;

public class SQLGenerator extends ServiceGenerator {

	public SQLGenerator(File srcDir, File outDir, File templatedir) {
		super(srcDir, outDir, templatedir);
		setExtension(".sql");
	}

	protected void writeCode(JavaSource java, Map<String, String> nmap, Map<String, Object> rmap, String code)
			throws Exception {

		String name = java.getClassName().substring(1);
		name = name.substring(0, name.length() - "Service".length());
		name = name.toUpperCase(Locale.ENGLISH);

		FileWriter fstream = null;

		if (!getOutDir().exists()) {
			getOutDir().mkdirs();
		} else {
			if (getOutDir().isFile())
				fstream = new FileWriter(getOutDir(), true);
		}

		if (fstream == null)
			fstream = new FileWriter(new File(getOutDir(), name + getExtension()), false);

		BufferedWriter out = new BufferedWriter(fstream);

		out.write(code);
		out.flush();
		out.close();
	}

	public static void main(String[] args) {

		if (args.length < 5)
			return;

		SQLGenerator gen = new SQLGenerator(new File(args[0]), new File(args[1]), new File(args[2]));
		gen.setDefaultTemplate(args[3]);

		File dir = new File(args[4]);
		if (!dir.exists() || !dir.isDirectory())
			return;

		gen.checkDirectory(dir);

	}

}
