package com.chinesefoodonline.generator;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import org.apache.ws.jaxme.js.JavaMethod;
import org.apache.ws.jaxme.js.JavaQName;
import org.apache.ws.jaxme.js.JavaSource;
import org.apache.ws.jaxme.js.JavaSourceFactory;
import org.apache.ws.jaxme.js.Parameter;
import org.apache.ws.jaxme.js.util.JavaParser;

import freemarker.template.Configuration;
import freemarker.template.Template;



public class ServiceGenerator {
	private static final String DEFAULT_TEMPLATE1 = "defaultPackage.flt";
	private Configuration conf = null;
	char chars[] = new char[1024];
	private File srcDir;
	private File outDir;
	private String extension = ".java";
	private String defaultTemplate = DEFAULT_TEMPLATE1;

	public ServiceGenerator(File srcDir, File outDir, File templatedir) {

		this.srcDir = srcDir;
		this.outDir = outDir;

		conf = new Configuration();
		try {
			conf.setDirectoryForTemplateLoading(templatedir);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void checkJava(JavaSource java) throws IOException, ClassNotFoundException {
		JavaMethod[] methods = java.getMethods();

		String pck = java.getPackageName();
		String className = java.getClassName();

		/*
		 * String clazzName = pck + "." + className; Class clazz = Class.forName(clazzName);
		 * 
		 * for (int i = 0; i < methods.length; i++) { String name = methods[i].getName(); Parameter[] params =
		 * methods[i].getParams(); JavaQName jtype = methods[i].getType(); JavaQName objectType = jtype.getObjectType();
		 * 
		 * Method method = getReflectionMethod(clazz, name);
		 * 
		 * Type returnType = method.getGenericReturnType();
		 * 
		 * if (returnType instanceof ParameterizedType) { ParameterizedType type = (ParameterizedType) returnType;
		 * Type[] typeArguments = type.getActualTypeArguments();
		 * 
		 * if (typeArguments.length == 1) { Class typeArgClass = (Class) typeArguments[0];
		 * 
		 * String pathname = typeArgClass.getName();
		 * 
		 * pathname = pathname.replace('.', '/') + ".java";
		 * 
		 * try { JavaSource parsedJava = getParsedJava(new File(srcDir, pathname)); } catch (Exception e) {
		 * e.printStackTrace(); }
		 * 
		 * } else { System.err.println("Error ");
		 * 
		 * for (Type typeArgument : typeArguments) { Class typeArgClass = (Class) typeArgument;
		 * System.out.println("typeArgClass = " + typeArgClass); } } } else {
		 * 
		 * }
		 * 
		 * System.out.println(" name:" + name + " type:" + jtype);
		 * 
		 * }
		 */

	}

	private Method getReflectionMethod(Class clazz, String name) {
		Method[] methods = clazz.getMethods();
		if (methods == null)
			return null;

		for (int i = 0; i < methods.length; i++) {
			if (name.equals(methods[i].getName()))
				return methods[i];
		}

		return null;

	}

	public void generateCode(JavaSource java) throws Exception {

		String pck = java.getPackageName();
		String className = java.getClassName();
		Class clazz = Class.forName(pck + "." + className);

		String package_name = className.substring(0, className.length() - "Service".length()) + ".flt";

		Template template = null;

		try {
			template = conf.getTemplate(package_name);
		} catch (FileNotFoundException fnfe) {
			template = conf.getTemplate(defaultTemplate);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, String> nmap = new HashMap<String, String>();
		Map<String, Object> rmap = new HashMap<String, Object>();
		map.put("java", java);
		// map.put("methodnamemap", nmap);
		map.put("returnmap", rmap);

		JavaMethod[] methods = java.getMethods();
		for (int i = 0; i < methods.length; i++) {
			String name = methods[i].getName();
			Parameter[] params = methods[i].getParams();
			// nmap.put(name, getSQLNameStyle(java.getClassName(),name));

			// Method method = getReflectionMethod(clazz, name);

			// Type returnType = method.getGenericReturnType();
			JavaSource returnJavaType = null;
			JavaQName genericClass = methods[i].getType().getInstanceClass();

			if (genericClass != null) {
				returnJavaType = getParsedJava(genericClass.getPackageName() + "." + genericClass.getClassName());
			} else if (!methods[i].getType().isPrimitive()) {
				returnJavaType = getParsedJava(methods[i].getType().getPackageName() + "." + methods[i].getType().getClassName());
			}

			if (returnJavaType != null)
				rmap.put(name + (params != null ? params.length : 0), returnJavaType);

		}

		try {
			StringWriter out = new StringWriter(1000);
			template.process(map, out);
			out.flush();
			String code = out.getBuffer().toString();

			writeCode(java, nmap, rmap, code);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private JavaSource getParsedJava(String pathname) {
		pathname = pathname.replace('.', '/') + ".java";

		try {
			if (!pathname.startsWith("java")) {
				JavaSource parsedJava = getParsedJava(new File(srcDir, pathname));
				return parsedJava;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

	protected void writeCode(JavaSource java, Map<String, String> nmap, Map<String, Object> rmap, String code) throws Exception {

		File output = new File(outDir, java.getClassName() + extension);
		FileOutputStream fout = new FileOutputStream(output);
		fout.write(code.getBytes());
		fout.flush();
		fout.close();

	}

	private String getSQLNameStyle1(String className, String name) {
		StringBuilder buf = new StringBuilder(name.length() + 3);

		for (int i = 0; i < name.length(); i++) {
			if (name.charAt(i) == Character.toUpperCase(name.charAt(i))) {
				buf.append('_');
			}
			buf.append(name.charAt(i));
		}

		name = buf.toString();

		if (name.endsWith("_I_D"))
			name = name.substring(0, name.length() - 4) + "ID";

		if (name.length() > 30) {
			name = name.toUpperCase(Locale.ENGLISH);
			do {
				int ind = name.lastIndexOf("_ID");
				if (ind == -1)
					break;

				name = name.substring(0, ind) + name.substring(ind + 1);
				if (name.length() <= 30)
					break;
			} while (true);

			if (name.length() > 30) {
				do {
					int ind = name.lastIndexOf("_");
					if (ind == -1)
						break;

					name = name.substring(0, ind) + name.substring(ind + 1);
					if (name.length() <= 30)
						break;
				} while (true);
			}

			if (name.length() > 30)
				System.out.println(" className:" + className + " name:" + name + " length:" + name.length());
		}

		return name;
	}

	private JavaSource getParsedJava(File file) throws Exception {
		JavaSourceFactory jsf = new JavaSourceFactory();

		try {
			JavaParser javaParser = new JavaParser(jsf);
			FileInputStream fin = new FileInputStream(file);
			InputStreamReader reader = new InputStreamReader(fin);

			javaParser.parse(reader);

			return (JavaSource) jsf.getJavaSources().next();
		} catch (Exception e) {
			System.err.println("getParsedJava :" + e.getMessage());
		}

		return null;
	}

	public void checkJava(File file) throws Exception {

		if (!file.getName().endsWith(".java"))
			return;

		JavaSourceFactory jsf = new JavaSourceFactory();
		JavaParser javaParser = new JavaParser(jsf);
		FileInputStream fin = new FileInputStream(file);
		InputStreamReader reader = new InputStreamReader(fin);

		try {
			javaParser.parse(reader);

			for (Iterator iter = jsf.getJavaSources(); iter.hasNext();) {
				JavaSource js = (JavaSource) iter.next();
				generateCode(js);
				// checkJava(js);
			}
		} catch (Exception e) {
			System.out.println(" Problem :" + file.getAbsolutePath());
			throw e;
		}
	}

	public void checkDirectory(File dir) {

		File[] listFiles = dir.listFiles();
		if (listFiles == null)
			return;

		for (int i = 0; i < listFiles.length; i++) {
			if (listFiles[i].isFile()) {
				try {
					checkJava(listFiles[i]);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		for (int i = 0; i < listFiles.length; i++) {
			if (listFiles[i].isDirectory()) {
				try {
					checkDirectory(listFiles[i]);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}

	public static void main(String[] args) {

		if (args.length < 4)
			return;

		ServiceGenerator gen = new ServiceGenerator(new File(args[0]), new File(args[1]), new File(args[2]));

		File dir = new File(args[3]);
		if (!dir.exists() || !dir.isDirectory())
			return;

		gen.checkDirectory(dir);

	}

	public File getOutDir() {
		return outDir;
	}

	public void setOutDir(File outDir) {
		this.outDir = outDir;
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	public String getDefaultTemplate() {
		return defaultTemplate;
	}

	public void setDefaultTemplate(String defaultTemplate) {
		this.defaultTemplate = defaultTemplate;
	}
}
