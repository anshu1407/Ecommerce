package helper;

public class Helper {

	public static String get30words(String desc){
		String[] strs=desc.split(" ");
		
		if(strs.length>30)
		{
			String res="";
			for(int i=0;i<30;i++){
				res=res+strs[i]+" ";
			}
			return (res+"...");
		}
		else{
			return (desc+"...");
		}
	}
}
