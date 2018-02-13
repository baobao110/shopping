package A;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Instance {
	public static ArrayList<GOODS> SetGoods(){
		PreparedStatement good=null;
		Connection goods=null;
		ResultSet re=null;
		ArrayList<GOODS> list=new ArrayList<GOODS>();
		try {
			 try {
				goods=Conn.instance();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 String sql="select * from goods;";
			 good=goods.prepareStatement(sql);
			 re=good.executeQuery();
			 while(re.next()){
				 GOODS a=new GOODS();
				 a.setCuntry(re.getString("country"));
				 a.setId(re.getInt("id"));
				 a.setName(re.getString("name"));
				 a.setPrice(re.getInt("price"));
				a.setPicture(re.getString("picture"));
				 list.add(a);
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				re.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				good.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public static GOODS GETGoods(int id){
		PreparedStatement good=null;
		Connection goods=null;
		ResultSet re=null;
		ArrayList<GOODS> list=new ArrayList<GOODS>();
		GOODS a=new GOODS();
		try {
			 try {
				goods=Conn.instance();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 String sql="select * from goods where id=?;";
			 good=goods.prepareStatement(sql);
			 good.setInt(1, id);
			 re=good.executeQuery();
			 while(re.next()){
				 a.setCuntry(re.getString("country"));
				 a.setId(re.getInt("id"));
				 a.setName(re.getString("name"));
				 a.setPrice(re.getInt("price"));
				a.setPicture(re.getString("picture"));
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			finally{
				try {
					re.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					good.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		return a;
	}
	
	public	static ArrayList<GOODS> history(String b)
	{
		ArrayList<GOODS> a = new ArrayList<GOODS>();
			String[] c=b.split(",");
			if(c.length>5){
				for(int i=c.length-1;i>c.length-6;i--){
					a.add(GETGoods(Integer.parseInt(c[i])));
				}
			}
				else{
					for(String i:c){
						a.add(GETGoods(Integer.parseInt(i)));
					}
				}
			return a;
	}
}
		
		
		
	
