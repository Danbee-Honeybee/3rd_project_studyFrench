package net.hb.crud;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class LoginDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public int login(LoginDTO dto) {
		return temp.selectOne("login.select", dto); //custid가 있다면 1
	}
	public int idcheckSave(String custid) {
		int cnt = temp.selectOne("login.idcheck", custid);//custid가 있다면 1
		return cnt; 
	}
}
