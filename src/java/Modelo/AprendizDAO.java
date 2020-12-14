package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AprendizDAO implements Validar{
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    @Override
    public int Validar(Aprendiz usu) {
        int r = 0;
        String sql = "Select * from usuarios where nombre=? and email=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getNombre());
            ps.setString(2, usu.getEmail());
            rs=ps.executeQuery();
            while(rs.next()){
                r += 1;
                usu.setNombre(rs.getString("nombre"));
                usu.setEmail(rs.getString("email"));
            }
            if(r == 1){
                return 1;
            }else{
                return 0;
            }
        } catch(Exception e){
            return 0;  
        }

    } 
    
}
