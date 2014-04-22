import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

public class IOTest {
	public static void handleFile(String inName, String outName) throws IOException {
		System.out.print(System.currentTimeMillis()+";");
		File in = new File(inName);
		int size = (int) in.length();
		FileInputStream ins = new FileInputStream(in);
		FileChannel channel = ins.getChannel();
		ByteBuffer bb = ByteBuffer.allocateDirect(size);
		int nRead=channel.read( bb );
		ins.close();
		if(nRead != size){
			System.out.println("Only read "+ nRead + "bytes instead of " + size);
			System.exit(1);
			
		}
		System.out.print(System.currentTimeMillis()+";");
		File out = new File(outName);
//		System.out.println("Writing: " + out.getAbsoluteFile());
		FileOutputStream outs = new FileOutputStream(out);
		channel = outs.getChannel();
		bb.flip();
		int nWritten=channel.write( bb );
		outs.close();
		if(nWritten != size){
			System.out.println("Only wrote "+ nWritten + "bytes instead of " + size);
			System.exit(1);
		}
		
		System.out.println(System.currentTimeMillis());
		
	}
	
	public static void main(String[] args) throws IOException{
		File test = new File(".");
//		System.out.println(test.getAbsolutePath());
		if (args.length != 1){
			System.out.println("usage: IOTest <directory>\n");
			System.exit(1);
		}
		for (int i = 0; i <= 999; i++){
			String filename = args[0]+String.format("/small%03d.rnd", i);
//			System.out.println(filename);
			handleFile(filename, filename+".out");
		}
		String filename = args[0]+"/big.rnd";
		handleFile(filename, filename+".out");
	}
}
