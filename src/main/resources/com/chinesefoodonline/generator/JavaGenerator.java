package com.chinesefoodonline.generator;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Map;

import org.apache.ws.jaxme.js.JavaSource;

public class JavaGenerator extends ServiceGenerator {
	public JavaGenerator(File srcDir, File outDir, File templatedir) {
		super(srcDir, outDir, templatedir);
		setExtension(".java");
	}

	/*
	 * private void jdtParse(String code) {
	 * 
	 * ASTParser parser = ASTParser.newParser(AST.JLS2); parser.setKind(ASTParser.K_COMPILATION_UNIT);
	 * parser.setSource(code.toCharArray());
	 * 
	 * CompilationUnit node = (CompilationUnit) parser.createAST(null);
	 * 
	 * System.out.println("Node:"+node);
	 * 
	 * }
	 */

	protected void writeCode(JavaSource java, Map<String, String> nmap, Map<String, Object> rmap, String code)
			throws Exception {

		FileWriter fstream = null;

		if (!getOutDir().exists()) {
			getOutDir().mkdirs();
		} else {
			if (getOutDir().isFile())
				fstream = new FileWriter(getOutDir(), true);
		}

		if (fstream == null)
			fstream = new FileWriter(new File(getOutDir(), java.getClassName().substring(1) + getExtension()), false);

		BufferedWriter out = new BufferedWriter(fstream);
		out.write(code);
		out.flush();
		out.close();

	}

	public static void main(String[] args) {

		if (args.length < 5)
			return;

		JavaGenerator gen = new JavaGenerator(new File(args[0]), new File(args[1]), new File(args[2]));
		gen.setDefaultTemplate(args[3]);

		File dir = new File(args[4]);
		if (!dir.exists() || !dir.isDirectory())
			return;

		gen.checkDirectory(dir);

	}
}
